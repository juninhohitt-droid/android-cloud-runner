# 📸 Guia em Imagens - Android Cloud Runner Portátil

Um guia visual passo a passo com 10 screenshots anotadas mostrando exatamente o que fazer.

---

## **Passo 1: Baixar Python**

![Step 1: Download Python](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-01-python-download-4abRgaYKgF2AYkDLjdw4Rq.webp)

**O que fazer:**
1. Abra https://www.python.org/downloads/
2. Clique no botão amarelo "Download Python 3.x.x"
3. O arquivo vai baixar automaticamente

---

## **Passo 2: Instalar Python (⚠️ IMPORTANTE)**

![Step 2: IMPORTANT - Check Add Python to PATH](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-02-python-install-RWh2Mh8nVmuVRYsD78kSyQ.webp)

**O que fazer:**
1. Execute o instalador do Python
2. **IMPORTANTE:** Marque a caixa "Add Python to PATH" (veja a seta vermelha)
3. Clique em "Install Now"
4. Aguarde a conclusão
5. **Reinicie o computador**

---

## **Passo 3: Baixar Android Studio**

![Step 3: Download Android Studio](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-03-android-studio-P4TiL9MYBAtLWgXmqNy7ou.webp)

**O que fazer:**
1. Abra https://developer.android.com/studio
2. Clique no botão "Download Android Studio"
3. O arquivo vai baixar automaticamente

---

## **Passo 4: Criar Emulador Android**

![Step 4: Create Android Emulator](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-04-create-emulator-nv5Fpuk33KsVqKSgA5fMxu.webp)

**O que fazer:**
1. Abra Android Studio
2. Vá para **Tools → Device Manager**
3. Clique em **"Create device"**
4. Selecione um modelo (ex: Pixel 5)
5. Clique em **"Next"**
6. Selecione uma versão do Android (ex: Android 13)
7. Clique em **"Finish"**

---

## **Passo 5: Descompactar o ZIP**

![Step 5: Extract ZIP file](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-05-extract-zip-axjuVvZYfkBVvptJ9bjrjR.webp)

**O que fazer:**
1. Localize o arquivo `android-cloud-runner-portable.zip`
2. Clique direito e selecione **"Extract All..."**
3. Escolha um local (ex: Desktop ou Documents)
4. Clique em **"Extract"**
5. Uma pasta será criada

---

## **Passo 6: Abrir Terminal na Pasta**

![Step 6: Open Terminal in Folder](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-06-open-terminal-YZWgk6rqGHjDJ2cRRMQYQS.webp)

**O que fazer:**
1. Abra a pasta `android-cloud-runner-portable`
2. Clique direito em um espaço vazio
3. Selecione **"Open PowerShell here"**
4. Uma janela preta vai abrir

---

## **Passo 7: Executar START.bat**

![Step 7: Run START.bat](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-07-run-start-bat-4EFCNHkqzUPaQ8AZaJGWqx.webp)

**O que fazer:**
1. Na janela do PowerShell, digite:
   ```
   START.bat
   ```
2. Pressione Enter
3. Você verá mensagens:
   - "✓ Python encontrado"
   - "✓ pip encontrado"
   - "📦 Instalando dependências..."

---

## **Passo 8: Dependências Instalando**

![Step 8: Dependencies Installing](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-08-dependencies-installing-ULkAhHiHSEnTdeMVaWkjUR.webp)

**O que fazer:**
1. Aguarde o terminal instalar Flask e Werkzeug
2. Você verá barras de progresso verdes
3. Quando terminar, verá: "✓ Dependências instaladas"

---

## **Passo 9: Aplicação Iniciada com Sucesso**

![Step 9: App Started Successfully](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-09-app-started-oJmNk2C8AoAoVG6oVVNywF.webp)

**O que fazer:**
1. Aguarde as mensagens finais
2. Você verá: "🚀 Iniciando Android Cloud Runner..."
3. E: "📱 Acesse: http://localhost:5000"
4. **Não feche esta janela!** Mantenha aberta enquanto usa

---

## **Passo 10: Abrir no Navegador**

![Step 10: Open Browser - Type localhost:5000](https://d2xsxph8kpxj0f.cloudfront.net/310519663628829151/WViD2fEZ2iqcgPX6BpsrUC/portable-10-browser-access-gveg69Kpmb69bPUMizQicB.webp)

**O que fazer:**
1. Abra seu navegador (Chrome, Firefox, Edge, Safari)
2. Na barra de endereço, digite:
   ```
   http://localhost:5000
   ```
3. Pressione Enter
4. Você verá a interface do Android Cloud Runner!

---

## ✅ Checklist de Conclusão

- [ ] Python instalado com "Add Python to PATH"
- [ ] Android Studio instalado
- [ ] Emulador Android criado
- [ ] ZIP descompactado
- [ ] Terminal aberto na pasta
- [ ] START.bat executado
- [ ] Dependências instaladas
- [ ] Aplicação rodando (http://localhost:5000)
- [ ] Interface web carregada

---

## 🎉 Pronto!

Você completou a instalação! Agora você pode:

1. **Instalar APKs** — Arraste seu arquivo .apk para a interface
2. **Iniciar o emulador** — Clique em "Iniciar Emulador"
3. **Rodar seus apps** — Execute normalmente no Android

---

## 💡 Dicas

- Mantenha o terminal aberto enquanto usa
- Mantenha o emulador rodando
- Para parar, pressione Ctrl+C no terminal

---

**Próximo passo:** Para acessar de qualquer lugar, siga o guia `RAILWAY_DEPLOYMENT.md`
