# 🚀 Deploy no Railway - Guia Completo Passo a Passo

## ⚠️ IMPORTANTE: Limitações do Railway

**O Railway NÃO suporta Android Emulator** porque:
- ❌ Não permite virtualização aninhada (nested virtualization)
- ❌ Não tem suporte a KVM/QEMU
- ❌ Não permite executar emuladores

**Solução Alternativa:** Vamos usar o **Railway com um servidor Python** que se conecta ao seu **Android Emulator local**.

---

## 📋 O Que Vamos Fazer

```
Seu Computador (Mac)          Railway (Nuvem)
┌──────────────────┐          ┌──────────────────┐
│ Android Emulator │◄─────────│ Servidor Python  │
│ (Rodando Local)  │ Conecta  │ (Rodando Railway)│
└──────────────────┘          └──────────────────┘
         ▲                              ▲
         │                              │
         └──────────────────────────────┘
              Você acessa de qualquer lugar
              URL: https://seu-app.railway.app
```

---

## 🎯 Pré-requisitos

- ✅ Conta no GitHub (gratuita)
- ✅ Conta no Railway (gratuita)
- ✅ Git instalado no seu Mac
- ✅ Android Emulator funcionando localmente

---

## 📝 PASSO 1: Preparar os Arquivos

### 1.1 Abra o Terminal

```bash
cd ~/Downloads/android-cloud-runner-portable\ 3
```

### 1.2 Inicialize um repositório Git

```bash
git init
```

### 1.3 Configure seu Git (primeira vez apenas)

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@gmail.com"
```

### 1.4 Adicione todos os arquivos

```bash
git add .
```

### 1.5 Faça o primeiro commit

```bash
git commit -m "Android Cloud Runner - Deploy no Railway"
```

---

## 🔑 PASSO 2: Criar Repositório no GitHub

### 2.1 Acesse GitHub

Abra: **https://github.com/new**

### 2.2 Preencha os dados

| Campo | Valor |
|-------|-------|
| Repository name | `android-cloud-runner` |
| Description | `Execute APKs reais via web` |
| Visibility | **Public** (importante!) |
| Initialize this repository | ❌ Deixe desmarcado |

### 2.3 Clique em "Create repository"

### 2.4 Copie o comando que aparece

Você verá algo como:
```bash
git remote add origin https://github.com/SEU_USUARIO/android-cloud-runner.git
git branch -M main
git push -u origin main
```

---

## 📤 PASSO 3: Fazer Upload para GitHub

### 3.1 Volte ao Terminal

```bash
cd ~/Downloads/android-cloud-runner-portable\ 3
```

### 3.2 Execute os comandos do GitHub

Cole os comandos que você copiou:

```bash
git remote add origin https://github.com/SEU_USUARIO/android-cloud-runner.git
git branch -M main
git push -u origin main
```

**Você será pedido para fazer login no GitHub:**
- Digite seu **username**
- Digite seu **token de acesso pessoal** (ou senha)

### 3.3 Verifique se funcionou

Abra: **https://github.com/SEU_USUARIO/android-cloud-runner**

Você deve ver seus arquivos lá!

---

## 🚂 PASSO 4: Criar Conta no Railway

### 4.1 Acesse Railway

Abra: **https://railway.app**

### 4.2 Clique em "Start Project"

### 4.3 Escolha "Deploy from GitHub"

### 4.4 Conecte sua conta GitHub

- Clique em "Connect GitHub"
- Autorize o Railway a acessar seus repositórios
- Selecione `android-cloud-runner`

### 4.5 Clique em "Deploy"

Railway vai começar a fazer o deploy automaticamente!

---

## ⚙️ PASSO 5: Configurar Variáveis de Ambiente

### 5.1 Acesse o Dashboard do Railway

Abra: **https://railway.app/dashboard**

### 5.2 Clique no seu projeto `android-cloud-runner`

### 5.3 Vá para "Variables"

### 5.4 Adicione estas variáveis

| Variável | Valor |
|----------|-------|
| `FLASK_ENV` | `production` |
| `PORT` | `5000` |
| `ANDROID_EMULATOR_HOST` | `seu-computador.local` |

**Para encontrar seu host:**

No Terminal do seu Mac, execute:
```bash
hostname
```

Você verá algo como: `MacBook-Pro.local`

Use esse valor em `ANDROID_EMULATOR_HOST`

### 5.5 Clique em "Save"

---

## 🔌 PASSO 6: Criar Arquivo Procfile

### 6.1 Volte ao seu projeto local

```bash
cd ~/Downloads/android-cloud-runner-portable\ 3
```

### 6.2 Crie um arquivo chamado `Procfile`

```bash
touch Procfile
```

### 6.3 Abra com um editor de texto

```bash
nano Procfile
```

### 6.4 Cole este conteúdo

```
web: python3 app_vnc.py
```

### 6.5 Salve (Ctrl+X, depois Y, depois Enter)

---

## 📦 PASSO 7: Criar Arquivo requirements.txt

### 7.1 Crie o arquivo

```bash
touch requirements.txt
```

### 7.2 Abra com editor

```bash
nano requirements.txt
```

### 7.3 Cole este conteúdo

```
Flask==2.3.0
Werkzeug==2.3.0
```

### 7.4 Salve (Ctrl+X, depois Y, depois Enter)

---

## 📤 PASSO 8: Fazer Upload dos Novos Arquivos

### 8.1 Adicione os arquivos

```bash
git add Procfile requirements.txt
```

### 8.2 Faça commit

```bash
git commit -m "Adicionar Procfile e requirements.txt para Railway"
```

### 8.3 Faça push

```bash
git push origin main
```

---

## 🔄 PASSO 9: Railway Vai Fazer Deploy Automaticamente

### 9.1 Volte ao Dashboard do Railway

Abra: **https://railway.app/dashboard**

### 9.2 Clique no seu projeto

### 9.3 Veja o "Deployment" acontecendo

Você verá logs como:
```
Building...
Installing dependencies...
Starting application...
```

### 9.4 Aguarde até ver "Deployment successful"

Pode levar 2-5 minutos

---

## 🌐 PASSO 10: Obter sua URL Pública

### 10.1 No Dashboard do Railway

Clique em "Domains"

### 10.2 Clique em "Generate Domain"

Railway vai gerar uma URL como:
```
https://android-cloud-runner-production.up.railway.app
```

### 10.3 Copie essa URL

---

## ⚠️ PASSO 11: Configurar Seu Mac para Aceitar Conexões Remotas

### 11.1 Abra as Configurações de Firewall

```bash
# Permita conexões de entrada
sudo defaults write /Library/Preferences/com.apple.alf allowdownloads -bool true
```

### 11.2 Inicie um servidor ngrok (tunnel)

Instale ngrok:
```bash
brew install ngrok
```

Inicie o tunnel:
```bash
ngrok http 5000
```

Você verá:
```
Forwarding                    http://abc123.ngrok.io -> http://localhost:5000
```

Copie a URL `http://abc123.ngrok.io`

