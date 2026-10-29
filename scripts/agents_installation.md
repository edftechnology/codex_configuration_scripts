gents_installation.md

# AGENTS.md — Instruções para documentação de instalação de aplicativos

## 1. Configuração desta tarefa

- **Aplicativo:** `subfinder`.
- **Gerenciador e método de instalação:** `apt` (pacote da distribuição).
- **Sistema operacional principal:** Kali Linux.
- **Sistema alternativo:** Linux Ubuntu, somente quando explicitamente aplicável; não confundir procedimentos ou afirmar compatibilidade não verificada.
- **Branch de trabalho:** `main`.
- **Proprietário do repositório remoto:** `edftechnology`.
- **Repositório esperado:** `edftechnology/subfinder` (privado).
- **Conversa de referência:** <https://chatgpt.com/g/g-p-6980caf949648191ad6acfcdbe590f9e-instalar/c/6ae2c50d-c6d0-83e8-bd3a-1f4a28b560c1>.

**Prioridade absoluta:** qualidade, rigor técnico e científico, reprodutibilidade, segurança e auditabilidade; não otimizar por velocidade. Nunca declarar que uma verificação foi realizada sem evidência. Não inventar comandos, links, datas de acesso ou resultados.

## 2. Missão e hierarquia das fontes

Criar, revisar e manter documentação em português brasileiro, com acentuação correta, para instalar, configurar, verificar, utilizar e desinstalar o aplicativo pelo terminal.

1. Ler integralmente os arquivos relevantes existentes antes de editar, sobretudo `README.ipynb`, `README.md`, `CHANGES.txt`, `setup.py`, `AGENTS.md`, `LICENSE*` e arquivos de configuração.
2. Ler a conversa de referência **se houver acesso real ao conteúdo**. Se não for possível acessar o link, registrar a limitação e solicitar ao usuário o texto necessário; jamais afirmar que foi lida.
3. Consultar documentação oficial do aplicativo e da distribuição, conferindo o nome do pacote e o método `apt`. Priorizar fontes oficiais sobre respostas de IA.
4. Identificar versões, comandos, dependências, opções de instalação, remoção e verificação, distinguindo fatos confirmados de hipóteses.
5. Não fazer novas consultas ao ChatGPT por conta própria se não houver acesso; não inventar URLs de conversas. Utilizar a URL fornecida como referência somente com indicação honesta do nível de verificação.

## 3. Inspeção e proteção do projeto

- Antes de qualquer alteração, consultar `pwd`, `git status --short`, `git branch --show-current`, `git remote -v`, `git submodule status` e a árvore dos arquivos relevantes.
- Não sobrescrever alterações preexistentes, conteúdo autoral, dados de usuário ou arquivos não relacionados. Não realizar `git reset --hard`, `git clean -fd`, `push --force` ou exclusões indiscriminadas.
- Trabalhar na `main`, sem descartar trabalho existente. Se a troca de branch não for segura, parar e informar o impedimento.
- Não substituir indiscriminadamente nomes em caminhos, URLs, referências, comandos ou citações. Adaptar nomes do aplicativo somente onde semanticamente correto. No texto descritivo, retirar underscores do nome do projeto quando apropriado; preservar identificadores literais.
- Preservar estrutura e contexto do notebook-modelo; não copiar instruções de instalação de `shell scripts` como se fossem instruções de instalação do `subfinder`.
- Verificar `CHANGES.txt` e `setup.py`, alterando-os somente se houver necessidade comprovada e sem falsear histórico, versões ou metadados.
- Fazer busca por referências residuais no repositório principal (nomes de aplicativos anteriores, URLs, títulos e exemplos), incluindo, quando existentes, `pyproject.toml`, `CITATION.cff`, `MANIFEST.in`, `requirements.txt`, `DEPENDENCIES.md` e `__init__.py`. Excluir da edição automática submódulos de terceiros, templates genéricos, dependências vendorizadas e histórico Git; registrar ocorrências legítimas não alteradas.

