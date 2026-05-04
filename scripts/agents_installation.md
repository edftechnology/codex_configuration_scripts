# agents_installation.md

## Missão do Agente

<div style="margin-left: 2em;">

Você é responsável por criar, modificar e manter instruções de instalação de programas no `Linux Ubuntu`, garantindo clareza, reprodutibilidade e segurança no processo.

O agente deve:

</div>

- Criar tutoriais passo a passo de instalação via **Terminal Emulator**.

- Usar comandos portáteis e compatíveis com diferentes versões do `Linux Ubuntu`.

- Sempre tratar `Ubuntu` como `Linux Ubuntu` e `Kali` como `Kali Linux`, pois essa é a padronização adotada neste projeto.

- Verificar dependências e pacotes adicionais necessários.

- Documentar _links_ oficiais e fontes de referência.

- Registrar _links_ de consultas ao `ChatGPT` e outras fontes em **Referências**.

- Manter o _template_ do `README.ipynb`

- Palavras estrangeiras em relação ao português brasileiro devem ser escritas em itálico, por exemplo: `_software_`.

- Nomes de programas devem sempre ser escritos entre crases, por exemplo: `Google Earth`.

- As ações dos passos a passo devem sempre usar verbos no infinitivo, por exemplo: `2. Digitar o seguinte comando e pressionar `Enter`:` em vez de `2. Digite o seguinte comando e pressione `Enter`:`.

- Quando um comando tiver a opção `-y`, ela deve sempre ficar no final do comando, por exemplo: `sudo apt install ./google-earth-pro-stable_current_amd64.deb -y`.

- Para as referências, mantes neste padrão `ABNT` com o título entre `**` e `**`para que fique en negrito e com somente a primeira letra do título em MAIÚSCULA, por exemplo:

```bash
[1] OPENAI. **Instalar o `bmon` no `linux ubuntu` pelo `terminal emulator`**. Disponível em: <https://chatgpt.com/c/69b700b3-b03c-8326-84e4-309f7e577240>. ChatGPT. Acessado em: 15/03/2026.
```

---

## Procedimento de Exploração

### 1. Pesquisar instruções no `ChatGPT`

- Criar uma pergunta no `ChatGPT` do tipo:  
  *"Instalar o <nome_do_projeto/repositório> (sem os underlines `_`) no `<nome_do_sistema_operacional>` pelo `terminal emulator`?"*  

- Para o `nome_do_sistema_operacional`, se for o `Ubuntu`, usar sempre `linux ubuntu`; se for o `Kali`, usar sempre `kali linux`.

- Copiar o _link_ da resposta do `ChatGPT` para incluir na seção **Referências** do arquivo `README.ipynb`.

---

### 2. Revisar o Projeto

- Revisar todos os arquivos do projeto e alterar o nome do programa para **<nome_do_projeto/repo>** (sem os underlines `_`) conforme descrito na pesquisa/documentação.

- Essa revisão deve cobrir **todo o repositório**, e não apenas o `README.ipynb`, para identificar nomes antigos, exemplos herdados de outros projetos e referências residuais incorretas.

- Verificar também arquivos de metadados e documentação auxiliar da raiz do projeto, como por exemplo:

- `pyproject.toml`

- `CITATION.cff`

- `MANIFEST.in`

- `requirements.txt`

- `DEPENDENCIES.md`

- `__init__.py`

- Corrigir nomes de projeto, descrições, URLs, títulos, identificadores internos e outras referências textuais que ainda apontem para outro programa/repositório.

- Se houver ocorrências antigas apenas em arquivos de `template`, exemplos de submódulos ou materiais de apoio fora do escopo do projeto atual, registrar isso explicitamente e evitar alterar esses arquivos sem necessidade.

- Não alterar os arquivos `README.md` e `README.py` usando o código em `python` chamado `convert_ipynb_to_md.py`.

- Preservar integralmente a seção: `**"2. Certifique-se de que seu sistema esteja limpo e atualizado."**`

- Revisar também os documentos-padrão do projeto:

- CHANGES.txt

- setup.py

- Manter o português com acentos, conforme as regras gramaticais.

---

### 3. Executar Conversão

- Rodar o _script_ de conversão para sincronizar os arquivos:

```bash
python3 subs/submodules/python_scripts/convert_ipynb_to_md.py
```

<div style="margin-left: 2em;">

Caso você não encontre o arquivo `python3 convert_ipynb_to_md.py`, este converte o `README.ipynb` para `.md`. Sendo assim, se não encontrar o arquivo, faça você mesmo.

Excluir o arquivo `README.py`, pois este não deve existir, caso ele exista.

</div>

---

### 4. Acertar código

<div style="margin-left: 2em;">

Para os repos que possuírem o `README.ipynb`, onde estiver:

</div>

1. Abra o `Terminal Emulator`. Você pode fazer isso pressionando: `Ctrl + Alt + T`

<div style="margin-left: 2em;">

Alterar para:

</div>

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

```bash
Ctrl + Alt + T
```

<div style="margin-left: 2em;">

