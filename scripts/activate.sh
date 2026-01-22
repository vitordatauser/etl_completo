#!/bin/bash
# Script para ativar o ambiente virtual

VENV_NAME="venv"
VENV_PATH="./$VENV_NAME"

if [ ! -d "$VENV_PATH" ]; then
    echo "❌ Ambiente virtual não encontrado em $VENV_PATH"
    echo "💡 Execute primeiro: ./scripts/setup_env.sh"
    exit 1
fi

echo "🔌 Ativando ambiente virtual..."
source "$VENV_PATH/bin/activate"

echo "✅ Ambiente virtual ativado!"
echo "🐍 Python: $(which python)"
echo "📦 Pip: $(which pip)"
echo ""
echo "💡 Para desativar, execute: deactivate"