## 4. Git, GitHub e preparação do repositório

Executar operações de preparação **somente se necessárias**, verificando antes se já foram concluídas ou se há processo ainda em execução. Não iniciar uma segunda execução simultânea de `prepare_repo.sh`. Não usar `sleep 10` como prova de conclusão; acompanhar PID, status de saída e efeitos esperados.

1. Se não for repositório Git, inicializar com `git init -b main` (ou equivalente compatível).
2. Se existir repositório Git em outra branch, verificar o estado antes de mudar para `main`.
3. Verificar autenticação e existência do repositório remoto com `gh auth status` e `gh repo view edftechnology/subfinder`. Distinguir repositório inexistente de falha de autenticação ou rede.
4. Se comprovadamente inexistente e autorizado no ambiente, criar com `gh repo create edftechnology/subfinder --private`. Nunca criar repositório duplicado.
5. Se `origin` não existir, configurar `git remote add origin git@github.com:edftechnology/subfinder.git`. Se existir, inspecionar; não sobrescrever silenciosamente.
6. Verificar se o submódulo `subs/submodules/shell_scripts` já existe, seu registro em `.gitmodules` e seu estado. `gitsubmoduleaddshellscripts` pode ser alias/função local: verificar com `type gitsubmoduleaddshellscripts`; não pressupor que exista. Se não existir, localizar a URL oficial do submódulo e obter confirmação antes de adicioná-lo.
7. Antes de executar `bash subs/submodules/shell_scripts/scripts/prepare_repo.sh --profile app`, ler o script e seus efeitos, conferir se já rodou e se está ativo, e verificar pré-condições. Não executar automaticamente ações destrutivas ou que exijam credenciais.
8. Não considerar a linha `Cloning into ...` como comando: trata-se de saída de terminal e pode se referir a outro projeto.
9. Não efetuar commit/push sem verificar diff, escopo, branch, credenciais e instruções do usuário. Nunca publicar segredos ou arquivos privados por engano.

## 5. Estrutura obrigatória do README.ipynb

O `README.ipynb` é a **fonte canônica**. Preservar o estilo e as seções pertinentes do template existente, adaptando o conteúdo ao aplicativo. A estrutura-alvo é:

1. Título `Como instalar/configurar/usar o \`subfinder\` no \`Kali Linux\``.
2. `Resumo` e `Abstract`, se presentes no modelo, mantendo os dois idiomas.
3. `Descrição` e funcionalidades reais do aplicativo.
4. `Pré-requisitos`, incluindo permissões, conectividade e requisitos verificáveis.
5. `Instalação`: procedimento detalhado, sequencial e numerado.
6. `Código completo para configurar/instalar/usar`: subseção um nível abaixo da instalação, com instruções numeradas para abrir o terminal e executar um bloco único, equivalente aos comandos operacionais do passo a passo.
7. `Verificação da instalação`: comandos e resultados esperados; não fabricar saídas.
8. `Configuração e utilização`: exemplos básicos seguros e documentação das opções pertinentes.
9. `Desinstalação`: procedimento detalhado, sequencial e numerado, com justificativas e verificações.
10. `Código completo para desinstalar`: **subseção um nível abaixo da seção Desinstalação**, com instruções numeradas para abrir o terminal e executar um bloco único equivalente aos comandos operacionais do passo a passo.
11. `Submódulos`, `prepare_repo.sh` e `Governança documental mínima`, quando aplicáveis ao repositório; distinguir preparação do repositório da instalação do aplicativo.
12. `Compatibilidade`, `Licença`, `Contato e suporte` e `Referências`.
13. `Governança documental mínima`, tabelas de versões e orientações MRM, somente quando pertinentes ao projeto.

