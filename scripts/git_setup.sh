#!/bin/bash
# Script auxiliar para configurar o repositório Git e conectar ao GitHub

set -e

echo "🔧 Configurando repositório Git..."

# Verificar se o git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git não está instalado. Por favor, instale o Git primeiro."
    exit 1
fi

# Verificar se já é um repositório git
if [ -d ".git" ]; then
    echo "⚠️  Repositório Git já inicializado."
    read -p "Deseja continuar mesmo assim? (s/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        exit 1
    fi
else
    # Inicializar repositório
    git init
    echo "✅ Repositório Git inicializado"
fi

# Verificar configuração do usuário
echo ""
echo "📋 Configuração atual do Git:"
git config user.name || echo "  Nome: NÃO CONFIGURADO"
git config user.email || echo "  Email: NÃO CONFIGURADO"
echo ""

read -p "Deseja configurar nome e email do Git agora? (s/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    read -p "Digite seu nome: " GIT_NAME
    read -p "Digite seu email: " GIT_EMAIL
    git config user.name "$GIT_NAME"
    git config user.email "$GIT_EMAIL"
    echo "✅ Configuração salva"
fi

# Adicionar arquivos
echo ""
echo "📦 Adicionando arquivos ao Git..."
git add .
echo "✅ Arquivos adicionados"

# Status
echo ""
echo "📊 Status do repositório:"
git status --short

# Commit
echo ""
read -p "Deseja fazer o commit inicial agora? (s/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    git commit -m "Initial commit: estrutura base do projeto ETL com Airflow"
    echo "✅ Commit realizado"
fi

# Conectar ao GitHub
echo ""
echo "🔗 Para conectar ao GitHub:"
echo "1. Crie um repositório no GitHub (https://github.com/new)"
echo "2. Execute o comando abaixo substituindo SEU_USUARIO:"
echo ""
echo "   git remote add origin https://github.com/SEU_USUARIO/etl_completo.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "📖 Para mais detalhes, consulte: GITHUB_SETUP.md"
