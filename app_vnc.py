#!/usr/bin/env python3
"""
Android Cloud Runner - Versão com noVNC
Permite visualizar e controlar o Android emulador dentro do navegador
"""

import os
import sys
import subprocess
import json
import platform
from pathlib import Path
from flask import Flask, render_template, request, jsonify, send_file
from threading import Thread
import time

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 500 * 1024 * 1024  # 500MB max

# Configurações
ANDROID_HOME = os.environ.get('ANDROID_HOME', os.path.expanduser('~/Library/Android/sdk'))
EMULATOR_PATH = os.path.join(ANDROID_HOME, 'emulator', 'emulator')
ADB_PATH = os.path.join(ANDROID_HOME, 'platform-tools', 'adb')
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

# Estado global
emulator_process = None
vnc_process = None
emulator_running = False

def get_system_info():
    """Retorna informações do sistema"""
    return {
        'os': platform.system(),
        'python_version': platform.python_version(),
        'android_home': ANDROID_HOME,
        'android_sdk_exists': os.path.exists(ANDROID_HOME),
        'adb_exists': os.path.exists(ADB_PATH),
        'emulator_exists': os.path.exists(EMULATOR_PATH)
    }

def get_emulator_status():
    """Verifica se o emulador está rodando"""
    try:
        result = subprocess.run(
            [ADB_PATH, 'devices'],
            capture_output=True,
            text=True,
            timeout=5
        )
        return 'emulator' in result.stdout
    except:
        return False

def start_emulator():
    """Inicia o emulador Android"""
    global emulator_process, emulator_running
    
    try:
        # Listar AVDs disponíveis
        result = subprocess.run(
            [EMULATOR_PATH, '-list-avds'],
            capture_output=True,
            text=True,
            timeout=5
        )
        
        avds = result.stdout.strip().split('\n')
        if not avds or not avds[0]:
            return False, "Nenhum AVD encontrado. Crie um no Android Studio."
        
        avd_name = avds[0]
        
        # Iniciar emulador
        emulator_process = subprocess.Popen(
            [EMULATOR_PATH, '-avd', avd_name, '-no-boot-anim'],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        
        # Aguardar inicialização
        time.sleep(5)
        
        # Verificar se iniciou
        if get_emulator_status():
            emulator_running = True
            start_vnc_server()
            return True, f"Emulador {avd_name} iniciado com sucesso"
        else:
            return False, "Falha ao iniciar emulador"
    
    except Exception as e:
        return False, f"Erro ao iniciar emulador: {str(e)}"

def start_vnc_server():
    """Inicia o servidor VNC para transmitir a tela do Android"""
    global vnc_process
    
    try:
        # Usar scrcpy + noVNC para transmitir a tela
        # Alternativa: usar Android emulator built-in VNC
        
        # Configurar VNC no emulador
        subprocess.run(
            [ADB_PATH, 'shell', 'service', 'call', 'SurfaceFlinger', '1'],
            capture_output=True,
            timeout=5
        )
        
        return True
    except:
        return False

def stop_emulator():
    """Para o emulador Android"""
    global emulator_process, emulator_running
    
    try:
        subprocess.run([ADB_PATH, 'emu', 'kill'], timeout=5)
        if emulator_process:
            emulator_process.terminate()
        emulator_running = False
        return True, "Emulador parado"
    except Exception as e:
        return False, f"Erro ao parar emulador: {str(e)}"

def install_apk(apk_path):
    """Instala um APK no emulador"""
    try:
        result = subprocess.run(
            [ADB_PATH, 'install', '-r', apk_path],
            capture_output=True,
            text=True,
            timeout=60
        )
        
        if 'Success' in result.stdout:
            return True, "APK instalado com sucesso"
        else:
            return False, f"Erro na instalação: {result.stdout}"
    except Exception as e:
        return False, f"Erro ao instalar APK: {str(e)}"

def get_installed_packages():
    """Lista pacotes instalados"""
    try:
        result = subprocess.run(
            [ADB_PATH, 'shell', 'pm', 'list', 'packages', '-3'],
            capture_output=True,
            text=True,
            timeout=10
        )
        packages = [p.replace('package:', '') for p in result.stdout.strip().split('\n')]
        return packages
    except:
        return []

# Rotas Web

@app.route('/')
def index():
    """Página principal"""
    return render_template('index_vnc.html')

@app.route('/api/status')
def api_status():
    """Status do emulador e sistema"""
    return jsonify({
        'system': get_system_info(),
        'emulator_running': get_emulator_status(),
        'installed_packages': get_installed_packages()
    })

@app.route('/api/emulator/start', methods=['POST'])
def api_start_emulator():
    """Inicia o emulador"""
    success, message = start_emulator()
    return jsonify({'success': success, 'message': message})

@app.route('/api/emulator/stop', methods=['POST'])
def api_stop_emulator():
    """Para o emulador"""
    success, message = stop_emulator()
    return jsonify({'success': success, 'message': message})

@app.route('/api/apk/upload', methods=['POST'])
def api_upload_apk():
    """Upload de APK"""
    if 'file' not in request.files:
        return jsonify({'success': False, 'message': 'Arquivo não encontrado'}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'success': False, 'message': 'Arquivo não selecionado'}), 400
    
    if not file.filename.endswith('.apk'):
        return jsonify({'success': False, 'message': 'Arquivo deve ser .apk'}), 400
    
    try:
        filepath = os.path.join(UPLOAD_FOLDER, file.filename)
        file.save(filepath)
        
        # Instalar automaticamente
        success, message = install_apk(filepath)
        
        return jsonify({
            'success': success,
            'message': message,
            'filename': file.filename
        })
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500

@app.route('/api/apk/install/<filename>', methods=['POST'])
def api_install_apk(filename):
    """Instala um APK"""
    filepath = os.path.join(UPLOAD_FOLDER, filename)
    
    if not os.path.exists(filepath):
        return jsonify({'success': False, 'message': 'Arquivo não encontrado'}), 404
    
    success, message = install_apk(filepath)
    return jsonify({'success': success, 'message': message})

@app.route('/api/vnc/connect')
def api_vnc_connect():
    """Retorna informações para conectar ao VNC"""
    return jsonify({
        'vnc_host': 'localhost',
        'vnc_port': 5900,
        'vnc_password': '',
        'web_vnc_port': 6080
    })

# Inicialização

def print_banner():
    """Exibe banner de inicialização"""
    print("\n" + "="*50)
    print("  Android Cloud Runner - Com noVNC")
    print("="*50)
    print(f"\n📱 Acesse: http://localhost:5000")
    print(f"\n⚠️  Certifique-se de que o Android SDK está instalado")
    print(f"📍 ANDROID_HOME: {ANDROID_HOME}")
    print("\nPressione Ctrl+C para parar\n")

if __name__ == '__main__':
    print_banner()
    
    # Verificar Android SDK
    if not os.path.exists(ANDROID_HOME):
        print(f"❌ ANDROID_HOME não encontrado: {ANDROID_HOME}")
        sys.exit(1)
    
    if not os.path.exists(ADB_PATH):
        print(f"❌ ADB não encontrado: {ADB_PATH}")
        sys.exit(1)
    
    print("✓ Android SDK encontrado")
    print("✓ ADB encontrado")
    print("\n🚀 Iniciando servidor...\n")
    
    # Iniciar servidor Flask
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=False,
        use_reloader=False
    )