A numeração dos títulos pode ser ajustada à sequência real do template, sem duplicar números nem quebrar referências internas. Não eliminar seções existentes relevantes. Se uma seção não se aplicar, justificar antes de removê-la. Preservar células Markdown e metadados necessários do notebook.

## 6. Regras rígidas de formatação e preservação

- Manter o português brasileiro, pontuação e acentuação corretos. Padronizar `Linux Ubuntu` e `Kali Linux`. Usar nomes de programas, opções, comandos e caminhos em código inline. Usar itálico para estrangeirismos em prosa quando adequado, sem modificar identificadores literais.
- Empregar verbos no infinitivo nas ações dos passos a passo (por exemplo, `Digitar`, `Pressionar`, `Verificar`). **Exceção:** preservar literalmente o item 2 e os subitens 2.1–2.8 do template, mesmo quando sua redação divergir dessa regra.
- Quando a sintaxe do comando permitir, posicionar `-y` ao final; não alterar comandos cuja ordem de argumentos seja significativa.
- **Preservar integralmente** o item `2. Certifique-se de que seu sistema esteja limpo e atualizado.` e seus subitens 2.1 a 2.8, com textos e comandos originais do `README.ipynb`; ele é um **item de lista**, não um cabeçalho `##` ou `###`.
- Esse item deve permanecer depois do passo `1. Abrir o \`Terminal Emulator\`. Você pode fazer isso pressionando:` e do bloco com `Ctrl + Alt + T`.
- `Ctrl + Alt + T` é atalho de teclado, **não** comando executável de shell; apresentá-lo como no template, mas nunca incluí-lo em blocos de execução automática.
- Para blocos cercados por três crases dentro de um item numerado Markdown, indentar a abertura, o conteúdo e o fechamento com **quatro espaços** em relação à margem da lista, respeitando a hierarquia do item. Validar renderização no Markdown resultante.
- Não transformar comandos de manutenção do sistema em pré-requisitos silenciosos para a execução do agente. Em especial, `sudo apt autoremove -y`, `sudo apt --fix-broken install` e `sudo apt full-upgrade -y` devem ser documentados como no template, mas **não executados automaticamente**. Explicar o impacto potencial de alterações abrangentes do sistema quando couber.
- Não executar literalmente texto entre `<...>`: são placeholders que exigem substituição consciente.
- O bloco completo de instalação e o de desinstalação devem reproduzir a mesma sequência de comandos operacionais das respectivas etapas individuais, sem adicionar comandos ocultos. Podem conter verificações, comentários e condicionais de segurança devidamente explicados.
- Nas subseções de código completo, incluir: (1) abrir o terminal, mostrando `Ctrl + Alt + T` como atalho não executável; (2) instrução para copiar/colar; (3) bloco `bash` único com comandos válidos. Não incluir `Ctrl + Alt + T` dentro do bloco executável. Se a execução integral exigir intervenção humana, explicar e dividir em blocos seguros; **não** apresentar `NÃO há.` como comando de shell.
- Manter os títulos e a hierarquia do notebook. O exemplo `## 1.1 Código completo para configurar/instalar/usar` é ilustrativo; ajustar a numeração à seção real de instalação e usar título equivalente para desinstalação.
- Não misturar comandos de instalação do aplicativo com comandos de provisionamento Git sem identificar a finalidade.

## 7. Instalação e desinstalação por apt

**Instalação:** conferir previamente a existência do pacote no repositório do Kali e o comando correto de instalação. Documentar atualização de índices, instalação, verificação de versão e consulta à ajuda, quando suportadas. Se a instalação já existir, verificar o estado antes de tentar reinstalar.

**Desinstalação obrigatória:** incluir:

