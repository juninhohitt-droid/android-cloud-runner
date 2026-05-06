# 📖 Passo a Passo - Android Cloud Runner Portátil

Um guia completo para instalar e usar a versão portátil sem Docker.

**Tempo estimado:** 30-45 minutos (primeira vez)

---

## 🎯 Visão Geral

Este guia cobre:

1. **Instalação de Python** — Linguagem necessária
2. **Instalação de Android SDK** — Emulador Android
3. **Configuração do ANDROID_HOME** — Variável de ambiente
4. **Execução da aplicação** — Iniciar o Android Cloud Runner
5. **Uso da interface web** — Instalar e rodar APKs

---

## Passo 1: Instalar Python

### **Windows**

1. Abra https://www.python.org/downloads/
2. Clique em "Download Python 3.x.x"
3. Execute o instalador
4. **⚠️ IMPORTANTE:** Marque a caixa "Add Python to PATH"
5. Clique em "Install Now"
6. Aguarde a conclusão
7. Reinicie o computador

**Verificar instalação:**
- Abra PowerShell
- Digite: `python --version`
- Deve mostrar: `Python 3.x.x`

### **Mac**

```bash
# Instalar Homebrew (se não tiver)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalar Python
brew install python3

# Verificar
python3 --version
```

### **Linux (Ubuntu/Debian)**

```bash
# Atualizar pacotes
sudo apt-get update

# Instalar Python
sudo apt-get install python3 python3-pip

# Verificar
python3 --version
```

---

## Passo 2: Instalar Android SDK

### **Opção A: Android Studio (Recomendado)**

1. Abra https://developer.android.com/studio
2. Clique em "Download Android Studio"
3. Execute o instalador
4. Siga as instruções de instalação
5. Abra Android Studio
6. Vá para **Tools → Device Manager**
7. Clique em **"Create Device"**
8. Selecione um modelo (ex: Pixel 5)
9. Selecione uma versão do Android (ex: Android 13)
10. Clique em **"Finish"**

### **Opção B: Apenas SDK (Sem Android Studio)**

**Windows:**
1. Baixe em: https://developer.android.com/tools
2. Descompacte em: `C:\Android\Sdk`
3. Adicione `C:\Android\Sdk\tools\bin` ao PATH

**Mac/Linux:**
```bash
# Criar pasta
mkdir -p ~/Android/Sdk

# Baixar SDK
# (Siga instruções em https://developer.android.com/tools)

# Adicionar ao PATH
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bash_profile
source ~/.bash_profile
```

---

## Passo 3: Definir ANDROID_HOME

A variável `ANDROID_HOME` diz ao Android Cloud Runner onde encontrar o SDK.

### **Windows (PowerShell como Admin)**

1. Abra PowerShell como Administrador
2. Digite:
   ```powershell
   [Environment]::SetEnvironmentVariable("ANDROID_HOME", "C:\Users\SeuUsuario\AppData\Local\Android\Sdk", "User")
   ```
   (Substitua `SeuUsuario` pelo seu usuário do Windows)
3. Reinicie o computador
4. Verifique:
   ```powershell
   echo $env:ANDROID_HOME
   ```
   Deve mostrar o caminho do SDK

### **Mac**

1. Abra Terminal
2. Digite:
   ```bash
   nano ~/.bash_profile
   ```
3. Adicione:
   ```bash
   export ANDROID_HOME=$HOME/Library/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
   ```
4. Pressione Ctrl+X, depois Y, depois Enter
5. Reinicie o Terminal
6. Verifique:
   ```bash
   echo $ANDROID_HOME
   ```

### **Linux**

1. Abra Terminal
2. Digite:
   ```bash
   nano ~/.bashrc
   ```
3. Adicione:
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
   ```
4. Pressione Ctrl+X, depois Y, depois Enter
5. Reinicie o Terminal
6. Verifique:
   ```bash
   echo $ANDROID_HOME
   ```

---

## Passo 4: Criar um Emulador Android

### **Via Android Studio**

1. Abra Android Studio
2. Vá para **Tools → Device Manager**
3. Clique em **"Create Device"**
4. Selecione um modelo (ex: Pixel 5)
5. Clique em **"Next"**
6. Selecione uma versão do Android (ex: Android 13)
7. Clique em **"Next"**
8. Dê um nome (ex: `CloudRunner`)
9. Clique em **"Finish"**

### **Via Terminal**

```bash
# Listar modelos disponíveis
sdkmanager --list | grep "system-images"

# Instalar uma imagem (exemplo: Android 13)
sdkmanager "system-images;android-33;google_apis;x86_64"

