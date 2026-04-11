#!/usr/bin/env bash

set -euo pipefail

run() {
  echo "+ $*"
  "$@"
}

is_tty_interactive() {
  [ -t 0 ] && [ -t 1 ]
}

can_prompt_for_update() {
  [ -z "${CI-}" ] && is_tty_interactive
}

prompt_yes_no_default_yes() {
  local prompt="$1"
  local answer=""

  if ! can_prompt_for_update; then
    return 1
  fi

  printf "%s [Y/n] " "$prompt" > /dev/tty
  if ! IFS= read -r answer < /dev/tty; then
    return 0
  fi

  case "$answer" in
    n|N|no|NO)
      return 1
      ;;
    *)
      return 0
      ;;
  esac
}

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"
REPO_NAME="$(basename "$PROJECT_ROOT")"
SELF_SCRIPT_PATH="$PROJECT_ROOT/scripts/install_agents.sh"

check_and_offer_repo_update() {
  local current_branch=""
  local remote_ref=""
  local local_sha=""
  local remote_sha=""
  local base_sha=""

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return 0
  fi

  if [ ! -d "$PROJECT_ROOT/.git" ] && [ ! -f "$PROJECT_ROOT/.git" ]; then
    return 0
  fi

  if ! git remote get-url origin >/dev/null 2>&1; then
    return 0
  fi

  current_branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || true)"
  if [ -z "$current_branch" ]; then
    echo "[WARN] [$REPO_NAME] Detached HEAD detectado. A checagem automática de atualização foi ignorada."
    return 0
  fi

  if git status --porcelain --untracked-files=normal | grep -q .; then
    echo "[WARN] [$REPO_NAME] Há alterações locais. A atualização automática foi ignorada."
    return 0
  fi

  if ! git fetch origin "$current_branch" >/dev/null 2>&1; then
    echo "[WARN] [$REPO_NAME] Não foi possível verificar atualizações no remoto. Continuando com a versão local."
    return 0
  fi

  remote_ref="origin/$current_branch"
  if ! git show-ref --verify --quiet "refs/remotes/$remote_ref"; then
    echo "[WARN] [$REPO_NAME] A branch remota '$remote_ref' não foi encontrada. Continuando com a versão local."
    return 0
  fi

  local_sha="$(git rev-parse HEAD)"
  remote_sha="$(git rev-parse "$remote_ref")"
  base_sha="$(git merge-base HEAD "$remote_ref")"

  if [ "$local_sha" = "$remote_sha" ]; then
    return 0
  fi

  if [ "$local_sha" != "$base_sha" ]; then
    echo "[WARN] [$REPO_NAME] O repositório local divergiu de '$remote_ref'. A atualização automática foi ignorada."
    return 0
  fi

  echo "[WARN] [$REPO_NAME] Há uma atualização disponível em '$remote_ref'."

  if ! can_prompt_for_update; then
    echo "[WARN] [$REPO_NAME] Sem TTY ou em CI. Continuando sem perguntar."
    return 0
  fi

  if prompt_yes_no_default_yes "[$REPO_NAME] A newer version is available. Would you like to update now?"; then
    echo "[INFO] Atualizando '$REPO_NAME'..."
    run git pull --ff-only origin "$current_branch"
    echo "[INFO] Reiniciando o comando com a versão atualizada de '$REPO_NAME'..."
    exec bash "$SELF_SCRIPT_PATH" "$@"
  fi

  echo "[INFO] [$REPO_NAME] Continuando sem atualizar."
}

check_and_offer_repo_update "$@"

if ! command -v apt >/dev/null 2>&1; then
  echo "[ERRO] Este script foi preparado para sistemas com o gerenciador de pacotes 'apt'."
  exit 1
fi

if [ "$(id -u)" -eq 0 ]; then
  SUDO=""
elif command -v sudo >/dev/null 2>&1; then
  SUDO="sudo"
else
  echo "[ERRO] O script precisa de 'sudo' para instalar dependências do sistema."
  exit 1
fi

echo "[INFO] Projeto: $PROJECT_ROOT"

# Manter o sistema limpo e atualizado antes da configuração.
run ${SUDO} apt clean
run ${SUDO} apt autoclean
run ${SUDO} apt autoremove -y
run ${SUDO} apt update
run ${SUDO} apt --fix-broken install -y
run ${SUDO} apt clean
run ${SUDO} apt list --upgradable || true
run ${SUDO} apt full-upgrade -y

# Dependências mínimas para trabalhar com o repositório.
run ${SUDO} apt install git python3 python3-venv python3-pip -y

if [ -f .gitmodules ]; then
  echo "[INFO] Inicializando submódulos do projeto..."
  run git submodule update --init --recursive
fi

if [ ! -d .venv ]; then
  echo "[INFO] Criando ambiente virtual Python local..."
  run python3 -m venv .venv
fi

# shellcheck disable=SC1091
source .venv/bin/activate
run python3 -m pip install --upgrade pip

if [ -s requirements.txt ]; then
  echo "[INFO] Instalando dependências listadas em requirements.txt..."
  run python3 -m pip install -r requirements.txt
else
  echo "[INFO] requirements.txt vazio ou ausente. Nenhuma dependência Python adicional foi instalada."
fi

echo "[INFO] Verificando ferramentas principais..."
run git --version
run python3 --version
run python3 -m pip --version
run git submodule status || true

cat <<'EOF'
[INFO] Configuração concluída.
[INFO] Para reutilizar o ambiente virtual depois, execute:
source .venv/bin/activate
EOF