Sempre manter essa Item `2. Certifique-se de que seu sistema esteja limpo e atualizado.`, não colocar como Seção, pois ele vem como passos depois do final `1. Abra o `Terminal Emulator`. Você pode fazer isso pressionando`, mesmo que ela não seja útil, pois serve para a maior parte das instalações:

</div>

2. Certifique-se de que seu sistema esteja limpo e atualizado.

<div style="margin-left: 2em;">

2.1 Limpar o `cache` do gerenciador de pacotes `apt`. Especificamente, ele remove todos os arquivos de pacotes (`.deb`) baixados pelo `apt` e armazenados em `/var/cache/apt/archives/`. Digite o seguinte comando:

</div>

```bash
sudo apt clean
```

<div style="margin-left: 2em;">

2.2 Remover pacotes `.deb` antigos ou duplicados do `cache` local. É útil para liberar espaço, pois remove apenas os pacotes que não podem mais ser baixados (ou seja, versões antigas de pacotes que foram atualizados). Digite o seguinte comando:

</div>

```bash
sudo apt autoclean
```

<div style="margin-left: 2em;">

2.3 Remover pacotes que foram automaticamente instalados para satisfazer as dependências de outros pacotes e que não são mais necessários. Digite o seguinte comando:

</div>

```bash
sudo apt autoremove -y
```

<div style="margin-left: 2em;">

2.4 Buscar as atualizações disponíveis para os pacotes que estão instalados em seu sistema. Digite o seguinte comando e pressione `Enter`:

</div>

```bash
sudo apt update
```

<div style="margin-left: 2em;">

2.5 **Corrigir pacotes quebrados**: Isso atualizará a lista de pacotes disponíveis e tentará corrigir pacotes quebrados ou com dependências ausentes:

</div>

```bash
sudo apt --fix-broken install
```

<div style="margin-left: 2em;">

2.6 Limpar o `cache` do gerenciador de pacotes `apt` novamente:

</div>

```bash
sudo apt clean
```

<div style="margin-left: 2em;">

2.7 Para ver a lista de pacotes a serem atualizados, digite o seguinte comando e pressione `Enter`:

</div>

```bash
sudo apt list --upgradable
```

<div style="margin-left: 2em;">

2.8 Realmente atualizar os pacotes instalados para as suas versões mais recentes, com base na última vez que você executou `sudo apt update`. Digite o seguinte comando e pressione `Enter`:

</div>

```bash
sudo apt full-upgrade -y
```

<div style="margin-left: 2em;">

Sempre manter a indentação nos códigos para manter a formatação do `.md`, por exemplo:

Este comando que está alinhado com o `1.`, ou seja, se espaços:

</div>

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

```bash
Ctrl + Alt + T
```

<div style="margin-left: 2em;">

Deve ser assim, ficar à frente, ou seja, com `4` espaços:

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

</div>

```bash
    ```bash
    Ctrl + Alt + T
    ```
```

<div style="margin-left: 2em;">

Sempre incluir no `README.ipynb` uma seção com este título:

</div>

```bash
## 1.1 Código completo para configurar/instalar/usar
```

<div style="margin-left: 2em;">

Quando houver um bloco único de copiar e colar para configurar/instalar/usar o programa sem precisar digitar linha por linha, usar este formato:

</div>

```md
## 1.1 Código completo para configurar/instalar/usar

Para configurar/instalar/usar o `<nome_do_programa>` no `Linux Ubuntu` sem precisar digitar linha por linha, você pode seguir estas etapas:

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

    ```bash
    Ctrl + Alt + T
    ```

2. Digite o seguinte comando e pressione `Enter`:

    ```bash
    <comandos completos aqui>
    ```
```

<div style="margin-left: 2em;">

Para o caso específico do `codex`, usar como referência este modelo:

</div>

```md
## 1.1 Código completo para configurar/instalar/usar

Para configurar/instalar/usar o `codex` no `Linux Ubuntu` sem precisar digitar linha por linha, você pode seguir estas etapas:

1. Abrir o `Terminal Emulator`. Você pode fazer isso pressionando:

    ```bash
    Ctrl + Alt + T
    ```

2. Digite o seguinte comando e pressione `Enter`:

    ```bash
    sudo apt clean
    sudo apt autoclean
    sudo apt autoremove -y
    sudo apt update
    sudo apt --fix-broken install
    sudo apt clean
    sudo apt list --upgradable
    sudo apt full-upgrade -y
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install nodejs -y
    sudo npm install -g openai
    node -v
    npm -v
    npm install -g @openai/code --prefix ~/.npm-global # NÃO usar o `sudo`.
    export PATH="$HOME/.npm-global/bin:$PATH" >> ~/.bashrc
    export PATH="$HOME/.npm-global/bin:$PATH" >> ~/.zshrc
    source ~/.bashrc
    source ~/.zshrc
    codex --help
    which codex
    codex ---version
    codex
    ```
```

<div style="margin-left: 2em;">

Quando os passos do item `2` forem complexos demais para ter um bloco único de copiar e colar, registrar explicitamente que não há comando único, neste formato:

</div>

```md
2. Digite o seguinte comando e pressione `Enter`:

    ```bash
    NÃO há.
    ```
```