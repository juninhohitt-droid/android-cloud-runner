@echo off
REM Android Cloud Runner - Script de Inicialização (Windows)

echo.
echo ========================================
echo  Android Cloud Runner - Portátil
echo ========================================
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERRO: Python não está instalado!
    echo.
    echo Baixe Python em: https://www.python.org/downloads/
    echo Certifique-se de marcar "Add Python to PATH" durante a instalação
    echo.
    pause
    exit /b 1
)

echo ✓ Python encontrado
echo.

REM Verificar se pip está disponível
pip --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERRO: pip não está disponível!
    echo.
    pause
    exit /b 1
)

echo ✓ pip encontrado
echo.

REM Instalar dependências
echo 📦 Instalando dependências...
pip install -r requirements.txt
if errorlevel 1 (
    echo ❌ ERRO ao instalar dependências!
    pause
    exit /b 1
)

echo ✓ Dependências instaladas
echo.

REM Verificar Android SDK
echo 🔍 Verificando Android SDK...
if not defined ANDROID_HOME (
    echo ⚠️  AVISO: ANDROID_HOME não está definido!
    echo.
    echo Para usar o emulador, você precisa:
    echo 1. Instalar Android SDK
    echo 2. Definir variável ANDROID_HOME
    echo.
    echo Instruções: https://developer.android.com/studio
    echo.
    echo Você pode continuar, mas o emulador não funcionará.
    echo.
)

REM Iniciar aplicação
echo.
echo 🚀 Iniciando Android Cloud Runner...
echo 📱 Acesse: http://localhost:5000
echo.
echo Pressione Ctrl+C para parar
echo.

python app.py

pause
