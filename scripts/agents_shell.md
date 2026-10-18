# agents.md

## Missão do Agente
Você é responsável por criar, modificar e manter scripts de shell (bash, sh, zsh) garantindo eficiência, segurança e clareza no código.

O agente deve:
- Criar scripts portáveis e bem documentados.
- Usar boas práticas de segurança no shell scripting.
- Testar scripts em diferentes ambientes antes de integrar.
- Documentar variáveis, funções e dependências.

---

## Procedimento de Exploração

### Listar scripts existentes
```bash
find . -type f -name "*.sh"
```

### Verificar permissões de execução
```bash
find . -type f -name "*.sh" ! -perm -111
```

### Analisar sintaxe
```bash
bash -n script.sh
```

### Executar script com modo debug
```bash
bash -x script.sh
```

### Verificar variáveis não definidas e erros
```bash
set -u
set -e
```

### Conferir dependências
```bash
grep -E '(^[a-zA-Z0-9_]+=\$|^[[:space:]]*[a-zA-Z0-9_-]+ )' script.sh
```

---

## Boas Práticas
- Incluir `#!/bin/bash` ou `#!/bin/sh` no início.
- Usar nomes de variáveis claros e em maiúsculas para constantes.
- Tratar erros com `set -e` e verificar comandos com `|| exit 1`.
- Evitar caminhos absolutos quando possível.
- Documentar cada função.

---

## Segurança
- Validar entradas do usuário (`read` e parâmetros).
- Usar aspas ao expandir variáveis para evitar word splitting.
- Evitar uso de `eval` quando possível.
- Restringir permissões de execução.

---

## Checklist Antes do Commit
- [x] Script com cabeçalho correto
- [x] Permissões de execução configuradas
- [x] Sintaxe validada (`bash -n`)
- [x] Teste com modo debug (`bash -x`)
- [x] Entradas validadas
- [x] Documentação atualizada

---

## Referências
- GNU Bash Manual: https://www.gnu.org/software/bash/manual/  
- ShellCheck: https://www.shellcheck.net/  

## File naming policy

- File names must be written in English.
- Use only underscores (`_`) to separate words in file names; do not use hyphens (`-`), spaces, or other separators.

- Keep mandatory ecosystem names such as `AGENTS.md`, `GEMINI.md`, and `README.md` when a tool or platform requires the conventional name.

## Execução segura em fluxos de modelos

- Antes de executar scripts sobre dados ou artefatos de modelos, confirme caminhos, origem, permissões, ambiente e efeitos colaterais; use modo de simulação quando disponível e preserve logs e resultados de validação.
- Não execute código de modelo ou dependências baixados sem verificar origem e integridade. Evite incluir dados sensíveis, tokens ou saídas confidenciais em argumentos, histórico do shell e logs de CI.
