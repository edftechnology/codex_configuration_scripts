
# Convenção de Logs

## Níveis e cores

Use os rótulos por extenso, sempre em minúsculas e entre colchetes, no início da linha.

**Exemplo:** `[info] Workflow started.`

| Nível | Cor no terminal | Código hexadecimal | Código ANSI | Uso |
|:---|:---|:---:|:---|:---|
| `[debug]` | Cinza escuro | `#808080` | `\033[90m` | Detalhes técnicos para diagnóstico; normalmente exibidos apenas em modo de depuração. |
| `[info]` | Azul claro | `#739FCF` | `\033[38;2;115;159;207m` | Etapas, estado e resultados informativos normais. |
| `[warning]` | Laranja | `#FF8700` | `\033[38;5;208m` | Situação inesperada ou limitação que não interrompe a execução. |
| `[error]` | Vermelho | `#FF0000` | `\033[31m` | Falha em uma operação ou etapa; a execução pode continuar, se houver recuperação. |
| `[critical]` | Vermelho em negrito | `#FF0000` | `\033[1;31m` | Falha grave que impede a continuidade segura do programa ou serviço. |

### Configuração das cores

- Finalize cada linha colorida com `\033[0m` para restaurar a cor do terminal.
- Aplique cores somente quando a saída for um terminal interativo e `NO_COLOR` não estiver definido.
- Logs redirecionados para arquivos ou pipes devem permanecer sem códigos ANSI.
- Utilize ANSI True Color (24 bits) para representar cores hexadecimais com precisão.
- As cores ANSI tradicionais podem variar conforme o tema e a configuração do terminal.

## Regras de uso

1. **Identificação:** escreva o nível no começo da mensagem.

   **Exemplo:** `[warning] Could not load optional settings.`

2. **Padronização:** use `[warning]`, não `[warn]`; mantenha os nomes completos e consistentes.

3. **Severidade:** não use a cor como única indicação de severidade; preserve sempre o rótulo textual.

4. **Diagnóstico:** reserve `[debug]` para detalhes de diagnóstico; não o use para mensagens rotineiras.

5. **Desempenho:** `[timing]` é um rótulo complementar para duração e desempenho, não um nível de severidade.

   **Exemplo:** `[timing] Total execution time: 2.4 s.`

   No padrão atual do projeto, sua cor é ciano (`\033[36m`).
