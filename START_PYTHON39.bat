@echo off
REM Script especial para Python 3.9 instalado em AppData\Roaming
REM Detecta automaticamente a instalação do Python e executa a aplicação

setlocal enabledelayedexpansion

echo.
echo ========================================
echo  Android Cloud Runner - Python 3.9
echo ========================================
echo.

REM Caminho padrão do Python 3.9 em AppData
set PYTHON_PATH=%USERPROFILE%\AppData\Local\Programs\Python\Python39
set PYTHON_EXE=!PYTHON_PATH!\python.exe

REM Se não encontrar em Local\Programs, tenta em Roaming
if not exist "!PYTHON_EXE!" (
    set PYTHON_PATH=%USERPROFILE%\AppData\Roaming\Python\Python39
    set PYTHON_EXE=!PYTHON_PATH!\python.exe
)

REM Se ainda não encontrar, tenta procurar em outros locais comuns
if not exist "!PYTHON_EXE!" (
    for /d %%D in (%USERPROFILE%\AppData\Local\Programs\Python\Python*) do (
        if exist "%%D\python.exe" (
            set PYTHON_EXE=%%D\python.exe
            echo [OK] Python encontrado em: %%D
            goto :found_python
        )
    )
)

:found_python

REM Verifica se encontrou o Python
if not exist "!PYTHON_EXE!" (
    echo.
    echo [ERRO] Python nao foi encontrado!
    echo.
    echo Locais procurados:
    echo  - %USERPROFILE%\AppData\Local\Programs\Python\Python39
    echo  - %USERPROFILE%\AppData\Roaming\Python\Python39
    echo.
    echo Solucoes:
    echo  1. Reinstale Python 3.9 marcando "Add Python to PATH"
    echo  2. Ou procure o arquivo python.exe no seu computador
    echo  3. E edite este arquivo para apontar para o caminho correto
    echo.
    pause
    exit /b 1
)

echo [OK] Python encontrado: !PYTHON_EXE!
echo.

REM Verifica se pip está disponível
echo [*] Verificando pip...
"!PYTHON_EXE!" -m pip --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] pip nao encontrado!
    pause
    exit /b 1
)
echo [OK] pip encontrado

echo.
echo [*] Instalando dependencias...
"!PYTHON_EXE!" -m pip install -q flask flask-cors requests pillow

if errorlevel 1 (
    echo [ERRO] Falha ao instalar dependencias!
    pause
    exit /b 1
)

echo [OK] Dependencias instaladas

echo.
echo [*] Iniciando Android Cloud Runner...
echo.

REM Inicia a aplicação
"!PYTHON_EXE!" app.py

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao iniciar a aplicacao!
    pause
    exit /b 1
)

pause
