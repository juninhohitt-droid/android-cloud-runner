#!/bin/bash

# Script de configuração automática para Mac
# Este script configura ANDROID_HOME e outras variáveis necessárias

echo "=========================================="
echo "  Configuração Android Cloud Runner - Mac"
echo "=========================================="
echo ""

# Verificar se Android SDK existe
if [ -d "$HOME/Library/Android/sdk" ]; then
    echo "✓ Android SDK encontrado em: $HOME/Library/Android/sdk"
else
    echo "❌ Android SDK não encontrado!"
    echo "Por favor, instale Android Studio primeiro"
    exit 1
fi

# Adicionar ao .zshrc se não existir
SHELL_RC="$HOME/.zshrc"

if ! grep -q "ANDROID_HOME" "$SHELL_RC"; then
    echo ""
    echo "📝 Adicionando ANDROID_HOME ao $SHELL_RC..."
    
    cat >> "$SHELL_RC" << 'EOF'

# Android SDK Configuration
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
EOF
    
    echo "✓ ANDROID_HOME adicionado com sucesso!"
else
    echo "✓ ANDROID_HOME já está configurado"
fi

# Recarregar shell
echo ""
echo "🔄 Recarregando configurações..."
source "$SHELL_RC"

# Verificar
echo ""
echo "🔍 Verificando configuração..."
if [ -n "$ANDROID_HOME" ]; then
    echo "✓ ANDROID_HOME = $ANDROID_HOME"
else
    echo "⚠️  ANDROID_HOME ainda não está definido"
    echo "Por favor, feche e abra um novo Terminal"
fi

# Verificar ADB
if command -v adb &> /dev/null; then
    echo "✓ ADB encontrado: $(which adb)"
else
    echo "⚠️  ADB não encontrado no PATH"
    echo "Tentando usar: $ANDROID_HOME/platform-tools/adb"
    if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
        echo "✓ ADB existe em: $ANDROID_HOME/platform-tools/adb"
    fi
fi

echo ""
echo "=========================================="
echo "✓ Configuração concluída!"
echo "=========================================="
echo ""
echo "Próximos passos:"
echo "1. Feche este Terminal"
echo "2. Abra um novo Terminal"
echo "3. Execute: python3 app.py"
echo ""
