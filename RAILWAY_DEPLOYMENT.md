# 🚀 Deployment no Railway - Acesso Remoto Gratuito

Guia completo para rodar seu Android Cloud Runner **na nuvem** e acessar de **qualquer lugar**.

**Tempo estimado:** 15-20 minutos

---

## ✨ O que é Railway?

Railway é uma plataforma que permite rodar aplicações na nuvem **gratuitamente**:

- ✅ **500 horas/mês grátis** — Suficiente para usar 16+ horas por dia
- ✅ **Acesso remoto** — Acesse de qualquer dispositivo, qualquer lugar
- ✅ **Sem cartão de crédito** — Totalmente gratuito
- ✅ **Fácil de usar** — Deploy em 5 minutos

---

## 📋 Pré-requisitos

1. **Conta GitHub** — Crie em https://github.com/signup
2. **Conta Railway** — Crie em https://railway.app (use GitHub para login)
3. **Versão portátil** — Já descompactada no seu computador

---

## Passo 1: Criar Repositório GitHub

### 1.1 Fazer Login no GitHub

1. Abra https://github.com
2. Clique em **"Sign in"**
3. Digite seu email e senha
4. Clique em **"Sign in"**

### 1.2 Criar Novo Repositório

1. Clique no ícone **"+"** no canto superior direito
2. Selecione **"New repository"**
3. Preencha:
   - **Repository name:** `android-cloud-runner`
   - **Description:** `Android Cloud Runner - Portátil`
   - **Public:** Marque esta opção
4. Clique em **"Create repository"**

### 1.3 Preparar Arquivos Localmente

1. Abra PowerShell/Terminal na pasta `android-cloud-runner-portable`
2. Digite:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

### 1.4 Fazer Upload para GitHub

1. Copie o comando que GitHub mostra (algo como):
   ```bash
   git remote add origin https://github.com/SeuUsuario/android-cloud-runner.git
   git branch -M main
   git push -u origin main
   ```
2. Cole no PowerShell/Terminal
3. Digite seu username e token do GitHub (ou use autenticação)

---

## Passo 2: Criar Arquivo `Procfile`

Railway precisa saber como iniciar sua aplicação.

1. Na pasta `android-cloud-runner-portable`, crie um arquivo chamado `Procfile` (sem extensão)
2. Adicione o conteúdo:
   ```
   web: python app.py
   ```
3. Salve o arquivo
4. Faça commit e push:
   ```bash
   git add Procfile
   git commit -m "Add Procfile"
   git push
   ```

---

## Passo 3: Criar Arquivo `runtime.txt`

Railway precisa saber qual versão de Python usar.

1. Na pasta `android-cloud-runner-portable`, crie um arquivo chamado `runtime.txt`
2. Adicione:
   ```
   python-3.11.0
   ```
3. Salve o arquivo
4. Faça commit e push:
   ```bash
   git add runtime.txt
   git commit -m "Add runtime.txt"
   git push
   ```

---

## Passo 4: Fazer Deploy no Railway

### 4.1 Fazer Login no Railway

1. Abra https://railway.app
2. Clique em **"Login"**
3. Clique em **"Login with GitHub"**
4. Autorize Railway a acessar sua conta GitHub

### 4.2 Criar Novo Projeto

1. Clique em **"New Project"**
2. Selecione **"Deploy from GitHub repo"**
3. Selecione seu repositório `android-cloud-runner`
4. Clique em **"Deploy"**

### 4.3 Aguardar Deploy

1. Railway vai compilar e fazer deploy da aplicação
2. Isso leva 3-5 minutos
3. Você verá o status mudando:
   - "Building..." → "Deploying..." → "Running"
4. Quando estiver "Running", seu app está online!

---

## Passo 5: Acessar Remotamente

### 5.1 Obter URL Pública

1. No painel do Railway, clique no seu projeto
2. Vá para a aba **"Settings"**
3. Procure por **"Domains"**
4. Você verá uma URL como: `android-cloud-runner-production.up.railway.app`

### 5.2 Acessar de Qualquer Lugar

1. Abra seu navegador
2. Digite a URL do Railway
3. Você verá a interface do Android Cloud Runner
4. Use normalmente!

---

## ⚠️ Limitações do Railway Gratuito

| Limite | Valor |
|--------|-------|
| Horas/mês | 500 horas |
| Armazenamento | 100 GB |
| Memória | Compartilhada |
| Uptime | ~99.5% |

**Cálculo de horas:**
- 500 horas ÷ 30 dias = ~16-17 horas por dia
- Ou 24/7 por ~20 dias/mês

---

## 🔄 Atualizar Aplicação

Se você fizer mudanças no código:

1. Faça as alterações localmente
2. Faça commit e push:
   ```bash
   git add .
   git commit -m "Descrição das mudanças"
   git push
   ```
3. Railway vai fazer deploy automaticamente
4. Aguarde 2-3 minutos

---

## 🆘 Troubleshooting

### "Deploy falhou"
- Verifique se `Procfile` e `runtime.txt` estão corretos
- Verifique se `requirements.txt` tem todas as dependências
- Veja os logs no painel do Railway

### "Aplicação não inicia"
- Verifique os logs: **Logs** no painel do Railway
- Procure por mensagens de erro
- Verifique se `app.py` está correto

### "URL não funciona"
- Aguarde 5 minutos após o deploy
- Tente atualizar a página (Ctrl+F5)
- Verifique se o status é "Running"

### "Emulador não funciona no Railway"
- ⚠️ **Importante:** O emulador Android **não funciona** no Railway
- Railway é apenas para acessar a interface remotamente
- O emulador deve rodar localmente no seu computador

---

## 💡 Dicas

- Railway oferece 500 horas/mês — suficiente para uso diário
- Se precisar de mais, considere upgrade (pago)
- Você pode ter múltiplos projetos no Railway
- Use GitHub para controlar versões do código

---

## 📊 Monitoramento

No painel do Railway, você pode ver:

- **Status** — Se está rodando
- **Logs** — Mensagens de erro/sucesso
- **Metrics** — CPU, memória, rede
- **Deployments** — Histórico de atualizações

---

## 🎯 Próximos Passos

1. **Fazer deploy** — Siga os passos acima
2. **Testar remotamente** — Acesse de outro dispositivo
3. **Compartilhar URL** — Dê a URL para outras pessoas usarem
4. **Monitorar** — Verifique logs e métricas

---

## ✅ Checklist

- [ ] Conta GitHub criada
- [ ] Repositório criado
- [ ] Arquivos enviados para GitHub
- [ ] `Procfile` criado
- [ ] `runtime.txt` criado
- [ ] Conta Railway criada
- [ ] Projeto criado no Railway
- [ ] Deploy concluído
- [ ] URL pública obtida
- [ ] Testado remotamente

---

**Pronto! Seu Android Cloud Runner está online! 🎉**

Agora você pode acessar de qualquer lugar, qualquer dispositivo, qualquer hora!

---

## 📞 Suporte

- **Railway Docs:** https://docs.railway.app
- **GitHub Help:** https://docs.github.com
- **Comunidade Railway:** https://railway.app/community