# Criar emulador
avdmanager create avd -n CloudRunner -k "system-images;android-33;google_apis;x86_64"
```

---

## Passo 5: Descompactar o ZIP

1. Localize o arquivo `android-cloud-runner-portable.zip`
2. Clique direito e selecione **"Extrair tudo"**
3. Escolha um local (ex: Desktop ou Documents)
4. Clique em **"Extrair"**
5. Uma pasta `android-cloud-runner-portable` será criada

---

## Passo 6: Executar a Aplicação

### **Windows**

1. Abra a pasta `android-cloud-runner-portable`
2. **Duplo clique em `START.bat`**
3. Uma janela preta (PowerShell) vai abrir
4. Aguarde as mensagens:
   - "✓ Python encontrado"
   - "✓ pip encontrado"
   - "📦 Instalando dependências..."
   - "✓ Dependências instaladas"
   - "🚀 Iniciando Android Cloud Runner..."
5. Você verá: "📱 Acesse: http://localhost:5000"

### **Mac/Linux**

1. Abra Terminal
2. Navegue para a pasta:
   ```bash
   cd ~/Downloads/android-cloud-runner-portable
   # (ou o local onde você descompactou)
   ```
3. Digite:
   ```bash
   chmod +x start.sh
   ./start.sh
   ```
4. Aguarde as mensagens (mesmas do Windows)

---

## Passo 7: Acessar a Interface Web

1. Abra seu navegador (Chrome, Firefox, Safari, Edge)
2. Na barra de endereço, digite:
   ```
   http://localhost:5000
   ```
3. Pressione Enter
4. Você verá a interface do Android Cloud Runner

---

## Passo 8: Iniciar o Emulador

1. Na interface web, clique no botão **"▶️ Iniciar Emulador"**
2. Aguarde a mensagem: "Emulador iniciando. Aguarde 2-3 minutos..."
3. O status mudará de "Parado" para "Inicializando..." para "Rodando"
4. Quando estiver "Rodando", o emulador está pronto

---

## Passo 9: Instalar seu APK

1. Na seção **"Instalar APK"**, você verá uma área com borda tracejada
2. **Arraste seu arquivo .apk** para essa área
3. Ou clique para selecionar o arquivo
4. Aguarde a barra de progresso
5. Você verá: "✓ APK instalado com sucesso!"

---

## Passo 10: Abrir o Emulador

1. Na interface web, procure pelo botão **"Abrir Emulador"**
2. Clique no botão
3. Uma nova aba do navegador vai abrir mostrando a tela do Android
4. Você pode interagir com o Android normalmente

---

## Passo 11: Executar seu App

1. No emulador, procure o ícone do seu app
2. Se não ver, deslize para cima para abrir a gaveta de apps
3. Procure o nome do seu app
4. Clique no ícone para abrir
5. Seu app vai executar normalmente!

---

## Passo 12: Parar o Emulador

Quando terminar:

1. Na interface web, clique em **"⏹️ Parar Emulador"**
2. O emulador vai desligar
3. Você pode fechar o navegador

---

## ✅ Checklist de Conclusão

- [ ] Python 3.7+ instalado
- [ ] Android SDK instalado
- [ ] ANDROID_HOME definido
- [ ] Emulador Android criado
- [ ] ZIP descompactado
- [ ] `START.bat` ou `start.sh` executado
- [ ] Interface web acessível em http://localhost:5000
- [ ] Emulador iniciado com sucesso
- [ ] APK instalado
- [ ] App executado no emulador

---

## 🆘 Problemas Comuns

### "Python não encontrado"
- Reinstale Python marcando "Add Python to PATH"
- Reinicie o computador

### "ANDROID_HOME não está definido"
- Siga as instruções do Passo 3
- Reinicie o computador

### "Emulador não inicia"
- Verifique se criou um emulador no Passo 4
- Verifique se ANDROID_HOME está correto
- Tente iniciar o emulador manualmente via Android Studio

### "Porta 5000 já em uso"
- Feche outros programas usando a porta
- Ou edite `app.py` e mude `port=5000` para outra porta (ex: 5001)

### "Interface web não carrega"
- Verifique se a aplicação está rodando (deve estar no terminal)
- Tente atualizar a página (F5)
- Tente outro navegador

---

## 💡 Dicas

- Mantenha o terminal aberto enquanto usa a aplicação
- Mantenha o emulador rodando enquanto instala/usa apps
- Use emulador com 2+ cores de CPU para melhor performance
- Aumentar RAM do emulador melhora a velocidade

---

**Pronto! Você completou o passo a passo! 🎉**

Para acessar de qualquer lugar (acesso remoto), siga: `RAILWAY_DEPLOYMENT.md`
