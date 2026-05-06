# 📱 Guia Completo: Android Studio + Criar Emulador

## O que é Android Studio?

**Android Studio** é o programa oficial do Google para desenvolver apps Android. Para o Android Cloud Runner, você precisa dele para:

1. **Criar um emulador** (um "celular virtual" no seu PC)
2. **Instalar e testar APKs** nesse emulador virtual
3. **Gerenciar versões do Android** e ferramentas de desenvolvimento

---

## 📥 Passo 1: Baixar Android Studio

### 1.1 Abrir o site oficial

1. Abra seu navegador (Chrome, Firefox, Edge, etc.)
2. Digite na barra de endereço:
   ```
   https://developer.android.com/studio
   ```
3. Pressione Enter

### 1.2 Clicar em "Download Android Studio"

Você verá um botão grande azul com o texto **"Download Android Studio"**. Clique nele.

### 1.3 Aceitar os termos

Aparecerá uma página com termos de serviço. Você precisa:
1. Ler os termos (ou apenas rolar para baixo)
2. Marcar a caixa **"I have read and agree with the above terms and conditions"**
3. Clicar em **"Download Android Studio"**

### 1.4 Aguardar o download

O arquivo vai começar a baixar. Ele tem cerca de **1-2 GB**, então pode levar alguns minutos dependendo da sua internet.

**Tempo estimado: 5-15 minutos** (depende da sua velocidade de internet)

---

## 💾 Passo 2: Instalar Android Studio

### 2.1 Localizar o arquivo baixado

1. Abra a pasta **Downloads** (geralmente fica no seu Desktop ou na barra lateral)
2. Procure por um arquivo chamado:
   ```
   android-studio-XXXX.exe
   ```
   (Os X são números/letras da versão)

### 2.2 Executar o instalador

1. Duplo clique no arquivo `android-studio-XXXX.exe`
2. Pode aparecer uma pergunta: **"Do you want to allow this app to make changes to your device?"**
3. Clique em **"Yes"**

### 2.3 Tela de Boas-vindas

Aparecerá uma janela com **"Android Studio Setup Wizard"**. Clique em **"Next"**.

### 2.4 Escolher Componentes

Na tela **"Install Type"**, você verá duas opções:
- **Standard** (recomendado) — Instala tudo necessário
- **Custom** — Você escolhe o que instalar

**Selecione "Standard"** e clique em **"Next"**.

### 2.5 Escolher Pasta de Instalação

Aparecerá uma tela perguntando onde instalar. A pasta padrão é:
```
C:\Program Files\Android\android-studio
```

**Deixe como está** e clique em **"Next"**.

### 2.6 Escolher Pasta de Dados

Aparecerá outra tela perguntando sobre a pasta de dados do Android SDK. A padrão é:
```
C:\Users\SeuNome\AppData\Local\Android\Sdk
```

**Deixe como está** e clique em **"Next"**.

### 2.7 Confirmar Instalação

Aparecerá um resumo das configurações. Clique em **"Install"**.

### 2.8 Aguardar Instalação

O Android Studio vai começar a instalar. Isso pode levar **10-20 minutos**. Você verá uma barra de progresso.

**Não feche a janela!** Aguarde até o final.

### 2.9 Finalizar Instalação

Quando terminar, clique em **"Finish"**.

**Tempo estimado: 15-30 minutos** (depende do seu PC)

---

## 🚀 Passo 3: Primeira Execução do Android Studio

### 3.1 Android Studio vai abrir

Quando você clica em "Finish", o Android Studio vai abrir pela primeira vez. Isso pode levar alguns minutos.

### 3.2 Tela de Boas-vindas

Você verá uma tela com o logo do Android Studio e opções como:
- "New Project"
- "Open Project"
- "Get from Version Control"

**Clique em "New Project"** (ou qualquer uma das opções, não importa).

### 3.3 Configuração Inicial

O Android Studio vai baixar componentes necessários. Isso pode levar **5-10 minutos**. Você verá mensagens como:
- "Downloading SDK..."
- "Installing components..."

**Aguarde até terminar!**

### 3.4 Pronto!