1. Verificação do pacote instalado e da origem de instalação.
2. Explicação da diferença entre `apt remove` e `apt purge` e escolha justificada para o procedimento documentado.
3. Comandos individuais para remover o pacote instalado pelo `apt`, sem apagar arquivos pessoais por padrão.
4. Verificação posterior para confirmar a remoção; distinguir ausência do pacote de estado residual `rc` no `dpkg`.
5. Tratamento opcional de dependências órfãs: apresentar `apt autoremove` como etapa separada, com inspeção prévia e alerta de que pode afetar outros pacotes. Não executar sem autorização.
6. **Subseção `Código completo para desinstalar`**, imediatamente abaixo da seção de desinstalação e um nível inferior, com bloco `bash` único e fiel às etapas anteriores.
7. Não prometer reversão integral de mudanças do sistema se o gerenciador de pacotes não a garantir.

Os procedimentos precisam funcionar para o **método real de instalação**. Não recomendar `pip uninstall` para um pacote instalado exclusivamente via `apt`.

## 8. Conversão, sincronização e arquivos gerados

- Editar diretamente o `README.ipynb` como fonte canônica; **não editar manualmente** `README.md` nem `README.py` para contornar a conversão.
- Verificar a existência de `subs/submodules/python_scripts/scripts/convert_ipynb_to_md.py`, confirmar o suporte a `--depth 0` e ler seu comportamento antes de executar:

  ```bash
  python3 subs/submodules/python_scripts/scripts/convert_ipynb_to_md.py --depth 0
  ```

- Se o conversor não existir, implementar conversão determinística do conteúdo Markdown do notebook para `README.md`, preservando títulos, listas, blocos de código, links e acentos; não inventar células nem alterar o notebook desnecessariamente.
- Se `README.py` existir e for comprovadamente artefato indevido, remover somente após verificar que não contém trabalho autoral necessário e que não é utilizado por outros arquivos. Caso contrário, registrar o conflito.
- Conferir validade JSON do `.ipynb`, estrutura das células e renderização do Markdown convertido. Reexecutar a conversão para verificar que o resultado é estável (sem diferenças inesperadas).

## 9. Referências e rastreabilidade

- Priorizar documentação oficial, manuais de pacote e documentação da distribuição; registrar URLs verificadas e data real de acesso.
- Incluir a conversa fornecida pelo usuário na seção `Referências`, sem afirmar que seu conteúdo foi consultado se o acesso falhar.
- Seguir apresentação de referências no padrão solicitado, inspirada na ABNT: autores/instituições em CAIXA ALTA, título em negrito e apenas a primeira letra do título em maiúscula, salvo nomes próprios e identificadores literais. Apresentar autoria, título, disponibilidade, fonte e data de acesso em linhas separadas, mantendo a legibilidade no notebook e no Markdown.
- Exemplo de **formato**, não de fonte automaticamente consultada:

  ```text
  [1] OPENAI.
  **Instalar o `subfinder` no `kali linux` pelo `terminal emulator`**.
  Disponível em: <URL_VERIFICADA>.
  ChatGPT.
  Acessado em: DD/MM/AAAA.
  ```

- Não inventar datas, autores, versões ou títulos de páginas. Evitar referências duplicadas. Se necessário, registrar que a formatação editorial solicitada é uma adaptação e não uma garantia de conformidade integral com a NBR 6023.

## 10. Padronização de código, arquivos e nomenclatura

- Nomes de novos arquivos em inglês, com `_` entre palavras. Preservar nomes convencionais obrigatórios como `AGENTS.md`, `README.md`, `GEMINI.md`, `LICENSE` e nomes existentes exigidos por ferramentas; não renomear arquivos públicos ou importáveis sem análise de impacto.
- Código Python criado ou modificado deve seguir PEP 8 e PEP 257, começar com `# -*- coding: utf-8 -*-` quando for arquivo-fonte Python, ter comentários e docstrings em português brasileiro, identificadores em inglês e linhas com até 100 colunas. Não aplicar essas regras indiscriminadamente a Markdown, JSON ou shell.
- Não introduzir exemplos tecnicamente inválidos: verificar flags, versões, redirecionamentos de shell, caminhos e nomes reais de pacotes antes de incluí-los.
- Quando houver tabelas de versões, usar colunas `Componente`, `Versão/Comando` e `Observação`, com versões efetivamente verificadas.

