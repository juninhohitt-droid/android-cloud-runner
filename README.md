# Android Cloud Runner - Versão Portátil

Uma solução **100% portátil** para rodar seu APK em um Android real, sem Docker, sem limitações.

## ✨ Características

- ✅ **Sem Docker** — Funciona em Windows 10 antigo
- ✅ **Portátil** — Leve e fácil de usar
- ✅ **Interface Web** — Acesse via navegador
- ✅ **Upload de APK** — Arrastar e soltar
- ✅ **Android Real** — Não é simulação
- ✅ **Gratuito** — 100% open-source

## 📋 Pré-requisitos

### 1. **Python 3.7+**

**Windows:**
- Baixe em: https://www.python.org/downloads/
- ⚠️ **IMPORTANTE:** Marque "Add Python to PATH" durante a instalação

**Mac:**
```bash
brew install python3
```

**Linux:**
```bash
sudo apt-get install python3 python3-pip
```

### 2. **Android SDK + Emulador**

Você precisa ter o Android SDK instalado com um emulador configurado.

**Opção A: Android Studio (Recomendado)**
1. Baixe em: https://developer.android.com/studio
2. Instale o Android Studio
3. Abra "AVD Manager" e crie um emulador
4. Defina `ANDROID_HOME` (veja abaixo)

**Opção B: Apenas SDK (Sem Android Studio)**
1. Baixe SDK Tools em: https://developer.android.com/tools
2. Instale manualmente
3. Crie um emulador com: `sdkmanager` e `avdmanager`

### 3. **Definir ANDROID_HOME**

**Windows (PowerShell como Admin):**
```powershell
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\SeuUsuario\AppData\Local\Android\Sdk", "User")
```

**Mac/Linux:**
```bash
export ANDROID_HOME=$HOME/Library/Android/Sdk  # Mac
export ANDROID_HOME=$HOME/Android/Sdk          # Linux
```

## 🚀 Como Usar

### **Windows**

1. **Descompacte o ZIP**
2. **Duplo clique em `START.bat`**
3. Aguarde a instalação de dependências
4. Abra: http://localhost:5000

### **Mac/Linux**

1. **Descompacte o ZIP**
2. **Abra terminal na pasta**
3. **Digite:**
   ```bash
   chmod +x start.sh
   ./start.sh
   ```
4. Abra: http://localhost:5000

## 📱 Usando a Interface

1. **Iniciar Emulador** — Clique no botão "Iniciar Emulador"
2. **Aguardar** — Leva 2-3 minutos para iniciar
3. **Upload APK** — Arraste seu .apk para a área de upload
4. **Instalar** — Clique em "Instalar"
5. **Abrir App** — Vá para o emulador e execute o app

## 🌐 Acesso Remoto (Railway)

Para acessar de **qualquer lugar**, siga o guia: `RAILWAY_DEPLOYMENT.md`

## ❓ Troubleshooting

### "Python não encontrado"
- Reinstale Python marcando "Add Python to PATH"
- Reinicie o computador

### "ANDROID_HOME não está definido"
- Siga as instruções de "Definir ANDROID_HOME" acima
- Reinicie o computador

### "Emulador não inicia"
- Verifique se o Android SDK está instalado
- Crie um emulador em Android Studio
- Verifique se a variável ANDROID_HOME está correta

### "Porta 5000 já em uso"
- Feche outros programas usando a porta
- Ou edite `app.py` e mude `port=5000` para outra porta

## 📚 Documentação

- `PASSO_A_PASSO.md` — Instruções detalhadas
- `GUIA_IMAGENS.md` — Guia com screenshots
- `RAILWAY_DEPLOYMENT.md` — Como fazer deploy no Railway

## 💡 Dicas

- Mantenha o emulador rodando enquanto usa o app
- Use emulador com 2+ cores de CPU para melhor performance
- Aumentar RAM do emulador melhora a velocidade

## 🆘 Suporte

Se tiver problemas:

1. Consulte `TROUBLESHOOTING.md`
2. Verifique se Python e Android SDK estão instalados
3. Verifique se `ANDROID_HOME` está definido corretamente

## 📄 Licença

MIT License - Veja `LICENSE.md`

---

**Pronto para começar? Abra `START.bat` (Windows) ou `start.sh` (Mac/Linux)! 🚀**
