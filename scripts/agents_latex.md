# AGENTS.md

## Missão do Agente
Você é responsável por manter e evoluir este projeto LaTeX, garantindo consistência de formatação, organização dos arquivos e compatibilidade com as diretrizes estabelecidas. Todas as alterações devem preservar a estrutura do documento e evitar erros de compilação.

O agente deve:
- Mapear a estrutura do projeto antes de alterações.
- Compreender o estilo e padrão adotado (pacotes, comandos, macros).
- Garantir que a compilação final ocorra sem erros ou warnings desnecessários.
- Manter organização de arquivos e referências bibliográficas.

---

## Procedimento de Exploração Inteligente

### Mapear estrutura de diretórios
```bash
tree -L 3 --dirsfirst
```

### Localizar arquivos principais e de configuração
```bash
ls *.tex *.sty *.cls *.bib
```

### Detectar pacotes utilizados
```bash
grep -R "\usepackage" *.tex
```

### Detectar comandos e macros definidos
```bash
grep -R "\newcommand" *.tex
grep -R "\renewcommand" *.tex
grep -R "\DeclareMathOperator" *.tex
```

### Localizar figuras e tabelas
```bash
grep -R "\begin{figure}" *.tex
grep -R "\begin{table}" *.tex
```

### Verificar presença de referências bibliográficas
```bash
grep -R "\cite{" *.tex
grep -R "@article" *.bib
```

### Compilar documento (XeLaTeX recomendado para UTF-8)
```bash
latexmk -xelatex main.tex
```

### Limpar arquivos temporários
```bash
latexmk -c
```

---

## Padrões de Código LaTeX
- Utilizar codificação UTF-8.
- Seguir padrão de nomenclatura de arquivos em minúsculas e com underscore (`_`).
- Centralizar definições de macros e comandos em um único arquivo (`macros.tex`).
- Pacotes essenciais devem ser carregados no preâmbulo principal (`main.tex` ou equivalente).
- Evitar redefinir comandos padrão sem justificativa.
- Todo arquivo `.tex` deve conter `\input{variables.tex}` imediatamente após `\input{preamble.tex}`.
- Ao escrever ou editar código LaTeX, usar a indentação hierárquica já adotada no projeto:
  aplicar tabulação para refletir a estrutura do documento, por exemplo em
  `document`, `section`, `subsection`, `subsubsection` e ambientes como `itemize`,
  `enumerate`, `figure` e `table`.
- Não apenas preservar a indentação existente:
  novos trechos gerados pelo agente também devem seguir esse padrão de recuo.
- Não achatar a formatação nem reindentar em estilo diferente sem necessidade.


### Template Base de Arquivo
Todo arquivo `.tex` deve iniciar com a seguinte estrutura mínima:
```tex
\documentclass[12pt, a4paper]{article} % Tamanho de letra 12, papel A4, Estilo de artigo

\input{preamble.tex}
\input{variables.tex}

\begin{document}
	
\end{document}
```

---

## Estrutura Recomendada
```
project/
│── main.tex            # Arquivo principal
│── preamble.tex        # Pacotes e configurações globais
│── macros.tex          # Definições de comandos
│── chapters/           # Capítulos do documento
│── figures/            # Imagens
│── tables/             # Tabelas
│── references.bib      # Bibliografia
```

---

## Testes e Validação
- Compilar com `latexmk` para garantir consistência.
- Evitar warnings como "Overfull hbox" e "Undefined references".
- Conferir sumário, listas de figuras e tabelas após cada modificação.
- Garantir que todas as referências `\ref{}` e `\cite{}` possuam destino válido.

---

## README.ipynb e README.md
- Em `README.ipynb` e `README.md`, formatar as referências em múltiplas linhas para facilitar leitura e edição.
- Não condensar autor, título, disponibilidade, fonte e data de acesso em uma única linha.
- Usar o padrão abaixo:

```markdown
## Referências

[1] OPENAI.
**Converter vários README.ipynb para .md e .py**. 
Disponível em: <https://chat.openai.com/c/50f64d4d-cfe7-40ac-a8aa-27ffa4eb5a5e>.
ChatGPT.
Acessado em: 26/01/2024.

[2] INSTITUTO TECNOLÓGICO DE AERONÁUTICA (ITA).
**Exemplo de utilização da classe ITA**.
Disponível em: <http://www.apgita.org.br/apgita/teses-e-latex.php>.
ITA.
Acessado em: 25/08/2016.
```

---

## Fluxo de Trabalho (Git)
- Criar branch:
  ```bash
  git checkout -b feature/nome
  ```
- Commits:
  ```
  [Tipo] Descrição curta
  ```
- Antes do PR:
  - Compilar e verificar documento final.
  - Garantir que não há arquivos temporários no commit.

---

## Segurança
- Não incluir arquivos PDF compilados no repositório, exceto se especificado.
- Adicionar arquivos temporários e de build ao `.gitignore`:
  ```
  *.aux
  *.log
  *.toc
  *.out
  *.fls
  *.fdb_latexmk
  *.synctex.gz
  ```

---

## Checklist Antes do Commit
- [x] Compilação sem erros
- [x] Nenhum warning relevante
- [x] Sumário e listas atualizados
- [x] Referências válidas
- [x] Estrutura de arquivos organizada

---

## Referências
- LATEX Project: https://www.latex-project.org/  
- Overleaf LaTeX Guides: https://www.overleaf.com/learn  
