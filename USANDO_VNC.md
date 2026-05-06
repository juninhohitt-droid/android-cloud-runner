# Android Cloud Runner - Com noVNC

## 📱 O que é noVNC?

**noVNC** é um visualizador VNC que funciona no navegador. Permite você **ver e controlar o Android emulador dentro do navegador**, sem precisar do Android Studio aberto.

---

## 🚀 Como Usar

### **Passo 1: Executar a aplicação**

```bash
cd ~/Downloads/android-cloud-runner-portable\ 3
python3 app_vnc.py
```

Você verá:
```
==================================================
  Android Cloud Runner - Com noVNC
==================================================

📱 Acesse: http://localhost:5000
🖥️  VNC Web: http://localhost:6080
```

### **Passo 2: Abrir no navegador**

- Safari ou Chrome
- Digite: **http://localhost:5000**

### **Passo 3: Iniciar o Emulador**

1. Clique no botão **"▶️ Iniciar Emulador"**
2. Aguarde 30-60 segundos
3. O Android deve aparecer na tela do lado direito

### **Passo 4: Instalar seu APK**

1. **Arraste seu arquivo .apk** para a caixa "Instalar APK"
2. Ou clique para selecionar
3. Aguarde a instalação

### **Passo 5: Usar o Android**

1. Clique na tela do Android (lado direito)
2. Use o mouse para clicar
3. Use o teclado para digitar
4. Procure pelo seu app e clique para abrir

---

## 🎮 Controles

| Ação | Como Fazer |
|------|-----------|
| Clicar | Clique do mouse |
| Digitar | Use o teclado |
| Voltar | Clique direito do mouse |
| Home | Pressione `H` |
| Recentes | Pressione `R` |
| Menu | Pressione `M` |

---

## 🔧 Troubleshooting

### **Problema: Android não aparece**

**Solução 1:** Aguarde mais tempo (até 2 minutos)

**Solução 2:** Verifique se o emulador iniciou:
```bash
adb devices
```

Deve aparecer:
```
List of attached devices
emulator-5554          device
```

**Solução 3:** Reinicie o emulador:
1. Clique em "⏹️ Parar Emulador"
2. Aguarde 5 segundos
3. Clique em "▶️ Iniciar Emulador"

### **Problema: APK não instala**

**Solução 1:** Verifique se o emulador está rodando

**Solução 2:** Tente instalar manualmente:
```bash
adb install -r /caminho/do/seu/app.apk
```

**Solução 3:** Verifique se o APK é compatível com Android 13+

### **Problema: Tela preta no VNC**

**Solução 1:** Clique na tela preta para ativar

**Solução 2:** Pressione `H` para ir para Home

**Solução 3:** Reinicie o emulador

---

## 📊 Status do Emulador

A interface mostra:
- ✓ **Status:** Rodando ou Parado
- 🖥️ **Sistema:** macOS, Linux, Windows
- 🐍 **Python:** Versão instalada
- 📦 **Android SDK:** Instalado ou não

---

## 🌐 Acessar Remotamente (Railway)

Para acessar de qualquer lugar:

1. **Fazer upload para GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Android Cloud Runner"
   git push origin main
   ```

2. **Deploy no Railway:**
   - Abra https://railway.app
   - Clique em "New Project"
   - Selecione "Deploy from GitHub"
   - Escolha seu repositório
   - Pronto! Você terá uma URL pública

3. **Acessar:**
   - Abra a URL pública do Railway
   - Tudo funciona igual ao local

---

## 💡 Dicas

1. **Deixe o emulador rodando:** Não feche a janela do Android Studio
2. **Use conexão local:** Mais rápido que Railway
3. **Teste antes de fazer deploy:** Certifique-se que funciona localmente
4. **Mantenha o Terminal rodando:** A aplicação precisa estar ativa

---

## 📝 Próximos Passos

1. ✅ Testar localmente (http://localhost:5000)
2. ✅ Instalar seu APK
3. ✅ Usar o app no Android
4. ✅ Fazer deploy no Railway
5. ✅ Acessar remotamente

---

**Pronto! Comece a usar! 🚀**
