#!/bin/bash
# Script para criar e configurar o ambiente virtual Python

set -e

echo "🐍 Configurando ambiente virtual Python..."

# Verificar se Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 não está instalado. Por favor, instale o Python3 primeiro."
    exit 1
fi

# Verificar versão do Python
PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
echo "✅ Python encontrado: $PYTHON_VERSION"

# Nome do ambiente virtual
VENV_NAME="venv"
VENV_PATH="./$VENV_NAME"

# Verificar se o ambiente virtual já existe
if [ -d "$VENV_PATH" ]; then
    echo "⚠️  Ambiente virtual já existe em $VENV_PATH"
    read -p "Deseja recriar o ambiente virtual? (s/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        echo "🗑️  Removendo ambiente virtual existente..."
        rm -rf "$VENV_PATH"
    else
        echo "✅ Usando ambiente virtual existente"
        exit 0
    fi
fi

# Criar ambiente virtual
echo "📦 Criando ambiente virtual em $VENV_PATH..."
python3 -m venv "$VENV_NAME"

# Ativar ambiente virtual
echo "🔌 Ativando ambiente virtual..."
source "$VENV_PATH/bin/activate"

# Atualizar pip
echo "⬆️  Atualizando pip..."
pip install --upgrade pip setuptools wheel

# Instalar dependências
echo "📥 Instalando dependências do requirements.txt..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo "✅ Dependências instaladas com sucesso!"
else
    echo "⚠️  Arquivo requirements.txt não encontrado"
fi

echo ""
echo "✅ Ambiente virtual configurado com sucesso!"
echo ""
echo "📝 Para ativar o ambiente virtual, execute:"
echo "   source $VENV_NAME/bin/activate"
echo ""
echo "📝 Para desativar, execute:"
echo "   deactivate"
echo ""
