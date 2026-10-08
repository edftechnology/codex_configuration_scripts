# GEMINI - Guia Mestre

Este arquivo serve como índice central para as instruções específicas do Gemini.  
Cada arquivo dedicado **não é mesclado** aqui, para permitir edição independente.

---

## Padrões de código Python

- Aplicar a [PEP 8](https://peps.python.org/pep-0008/) a todo código Python criado ou alterado.
- Escrever docstrings de módulos, classes e funções públicas conforme a [PEP 257](https://peps.python.org/pep-0257/).
- Manter nomes de identificadores em inglês dos Estados Unidos, conforme a regra geral do projeto.
- Aplicar essas PEPs somente a código Python e às docstrings Python. Elas não definem o estilo da prosa em Markdown nem de comandos de shell, arquivos JSON, código C ou outros formatos.

## Formato de referências bibliográficas

- Formatar cada referência no padrão ABNT, distribuindo a entrada em linhas separadas: identificação e autoria; título em negrito; link precedido por `Disponível em:`; identificação da fonte; data de acesso.
- Escrever somente a primeira letra do título em maiúscula, respeitando siglas e nomes próprios.
- Não reunir os elementos da referência em uma única linha.

Exemplo:

```text
[1] OPENAI.
**Instalar o `mousetrail` no `linux ubuntu` pelo `terminal emulator`**.
Disponível em: <https://chatgpt.com/g/g-p-6980caf949648191ad6acfcdbe590f9e-instalar/c/6ac754e0-d664-83ea-906a-50fab09b9f73>.
ChatGPT.
Acessado em: 08/10/2026.
```

## Estrutura

- `scripts/gemini_git.md` → Instruções e fluxos de trabalho para Git, GitHub e GitLab
- `scripts/gemini_github_actions.md` → Instruções para GitHub Actions
- `scripts/gemini_latex.md` → Instruções e padrões para documentos LaTeX
- `scripts/gemini_python.md` → Instruções para Python, PEP8, Sphinx e formatação de código
- `scripts/gemini_shell.md` → Instruções para Shell Script e terminal

---

## Como usar no Gemini

No **Gemini CLI** (ou outra instância do Gemini), você pode pedir para o modelo considerar **somente** uma seção ou arquivo específico, por exemplo:

> "Use apenas as instruções do arquivo `scripts/gemini_python.md`"  
> "Considere as instruções do `scripts/gemini_git.md` para revisar este commit"

---

## Leitura para Instruções Externas

- [gemini_git.md](scripts/gemini_git.md)
- [gemini_github_actions.md](scripts/gemini_github_actions.md)
- [gemini_latex.md](scripts/gemini_latex.md)
- [gemini_python.md](scripts/gemini_python.md)
- [gemini_shell.md](scripts/gemini_shell.md)

---

## Diretrizes de Governança Documental

Quando o projeto envolver modelos, automações analíticas, instalações críticas ou ambientes regulados, o Gemini deve preservar uma documentação mínima inspirada em boas práticas de Model Risk Management (MRM):

- Registrar objetivo, uso previsto, escopo, público-alvo e limitações conhecidas.
- Identificar papéis e responsabilidades, como owner, desenvolvedor, usuário, revisor e aprovador.
- Manter histórico de versões, motivo da mudança, responsável e data.
- Documentar ambiente tecnológico com versões de sistemas, linguagens, bibliotecas, submódulos e comandos de reprodução.
- Declarar fontes de dados, premissas, critérios de qualidade, entradas, processamento e saídas esperadas.
- Incluir evidências de testes, validações, monitoramento, estabilidade, performance e riscos operacionais quando aplicável.
- Registrar plano de contingência ou procedimento de recuperação para falhas de instalação, execução, dados ou dependências.
- Manter referências normativas, técnicas e consultas utilizadas, preferindo fontes oficiais quando existirem.

---

> **Nota:** Cada arquivo é independente e pode ser atualizado separadamente.  
> O `GEMINI.md` serve apenas como guia/índice mestre para o Gemini.
