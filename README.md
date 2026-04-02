# Como instalar/configurar/usar o `agents` no `Linux Ubuntu`

Neste documento estão contidos os principais comandos e configurações para instalar/configurar/usar o `agents` no `Linux Ubuntu`.

## _Abstract_

_This document contains the main commands and settings to install/configure/use the `agents` on `Linux Ubuntu`._

## Descrição

### `agents`

O `agents` é um repositório para consolidar instruções específicas de cada agente no **ChatGPT Codex**. Ele serve como um índice central para guias de Git, LaTeX, Python, e outros, permitindo que cada agente seja editado e mantido de forma independente.

## Pré-requisitos

- `Git` instalado
- SSH key configurada no `GitHub`
- Acesso ao `GitHub` (repositório `edftechnology/agents`)

## 1. Configurar/Instalar/Usar o repo `agents` no repositório do seu projeto

Para configurar/instalar/usar o `agents`, siga os passos abaixo:

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

    ```bash
    Ctrl + Alt + T
    ```

2. Certifique-se de que seu sistema esteja limpo e atualizado.

    2.1 Limpar o `cache` do gerenciador de pacotes `apt`. Especificamente, ele remove todos os arquivos de pacotes (`.deb`) baixados pelo `apt` e armazenados em `/var/cache/apt/archives/`. Digite o seguinte comando:
    ```bash
    sudo apt clean
    ```

    2.2 Remover pacotes `.deb` antigos ou duplicados do `cache` local. É útil para liberar espaço, pois remove apenas os pacotes que não podem mais ser baixados (ou seja, versões antigas de pacotes que foram atualizados). Digite o seguinte comando:
    ```bash
    sudo apt autoclean
    ```

    2.3 Remover pacotes que foram automaticamente instalados para satisfazer as dependências de outros pacotes e que não são mais necessários. Digite o seguinte comando:
    ```bash
    sudo apt autoremove -y
    ```

    2.4 Buscar as atualizações disponíveis para os pacotes que estão instalados em seu sistema. Digite o seguinte comando e pressione `Enter`:
    ```bash
    sudo apt update
    ```

    2.5 **Corrigir pacotes quebrados**: Isso atualizará a lista de pacotes disponíveis e tentará corrigir pacotes quebrados ou com dependências ausentes:
    ```bash
    sudo apt --fix-broken install
    ```

    2.6 Limpar o `cache` do gerenciador de pacotes `apt novamente:
    ```bash
    sudo apt clean
    ```

    2.7 Para ver a lista de pacotes a serem atualizados, digite o seguinte comando e pressione `Enter`:
    ```bash
    sudo apt list --upgradable
    ```

    2.8 Realmente atualizar os pacotes instalados para as suas versões mais recentes, com base na última vez que você executou `sudo apt update`. Digite o seguinte comando e pressione `Enter`:
    ```bash
    sudo apt full-upgrade -y
    ```

3. Acessar a pasta do seu projeto:

    ```bash
    cd <caminho_ate_o_projeto>
    ```

4. Clonar o `agents`:

    ```bash
    git submodule add --force \
        git@github.com:edftechnology/agents.git \
        subs/submodules/agents
    ```

## 1.1 Código completo para configurar/instalar/usar

Para configurar/instalar/usar o `agents` no `Linux Ubuntu` sem precisar digitar linha por linha, você pode seguir estas etapas:

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

    ```bash
    Ctrl + Alt + T
    ```

2. Digite o seguinte comando e pressione `Enter`:

    ```bash
    NÃO há.
    ```

## 2. Problemas muito comuns com o `git submodules`

### 2.1 Problema de `SSH` (erro: `Permission denied (publickey)`)

1. Quando o submódulo usa `SSH`:

    ```bash
    git@github.com:edftechnology/agents.git
    ```

    o Git exige que sua **chave `SSH` esteja configurada**.

#### 2.1.1 Verificar se existe chave SSH

1. Para verificar se existe chave `ssh`:

    ```bash
    ls ~/.ssh
    ```

    Se existir algo como:

    ```bash
    id_rsa
    id_rsa.pub
    ```

    ou

    ```bash
    id_ed25519
    id_ed25519.pub
    ```

    então a chave já existe.

### 2.1.2 Testar conexão com GitHub

1. Para testar a conexão com o `github`:

    ```bash
    ssh -T git@github.com
    ```

    Saída esperada:

    ```bash
    Hi <username>! You've successfully authenticated...
    ```

    Se der erro, será necessário gerar chave:

    ```bash
    ssh-keygen -t ed25519 -C "seu_email"
    ```

    Depois adicionar a chave pública no GitHub.

## 2.2 Clonar projeto sem baixar os `submodules`

1. Clonar projeto sem baixar os `submodules`:

    Se alguém fizer apenas:

    ```bash
    git clone <repositorio>
    ```

    os submódulos **não serão baixados**.

    A pasta aparecerá vazia.

    Forma correta de clonar

    ```bash
    git clone --recurse-submodules <repositorio>
    ```

    ou depois:

    ```bash
    git submodule update --init --recursive
    ```

### 2.3 `Submodule` não atualiza automaticamente

Submodules **não seguem automaticamente o `commit` mais recente** do repositório remoto.

Ou seja:

Mesmo que `agents` tenha atualização no `GitHub`, o projeto principal continua apontando para o `commit` antigo.

#### 2.3.1 Atualizar um `submodule`

1. Para atualizar um `submodule`:

    Entre na pasta do submodule:

    ```bash
    cd subs/submodules/agents
    ```

2. Depois:

    ```bash
    git pull origin main
    ```

3. Volte para o projeto:

    ```bash
    cd ../../../
    ```

4. Agora registre a atualização:

    ```bash
    git add subs/submodules/agents
    git commit -m "Update agents submodule"
    ```

### 2.4 Problema comum com `.gitmodules`

1. O arquivo `.gitmodules` controla os submódulos.

    Exemplo típico:

    ```bash
    [submodule "subs/submodules/agents"]
        path = subs/submodules/agents
        url = git@github.com:edftechnology/agents.git
    ```

    Se o URL mudar, você precisa atualizar:

    ```bash
    git submodule sync
    ```

### 2.5 Atualizar todos os `submodules` de uma vez

1. Muito útil quando o projeto tem vários `submodules` (como nos seus repositórios):

    ```bash
    git submodule update --remote --merge
    ```

    ou

    ```bash
    git pull --recurse-submodules
    ```

### 2.6 Verificar `submodules` instalados

1. Verificar `submodules` instalados:

    ```bash
    git submodule status
    ```

    Exemplo:

    ```bash
    a3f8c9c subs/submodules/agents
    ```

## Boa prática para projetos grandes (como os seus com subs/submodules)

1. Sempre usar:

    ```bash
    git clone --recurse-submodules
    ```

    e depois atualizar com:

    ```bash
    git submodule update --init --recursive
    ```

## Compatibilidade

- Testado em `Linux Ubuntu` (recomendado `22.04+`).
- Deve funcionar em `Debian` e `WSL`, desde que o `Git` e o `Bash` estejam disponíveis.

## Licença

Este repositório inclui o arquivo `LICENSE.txt`.

## Contato e suporte

Para dúvidas ou problemas, abra uma issue no repositório do `GitHub`.

## Referências

[1] OPENAI. **Instalar o `agents` no `linux ubuntu` pelo `terminal emulator`**. Disponível em: <https://chatgpt.com/c/69ca8837-562c-83e9-b727-7025a10d4bfb>. ChatGPT. Acessado em: 02/04/2026.
