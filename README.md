# Como instalar/configurar/usar o `shell_scripts` no `Linux Ubuntu`

## Resumo

Guia direto para instalar o `shell_scripts` no seu projeto.

## _Abstract_

_A straightforward guide to installing `shell_scripts` in your project._


## Descrição

### `shell_scripts`

O `shell_scripts` é um repositório do `GitHub` para consolidar códigos genéricos em `shell` para
serem utilizados em qualquer outro projeto. Ele também inclui um _script_ chamado `prepare_repo.sh`
que clona outros repos dentro do seu projeto com demais códigos genéricos em diversas linguagens e
arquivos que são convenientes existirem em projetos.


## Pré-requisitos

- Git instalado
- SSH key configurada no GitHub
- Acesso ao GitHub (repositório `edftechnology/shell_scripts`)


## 1. Clonar o repo `shell_scripts` no repositório do seu projeto

Para clonar o `shell_scripts`, siga os passos abaixo:

1. Abra o `Terminal Emulator`. Você pode fazer isso pressionando:

    ```bash
    Ctrl + Alt + T
    ```

2. Acessar a pasta do seu projeto:

```bash
cd <caminho_ate_o_projeto>
```

3. Clonar o `shell_scripts`:

```bash
git submodule add \
    git@github.com:edftechnology/shell_scripts.git \
    subs/submodules/shell_scripts
```


## 2. Inicializar submodules existentes (se aplicável)

Se o seu repositório já tiver um `.gitmodules`, inicialize com:

```bash
git submodule update --init --recursive
```


## 3. (Opcional) Executar o `prepare_repo.sh`

É conveniente executar o `scripts/prepare_repo.sh` depois de clonar o `shell_scripts`,
pois ele verifica se o seu repo está com todos os arquivos que é recomendado que um projeto
tenha, sem excluir ou sobrescrever os arquivos existentes. Para isso, na raiz do seu projeto,
execute o comando:

```bash
bash subs/submodules/shell_scripts/scripts/prepare_repo.sh
```

O script faz, de forma resumida:

- Garante/atualiza submodules essenciais
- Cria pastas padrão do projeto (docs, inputs, outputs, etc.)
- Cria `__init__.py` onde for apropriado


## Compatibilidade

- Testado em Linux Ubuntu (recomendado 20.04+).
- Deve funcionar em Debian e WSL, desde que o Git e o Bash estejam disponíveis.


## Licença

Este repositório inclui o arquivo `LICENSE.txt`.

## Contato e suporte

Para dúvidas ou problemas, abra uma issue no repositório do `GitHub`.


## Referências

[1] OPENAI. ***Depurar código shell***. Disponível em: <https://chatgpt.com/g/g-p-6761f07a2b1c81918aa789debc65d68c/c/67c06bee-d0b8-8002-aa30-d2d0d57f1cfe>. ChatGPT. Acessado em: 11/12/2025.