Quando terminar, você verá a tela principal do Android Studio com um editor de código vazio.

**Tempo estimado: 10-20 minutos**

---

## 📱 Passo 4: Criar um Emulador Android

### 4.1 Abrir o Device Manager

No Android Studio, procure no menu superior por **"Tools"**. Clique nele.

Você verá um menu suspenso com várias opções. Procure por **"Device Manager"** e clique.

**Alternativa:** Se não encontrar em Tools, procure no lado esquerdo da tela por um ícone que parece um celular. Clique nele.

### 4.2 Tela do Device Manager

Você verá uma janela chamada **"Device Manager"** com:
- Uma lista vazia (ou com emuladores já criados)
- Um botão **"Create device"** (ou "Create Virtual Device")

**Clique em "Create device"**.

### 4.3 Escolher Modelo de Dispositivo

Aparecerá uma lista de modelos de telefones/tablets. Você verá opções como:
- **Pixel 5** (recomendado para iniciantes)
- **Pixel 6**
- **Pixel 7**
- **Nexus 5**
- E muitos outros...

**Selecione "Pixel 5"** (é um bom modelo para começar).

Depois clique em **"Next"**.

### 4.4 Escolher Versão do Android

Aparecerá uma lista de versões do Android. Você verá:
- **Android 13** (recomendado)
- **Android 12**
- **Android 11**
- E versões antigas...

**Selecione "Android 13"** (ou a versão mais recente disponível).

Você verá informações como:
- "Recommended" — Significa que é uma boa escolha
- Tamanho do download (ex: 1.2 GB)

Se aparecer um botão **"Download"**, clique nele para baixar a versão do Android.

Depois clique em **"Next"**.

### 4.5 Verificar Configurações

Aparecerá uma tela chamada **"Verify Configuration"** com resumo:
- **Device Name:** Pixel 5 (ou o que você escolheu)
- **Device Type:** Phone
- **API Level:** 33 (ou similar)
- **RAM:** 2 GB (ou mais)
- **VM Heap:** 512 MB
- **Internal Storage:** 2 GB
- **SD Card:** 512 MB

**Deixe tudo como está** e clique em **"Finish"**.

### 4.6 Emulador Criado!

Você verá uma mensagem de sucesso e o emulador aparecerá na lista do Device Manager.

**Tempo estimado: 10-30 minutos** (depende da velocidade de internet para baixar a versão do Android)

---

## ▶️ Passo 5: Iniciar o Emulador

### 5.1 Abrir Device Manager (se não estiver aberto)

No Android Studio, vá para **Tools → Device Manager**.

### 5.2 Listar de Emuladores

Você verá a lista de emuladores criados. Procure pelo que acabou de criar (ex: "Pixel 5").

### 5.3 Iniciar o Emulador

Você verá um botão de **"Play"** (triângulo verde) ao lado do emulador. Clique nele.

### 5.4 Emulador Iniciando

Uma janela vai abrir mostrando o emulador iniciando. Você verá:
- A tela preta do Android iniciando
- O logo do Android
- A animação de boot

Isso pode levar **2-5 minutos**.

### 5.5 Pronto!

Quando terminar, você verá a tela inicial do Android com:
- Relógio
- Data
- Ícones de apps
- Teclado na parte inferior

**Parabéns! Seu emulador Android está rodando! 🎉**

---

## 🔧 Passo 6: Configurações Importantes do Emulador

### 6.1 Aumentar Performance

Se o emulador estiver lento, você pode aumentar a RAM:

1. No Device Manager, clique no emulador
2. Procure por um ícone de **"Edit"** (lápis)
3. Clique nele
4. Procure por **"RAM"** e aumente para **4 GB** (se seu PC tiver memória)
5. Clique em **"Finish"**

### 6.2 Usar Aceleração de Hardware

Para melhorar performance:
1. No Device Manager, clique no emulador
2. Clique em **"Edit"**
3. Procure por **"Graphics"**
4. Selecione **"Hardware"** (em vez de "Software")
5. Clique em **"Finish"**

### 6.3 Ativar Modo Desenvolvedor