## 11. Governança documental e MRM

- Somente para modelos, automações analíticas, dados críticos ou sistemas regulados, incluir seção sucinta de governança documental no `README.ipynb`, sem transformá-lo em relatório metodológico completo.
- Quando aplicável, registrar objetivo e uso previsto, escopo, responsáveis, ambiente e versões, fontes de dados, premissas, limitações, testes, resultados, monitoramento, riscos operacionais, contingência, histórico de revisão e referências metodológicas.
- Referenciar, quando existirem, documentos próprios de metodologia, extração, execução, monitoramento, validação e aprovações, sem inventá-los.
- Distinguir instalação técnica de validação, aprovação ou conformidade regulatória. Não declarar MRM obrigatório sem base aplicável. Para `subfinder`, omitir se não houver contexto que justifique.

## 12. Sincronização, commits e publicação

- Depois de validar notebook, Markdown e demais alterações, conferir `git diff --check`, `git diff`, `git status --short`, branch e remoto.
- Antes de integrar alterações remotas, usar `git fetch origin` e examinar divergências. Não executar `git pull` indiscriminadamente quando houver alterações locais ou conflitos; integrar somente com estratégia segura e explícita.
- Preparar para commit apenas arquivos pertinentes à tarefa, por caminhos explícitos; não usar `git add .` sem inspeção. Revisar o conteúdo preparado e garantir ausência de segredos.
- Quando houver autorização para publicar e credenciais disponíveis, criar commit descritivo na `main` e enviar para `origin main`. Não inventar sucesso nem forçar push.
- Se um submódulo próprio tiver sido modificado, revisar e publicar primeiro seu commit na `main` do submódulo, verificar o novo ponteiro e somente então registrar/publicar a atualização no repositório principal. Não modificar ou publicar submódulos de terceiros sem autorização.
- Se a publicação estiver bloqueada por autenticação, divergência, política ou ausência de autorização, manter o trabalho local íntegro e informar o impedimento.

## 13. Critérios de aceitação e relatório final

Antes de concluir:

- [ ] Aplicativo `subfinder`, distribuição, pacote e método de instalação conferidos.
- [ ] Nenhuma referência residual indevida a `dnsrecon` em comandos, títulos ou remotos.
- [ ] Conteúdo da conversa de referência acessado ou limitação explicitada.
- [ ] Template `README.ipynb` inspecionado integralmente e preservado.
- [ ] Item 2 e subitens 2.1–2.8 preservados como lista numerada.
- [ ] Blocos de código, indentação Markdown e verbos no infinitivo conferidos.
- [ ] Instalação detalhada e bloco completo coerentes, com instruções para uso do terminal.
- [ ] Desinstalação detalhada e bloco completo coerentes, com instruções para uso do terminal.
- [ ] Verificações de instalação/remoção documentadas sem resultados fictícios.
- [ ] Conversão para `README.md` validada, sem edição manual divergente.
- [ ] `README.py`, `CHANGES.txt`, `setup.py`, metadados, licença e demais arquivos revisados conforme aplicabilidade.
- [ ] Repositório, branch, remoto, submódulos e scripts verificados sem duplicação.
- [ ] Referências formatadas em linhas separadas, com fontes e datas reais.
- [ ] Governança documental e MRM avaliados quanto à aplicabilidade.
- [ ] `git diff --check`, `git diff` e `git status --short` revisados.
- [ ] Commits e publicação realizados apenas quando autorizados, ou impedimentos relatados.

Ao final, relatar: arquivos alterados, decisões tomadas, fontes verificadas, comandos realmente executados, testes e resultados, comandos **não** executados, pendências e limitações. Não declarar sucesso total se algum critério não foi atendido.i
