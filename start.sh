#!/bin/bash

# Android Cloud Runner - Script de Inicialização (Mac/Linux)

echo ""
echo "========================================"
echo "  Android Cloud Runner - Portátil"
echo "========================================"
echo ""

# Verificar se Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ ERRO: Python3 não está instalado!"
    echo ""
    echo "Instale com:"
    echo "  Ubuntu/Debian: sudo apt-get install python3 python3-pip"
    echo "  Mac: brew install python3"
    echo ""
    exit 1
fi

echo "✓ Python3 encontrado"
echo ""

# Verificar se pip está disponível
if ! command -v pip3 &> /dev/null; then
    echo "❌ ERRO: pip3 não está disponível!"
    echo ""
    exit 1
fi

echo "✓ pip3 encontrado"
echo ""

# Instalar dependências
echo "📦 Instalando dependências..."
pip3 install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "❌ ERRO ao instalar dependências!"
    exit 1
fi

echo "✓ Dependências instaladas"
echo ""

# Verificar Android SDK
echo "🔍 Verificando Android SDK..."
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  AVISO: ANDROID_HOME não está definido!"
    echo ""
    echo "Para usar o emulador, você precisa:"
    echo "1. Instalar Android SDK"
    echo "2. Definir variável ANDROID_HOME"
    echo ""
    echo "Instruções: https://developer.android.com/studio"
    echo ""
    echo "Você pode continuar, mas o emulador não funcionará."
    echo ""
fi

# Iniciar aplicação
echo ""
echo "🚀 Iniciando Android Cloud Runner..."
echo "📱 Acesse: http://localhost:5000"
echo ""
echo "Pressione Ctrl+C para parar"
echo ""

python3 app.py
