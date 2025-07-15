# setup-ts-project

Script de setup automático para projetos TypeScript puro, com suporte a ES Modules, Prettier e configuração inicial de build.

## Como usar

## Compatibilidade

Este script pode ser executado em **qualquer sistema operacional**:

- **Linux**
- **macOS**
- **Windows** (usando [WSL](https://learn.microsoft.com/pt-br/windows/wsl/) ou [Git Bash](https://gitforwindows.org/))

Basta garantir que você tenha o **Node.js**, **npm** e um terminal Bash disponíveis.

---

Siga as instruções abaixo para rodar o script e configurar seu projeto

1. Dê permissão de execução ao script:

   ```sh
   chmod +x setup-ts-project.sh
   ```

2. Execute o script:

   ```sh
   ./setup-ts-project.sh
   ```

3. Siga as instruções no terminal para informar o nome do projeto e a versão alvo do TypeScript.

## O que o script faz

- Cria uma nova pasta para o projeto
- Inicializa um `package.json`
- Configura o projeto para usar ES Modules (`type: module`)
- Instala `typescript` e `prettier` como dependências de desenvolvimento
- Gera um `tsconfig.json` básico
- Cria a estrutura inicial de pastas e arquivos (`src/`, `.prettierrc`, `.prettierignore`)
- Adiciona scripts de build e format no `package.json`

## Scripts disponíveis

- `npm run build` — Compila o TypeScript para a pasta `dist`
- `npm run format` — Formata os arquivos `.ts` em `src/` usando Prettier

## Pré-requisitos

- Node.js e npm instalados
- Bash

---

> Gerado

## Configurando o Prettier no VS Code

Para garantir que o Prettier funcione automaticamente ao salvar seus arquivos no VS Code, siga os passos abaixo:

1. **Instale a extensão Prettier**
   - Abra o VS Code.
   - Vá até a aba de extensões (ícone de quadrados ou `Ctrl+Shift+X`).
   - Busque por **Prettier - Code formatter** e clique em instalar.

2. **Configure o arquivo `settings.json` do projeto**
   - No VS Code, pressione `Ctrl+Shift+P` e digite `Preferences: Open Workspace Settings (JSON)` para abrir o `settings.json` do projeto.
   - Adicione as seguintes configurações:

     ```json
     {
       "editor.defaultFormatter": "esbenp.prettier-vscode",
       "editor.formatOnSave": true,
       "[typescript]": {
         "editor.defaultFormatter": "esbenp.prettier-vscode"
       }
     }
     ```

   - Salve o arquivo.

3. **Pronto!**
   - Agora, sempre que você salvar um arquivo `.ts`, o Prettier irá formatá-lo automaticamente conforme as regras do projeto.

> Dica: O