### 11.3 Configure no Railway

Volte ao Dashboard do Railway e adicione uma variável:

| Variável | Valor |
|----------|-------|
| `EMULATOR_TUNNEL_URL` | `http://abc123.ngrok.io` |

---

## 🎉 PASSO 12: Testar Acesso Remoto

### 12.1 Certifique-se que o Android Emulator está rodando

No seu Mac:
```bash
python3 app_vnc.py
```

### 12.2 Acesse a URL do Railway

Abra em qualquer navegador:
```
https://seu-app.railway.app
```

### 12.3 Clique em "Iniciar Emulador"

Aguarde 30-60 segundos

### 12.4 Veja o Android aparecer!

---

## 📊 Resumo da Arquitetura

```
┌─────────────────────────────────────────────────────────────┐
│                    INTERNET (Qualquer Lugar)                │
└────────────────────────────┬────────────────────────────────┘
                             │
                    ┌────────▼────────┐
                    │  Railway.app    │
                    │  (Servidor Web) │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │   ngrok tunnel  │
                    │  (Conexão SSH)  │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │  Seu Mac Local  │
                    │  Android Studio │
                    │  (Emulador)     │
                    └─────────────────┘
```

---

## 🔧 Troubleshooting

### Problema: "Connection refused"

**Solução:**
1. Verifique se o Android Emulator está rodando no seu Mac
2. Verifique se ngrok está ativo
3. Reinicie o ngrok

### Problema: "Timeout"

**Solução:**
1. Verifique sua conexão de internet
2. Verifique se o firewall está bloqueando
3. Reinicie o ngrok

### Problema: "Port already in use"

**Solução:**
```bash
# Encontre o processo usando a porta 5000
lsof -i :5000

# Mate o processo
kill -9 <PID>
```

---

## 📝 Resumo dos Comandos

```bash
# 1. Inicializar Git
cd ~/Downloads/android-cloud-runner-portable\ 3
git init
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@gmail.com"

# 2. Fazer primeiro commit
git add .
git commit -m "Android Cloud Runner - Deploy no Railway"

# 3. Conectar ao GitHub
git remote add origin https://github.com/SEU_USUARIO/android-cloud-runner.git
git branch -M main
git push -u origin main

# 4. Criar Procfile e requirements.txt
touch Procfile requirements.txt

# 5. Adicionar e fazer push
git add Procfile requirements.txt
git commit -m "Adicionar Procfile e requirements.txt para Railway"
git push origin main

# 6. Instalar ngrok
brew install ngrok

# 7. Iniciar ngrok
ngrok http 5000

# 8. Rodar localmente
python3 app_vnc.py
```

---

## ✅ Checklist Final

- [ ] Repositório criado no GitHub
- [ ] Arquivos fazendo push para GitHub
- [ ] Projeto criado no Railway
- [ ] Variáveis de ambiente configuradas
- [ ] Procfile e requirements.txt adicionados
- [ ] ngrok instalado e rodando
- [ ] Android Emulator rodando localmente
- [ ] URL do Railway funcionando
- [ ] Consegue acessar de outro computador/celular

---

**Agora você tem um Android rodando na nuvem! 🎉**

Compartilhe a URL com qualquer pessoa e ela consegue usar seu Android remotamente!

---

## 💡 Próximas Ideias

1. **Automatizar ngrok** — Usar script para iniciar ngrok automaticamente
2. **Persistência de dados** — Salvar APKs instalados
3. **Múltiplos usuários** — Gerenciar diferentes emuladores
4. **Integração com CI/CD** — Deploy automático
5. **Monitoramento** — Alertas quando o emulador cai

