#!/bin/bash

echo "=== Setup automático de projeto TypeScript puro ==="

read -p "Nome do projeto: " PROJECT_NAME
read -p "Versão alvo do TypeScript (ex: ES2022, ES2020, ES2015): " TS_TARGET

echo "Criando projeto $PROJECT_NAME com target $TS_TARGET..."

mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME" || { echo "Erro ao criar pasta"; exit 1; }

echo "Inicializando package.json..."
npm init -y

echo "Adicionando 'type': 'module' no package.json para suportar ES Modules..."
node -e "
  const fs = require('fs');
  const pkg = JSON.parse(fs.readFileSync('package.json'));
  pkg.type = 'module';
  fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
"

echo "Instalando TypeScript e Prettier..."
npm install --save-dev typescript prettier

echo "Gerando tsconfig.json..."
cat > tsconfig.json <<EOL
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "esModuleInterop": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true
  }
}

EOL

echo "Criando pasta src..."
mkdir src

echo "Criando arquivo .prettierrc..."
cat > .prettierrc <<EOL
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
EOL

echo "Criando arquivo .prettierignore..."
cat > .prettierignore <<EOL
node_modules
dist
EOL

echo "Adicionando scripts no package.json..."
npx npm-add-script -k "build" -v "tsc"
npx npm-add-script -k "format" -v "prettier --write 'src/**/*.ts'"

echo "Setup finalizado!"
echo "Para compilar: npm run build"
echo "Para formatar: npm run format"
echo "Para rodar: node dist/index.js"

# Função para futuras configurações automáticas
configure_project() {
  echo "Aqui você pode adicionar novas configurações automáticas para o projeto"
}

# Pode chamar configure_project aqui se quiser executar automaticamente
# configure_project

