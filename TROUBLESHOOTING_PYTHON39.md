# Troubleshooting - Python 3.9 & Problemas Comuns

## ❌ Erro: "python: The term 'python' is not recognized"

### Solução 1: Usar o Script Especial
Se você tem Python 3.9 instalado mas o PATH não funciona, use:
```
START_PYTHON39.bat
```

Este script detecta automaticamente onde Python 3.9 foi instalado e executa a aplicação.

### Solução 2: Encontrar o Python Manualmente
1. Abra o Explorador de Arquivos
2. Procure por `python.exe` no seu computador
3. Anote o caminho completo (ex: `C:\Users\Junior\AppData\Local\Programs\Python\Python39\python.exe`)
4. Edite o arquivo `START_PYTHON39.bat` e substitua a linha:
   ```
   set PYTHON_PATH=C:\Seu\Caminho\Aqui
   ```

### Solução 3: Reinstalar Python (Jeito Correto)
1. Desinstale Python completamente
2. Abra https://www.python.org/downloads/
3. Baixe Python 3.9 (ou versão mais recente)
4. **Execute o instalador**
5. **MARQUE TODAS ESTAS CAIXAS:**
   - ✅ "Add Python 3.9 to PATH"
   - ✅ "Install pip"
   - ✅ "Install for all users" (se possível)
6. Clique em "Install Now"
7. **Reinicie o computador**
8. Use `START.bat` normalmente

---

## ❌ Erro: "pip: The term 'pip' is not recognized"

### Solução
Use o script especial que detecta pip automaticamente:
```
START_PYTHON39.bat
```

Se ainda não funcionar, tente:
```
python -m pip install flask flask-cors requests pillow
```

---

## ❌ Erro: "ModuleNotFoundError: No module named 'flask'"

### Solução
As dependências não foram instaladas. Execute:
```
START_PYTHON39.bat
```

Ele vai instalar automaticamente todas as dependências necessárias.

---

## ❌ Erro: "Address already in use"

### Solução
Outra aplicação está usando a porta 5000. Escolha uma:

**Opção 1: Usar outra porta**
Edite `app.py` e mude:
```python
app.run(host='0.0.0.0', port=5000)
```
Para:
```python
app.run(host='0.0.0.0', port=5001)
```

**Opção 2: Parar a aplicação anterior**
Abra PowerShell e execute:
```
netstat -ano | findstr :5000
```
Anote o PID (número) e execute:
```
taskkill /PID NUMERO /F
```

---

## ❌ Erro: "Connection refused" ao acessar localhost:5000

### Solução 1: Verificar se a aplicação está rodando
- Procure pela janela do PowerShell/CMD
- Deve ter mensagens como "Running on http://0.0.0.0:5000"

### Solução 2: Usar o IP correto
Em vez de `localhost:5000`, tente:
- `http://127.0.0.1:5000`
- `http://SEU_IP_LOCAL:5000`

Para encontrar seu IP local, abra PowerShell e execute:
```
ipconfig
```
Procure por "IPv4 Address" (algo como 192.168.x.x)

### Solução 3: Reiniciar a aplicação
1. Feche a janela do PowerShell/CMD
2. Execute `START_PYTHON39.bat` novamente

---

## ❌ Erro: "Android emulator not found"

### Solução
Você precisa criar um emulador Android no Android Studio:

1. Abra Android Studio
2. Vá para **Tools → Device Manager**
3. Clique em **"Create device"**
4. Selecione um modelo (ex: Pixel 5)
5. Clique em **"Next"**
6. Selecione uma versão do Android (ex: Android 13)
7. Clique em **"Finish"**

Depois, inicie o emulador antes de usar o Android Cloud Runner.

---

## ❌ Erro: "Failed to upload APK"

### Solução 1: Verificar tamanho do arquivo
- Máximo recomendado: 500MB
- Se seu APK for maior, pode não funcionar

### Solução 2: Verificar permissões
- Certifique-se de que tem permissão de escrita na pasta
- Tente usar outra pasta (ex: Desktop)

### Solução 3: Reiniciar a aplicação
- Feche e execute `START_PYTHON39.bat` novamente

---

## ❌ Erro: "Emulator is too slow"

### Solução
O emulador Android é lento por natureza. Para melhorar:

1. Feche outros programas
2. Aumente a RAM alocada para o emulador:
   - Android Studio → Device Manager → Seu emulador → Edit
   - Aumente "RAM" para 4GB ou mais

---

## ✅ Tudo funcionando?

Se conseguiu passar por todos os passos, parabéns! 🎉

Agora você pode:
1. Instalar seu APK
2. Rodar aplicações Android
3. Fazer deploy na nuvem (Railway) para acesso remoto

---

## 📞 Ainda com problemas?

1. Verifique se Python 3.9 está realmente instalado
2. Tente o script `START_PYTHON39.bat`
3. Verifique os logs na janela do PowerShell
4. Procure a mensagem de erro específica acima
5. Se nada funcionar, considere usar Railway (nuvem) - é mais simples!

---

## 🌐 Alternativa: Usar Railway (Nuvem)

Se os problemas locais forem muito complicados, use Railway:
- Sem instalar nada no seu PC
- Acesso remoto gratuito
- Muito mais simples!

Veja o arquivo `RAILWAY_DEPLOYMENT.md` para instruções.