Dentro do emulador Android:
1. Abra **Configurações** (ícone de engrenagem)
2. Procure por **"Sobre o telefone"** ou **"About phone"**
3. Procure por **"Número da compilação"** ou **"Build number"**
4. Clique 7 vezes nele
5. Aparecerá uma mensagem: **"Você agora é um desenvolvedor!"**

---

## 📱 Passo 7: Instalar seu APK no Emulador

### 7.1 Arrastar e Soltar

A forma mais fácil é:
1. Localize seu arquivo `.apk` no computador
2. Arraste o arquivo e solte na janela do emulador
3. O APK vai instalar automaticamente

### 7.2 Usar Linha de Comando

Se o método acima não funcionar:
1. Abra PowerShell
2. Navegue até a pasta do seu APK
3. Digite:
   ```
   adb install seu_app.apk
   ```
4. Pressione Enter
5. Aguarde a instalação

### 7.3 Ver o App Instalado

Após instalar, você verá o app na lista de aplicativos do emulador:
1. Abra a **Gaveta de Apps** (ícone de grade)
2. Procure pelo seu app
3. Clique para abrir

---

## ⚙️ Passo 8: Conectar Android Cloud Runner com o Emulador

### 8.1 O que Você Precisa Fazer

Agora que tem um emulador rodando, você pode:
1. Executar `START_PYTHON39.bat`
2. Abrir http://localhost:5000
3. Fazer upload do seu APK
4. Instalar no emulador
5. Testar seu app

### 8.2 Fluxo Completo

```
Android Studio (emulador rodando)
         ↓
Android Cloud Runner (http://localhost:5000)
         ↓
Upload seu APK
         ↓
Instalar no emulador
         ↓
Testar seu app
```

---

## 🆘 Problemas Comuns

### ❌ "Android Studio não abre"

**Solução:**
1. Reinicie o computador
2. Tente abrir Android Studio novamente
3. Se ainda não funcionar, desinstale e reinstale

### ❌ "Emulador não inicia"

**Solução:**
1. Feche o emulador
2. Vá para Device Manager
3. Clique em **"Edit"** no emulador
4. Mude **"Graphics"** para **"Software"**
5. Clique em **"Finish"**
6. Tente iniciar novamente

### ❌ "Emulador muito lento"

**Solução:**
1. Feche outros programas
2. Aumente a RAM do emulador (veja Passo 6.1)
3. Ative aceleração de hardware (veja Passo 6.2)
4. Reinicie o emulador

### ❌ "APK não instala"

**Solução:**
1. Verifique se o arquivo `.apk` é válido
2. Tente arrastar e soltar novamente
3. Ou use `adb install seu_app.apk`
4. Verifique se o emulador tem espaço em disco

### ❌ "Erro: 'adb' não encontrado"

**Solução:**
1. Android Studio deve estar instalado
2. Reinicie o PowerShell
3. Ou use o caminho completo:
   ```
   C:\Users\SeuNome\AppData\Local\Android\Sdk\platform-tools\adb.exe install seu_app.apk
   ```

---

## ✅ Checklist de Conclusão

- [ ] Android Studio baixado (2 GB)
- [ ] Android Studio instalado (15-30 min)
- [ ] Android Studio aberto pela primeira vez
- [ ] Device Manager acessado
- [ ] Emulador criado (Pixel 5 + Android 13)
- [ ] Emulador iniciado (2-5 min)
- [ ] Emulador rodando corretamente
- [ ] APK instalado no emulador
- [ ] App testado no emulador
- [ ] Pronto para usar Android Cloud Runner!

---

## 🎉 Próximos Passos

Agora que você tem um emulador Android rodando:

1. **Execute `START_PYTHON39.bat`**
2. **Abra http://localhost:5000**
3. **Faça upload do seu APK**
4. **Instale e teste no emulador**
5. **Aproveite!**

---

## 📞 Dúvidas?

Se tiver dúvidas sobre Android Studio:
1. Consulte a documentação oficial: https://developer.android.com/docs
2. Procure no YouTube por "Android Studio tutorial"
3. Ou use o arquivo `TROUBLESHOOTING_PYTHON39.md`

**Boa sorte! 🚀**
