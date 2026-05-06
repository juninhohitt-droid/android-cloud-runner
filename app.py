"""
Android Cloud Runner - Versão Portátil (Sem Docker)
Aplicação Flask que gerencia um emulador Android local
"""

import os
import sys
import json
import subprocess
import threading
import time
from pathlib import Path
from flask import Flask, render_template, request, jsonify, send_file
from werkzeug.utils import secure_filename
import platform

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 2 * 1024 * 1024 * 1024  # 2GB max

# Configurações
UPLOAD_FOLDER = Path(__file__).parent / 'uploads'
ANDROID_HOME = Path.home() / '.android'
EMULATOR_NAME = 'CloudRunner'

UPLOAD_FOLDER.mkdir(exist_ok=True)

# Estado global
emulator_state = {
    'running': False,
    'initializing': False,
    'error': None,
    'process': None,
    'port': 5554
}

def get_system_info():
    """Obter informações do sistema"""
    return {
        'os': platform.system(),
        'python_version': platform.python_version(),
        'android_home': str(ANDROID_HOME),
        'emulator_available': check_emulator_available()
    }

def check_emulator_available():
    """Verificar se emulador está disponível"""
    try:
        if platform.system() == 'Windows':
            result = subprocess.run(['where', 'emulator'], capture_output=True)
        else:
            result = subprocess.run(['which', 'emulator'], capture_output=True)
        return result.returncode == 0
    except:
        return False

def start_emulator():
    """Iniciar emulador Android"""
    if emulator_state['running'] or emulator_state['initializing']:
        return {'status': 'already_running', 'message': 'Emulador já está rodando'}
    
    emulator_state['initializing'] = True
    
    def run_emulator():
        try:
            # Comando para iniciar emulador
            if platform.system() == 'Windows':
                cmd = [
                    'emulator',
                    '-avd', EMULATOR_NAME,
                    '-no-snapshot-load',
                    '-no-snapshot-save',
                    '-netdelay', 'none',
                    '-netspeed', 'full'
                ]
            else:
                cmd = [
                    'emulator',
                    '-avd', EMULATOR_NAME,
                    '-no-snapshot-load',
                    '-no-snapshot-save',
                    '-netdelay', 'none',
                    '-netspeed', 'full'
                ]
            
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            emulator_state['process'] = process
            emulator_state['running'] = True
            emulator_state['initializing'] = False
            
            # Aguardar inicialização
            time.sleep(10)
            
        except Exception as e:
            emulator_state['error'] = str(e)
            emulator_state['initializing'] = False
    
    # Rodar em thread separada
    thread = threading.Thread(target=run_emulator, daemon=True)
    thread.start()
    
    return {'status': 'starting', 'message': 'Emulador iniciando...'}

def stop_emulator():
    """Parar emulador Android"""
    if emulator_state['process']:
        try:
            emulator_state['process'].terminate()
            emulator_state['process'].wait(timeout=5)
        except:
            emulator_state['process'].kill()
        
        emulator_state['running'] = False
        emulator_state['process'] = None
        return {'status': 'stopped', 'message': 'Emulador parado'}
    
    return {'status': 'not_running', 'message': 'Emulador não está rodando'}

def install_apk(apk_path):
    """Instalar APK no emulador"""
    if not emulator_state['running']:
        return {'status': 'error', 'message': 'Emulador não está rodando'}
    
    try:
        cmd = ['adb', 'install', '-r', str(apk_path)]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
        
        if result.returncode == 0:
            return {'status': 'success', 'message': 'APK instalado com sucesso'}
        else:
            return {'status': 'error', 'message': result.stderr}
    except Exception as e:
        return {'status': 'error', 'message': str(e)}

# Rotas
@app.route('/')
def index():
    """Página principal"""
    return render_template('index.html')

@app.route('/api/status')
def status():
    """Status do emulador"""
    return jsonify({
        'running': emulator_state['running'],
        'initializing': emulator_state['initializing'],
        'error': emulator_state['error'],
        'system_info': get_system_info()
    })

@app.route('/api/start', methods=['POST'])
def start():
    """Iniciar emulador"""
    result = start_emulator()
    return jsonify(result)

@app.route('/api/stop', methods=['POST'])
def stop():
    """Parar emulador"""
    result = stop_emulator()
    return jsonify(result)

@app.route('/api/upload', methods=['POST'])
def upload():
    """Upload e instalação de APK"""
    if 'file' not in request.files:
        return jsonify({'status': 'error', 'message': 'Nenhum arquivo enviado'}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'status': 'error', 'message': 'Arquivo vazio'}), 400
    
    if not file.filename.endswith('.apk'):
        return jsonify({'status': 'error', 'message': 'Apenas arquivos .apk são permitidos'}), 400
    
    try:
        filename = secure_filename(file.filename)
        filepath = UPLOAD_FOLDER / filename
        file.save(filepath)
        
        # Instalar APK
        result = install_apk(filepath)
        return jsonify(result)
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/api/adb/<command>', methods=['POST'])
def adb_command(command):
    """Executar comando ADB"""
    if not emulator_state['running']:
        return jsonify({'status': 'error', 'message': 'Emulador não está rodando'}), 400
    
    try:
        cmd = ['adb'] + command.split()
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
        return jsonify({
            'status': 'success',
            'output': result.stdout,
            'error': result.stderr
        })
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

if __name__ == '__main__':
    # Verificar se emulador está disponível
    if not check_emulator_available():
        print("⚠️  Aviso: Emulador Android não encontrado!")
        print("Instale o Android SDK e crie um AVD (Android Virtual Device)")
        print("Instruções: https://developer.android.com/studio/run/managing-avds")
    
    print("🚀 Android Cloud Runner - Versão Portátil")
    print("📱 Acesse: http://localhost:5000")
    print("⚠️  Certifique-se de que o emulador está instalado antes de usar")
    
    app.run(debug=False, host='0.0.0.0', port=5000)
