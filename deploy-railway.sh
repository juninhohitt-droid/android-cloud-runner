#!/bin/bash

# Android Cloud Runner - Deploy Automatizado no Railway
# Este script automatiza todo o processo de deploy

set -e  # Para na primeira falha

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funções de output
print_header() {
    echo -e "\n${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

# PASSO 1: Verificar pré-requisitos
print_header "PASSO 1: Verificando Pré-requisitos"

if ! command -v git &> /dev/null; then
    print_error "Git não está instalado"
    exit 1
fi
print_success "Git instalado"

if ! command -v brew &> /dev/null; then
    print_warning "Homebrew não está instalado (necessário para instalar ngrok)"
fi

# PASSO 2: Inicializar Git
print_header "PASSO 2: Inicializando Git"

if [ -d ".git" ]; then
    print_warning "Repositório Git já existe"
else
    git init
    print_success "Repositório Git inicializado"
fi

# Configurar Git (se não estiver configurado)
if [ -z "$(git config --global user.name)" ]; then
    print_info "Configurando Git..."
    read -p "Digite seu nome: " git_name
    read -p "Digite seu email: " git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    print_success "Git configurado"
fi

# PASSO 3: Fazer commit
print_header "PASSO 3: Fazendo Commit"

if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Android Cloud Runner - Deploy no Railway"
    print_success "Commit realizado"
else
    print_warning "Nenhuma alteração para fazer commit"
fi

# PASSO 4: Criar repositório no GitHub
print_header "PASSO 4: Criar Repositório no GitHub"

print_info "Abra: https://github.com/new"
print_info "Preencha com:"
print_info "  - Repository name: android-cloud-runner"
print_info "  - Visibility: Public"
print_info "  - Deixe desmarcado 'Initialize this repository'"
print_info "  - Clique 'Create repository'"

read -p "Pressione Enter quando terminar..."

# PASSO 5: Fazer push para GitHub
print_header "PASSO 5: Fazendo Push para GitHub"

read -p "Digite sua URL do GitHub (ex: https://github.com/seu_usuario/android-cloud-runner.git): " github_url

if [ -z "$github_url" ]; then
    print_error "URL do GitHub não fornecida"
    exit 1
fi

git remote add origin "$github_url" 2>/dev/null || git remote set-url origin "$github_url"
git branch -M main
git push -u origin main

print_success "Push realizado para GitHub"

# PASSO 6: Verificar ngrok
print_header "PASSO 6: Verificando ngrok"

if ! command -v ngrok &> /dev/null; then
    print_warning "ngrok não está instalado"
    read -p "Deseja instalar ngrok agora? (s/n): " install_ngrok
    
    if [ "$install_ngrok" = "s" ] || [ "$install_ngrok" = "S" ]; then
        if command -v brew &> /dev/null; then
            brew install ngrok
            print_success "ngrok instalado"
        else
            print_error "Homebrew não está instalado. Instale manualmente: https://ngrok.com/download"
            exit 1
        fi
    fi
else
    print_success "ngrok já está instalado"
fi

# PASSO 7: Deploy no Railway
print_header "PASSO 7: Deploy no Railway"

print_info "Abra: https://railway.app"
print_info "Clique em 'Start Project'"
print_info "Escolha 'Deploy from GitHub'"
print_info "Conecte sua conta GitHub"
print_info "Selecione 'android-cloud-runner'"
print_info "Clique 'Deploy'"

read -p "Pressione Enter quando o deploy estiver completo..."

# PASSO 8: Obter URL do Railway
print_header "PASSO 8: Obter URL do Railway"

print_info "Abra: https://railway.app/dashboard"
print_info "Clique no seu projeto 'android-cloud-runner'"
print_info "Vá para 'Domains'"
print_info "Clique 'Generate Domain'"

read -p "Cole a URL do Railway (ex: https://seu-app.railway.app): " railway_url

if [ -z "$railway_url" ]; then
    print_error "URL do Railway não fornecida"
    exit 1
fi

# PASSO 9: Configurar variáveis de ambiente
print_header "PASSO 9: Configurar Variáveis de Ambiente"

print_info "Vá para 'Variables' no Dashboard do Railway"
print_info "Adicione estas variáveis:"
print_info "  - FLASK_ENV = production"
print_info "  - PORT = 5000"

read -p "Pressione Enter quando as variáveis estiverem configuradas..."

# PASSO 10: Iniciar ngrok
print_header "PASSO 10: Iniciar ngrok"

print_warning "Você precisa manter o ngrok rodando em outro terminal!"
print_info "Abra um novo Terminal e execute:"
print_info "  ngrok http 5000"
print_info "Você verá uma URL como: http://abc123.ngrok.io"

read -p "Cole a URL do ngrok (ex: http://abc123.ngrok.io): " ngrok_url

if [ -z "$ngrok_url" ]; then
    print_error "URL do ngrok não fornecida"
    exit 1
fi

# PASSO 11: Configurar variável de ngrok no Railway
print_header "PASSO 11: Configurar ngrok no Railway"

print_info "Volte ao Dashboard do Railway"
print_info "Vá para 'Variables'"
print_info "Adicione:"
print_info "  - EMULATOR_TUNNEL_URL = $ngrok_url"

read -p "Pressione Enter quando configurado..."

# PASSO 12: Testar
print_header "PASSO 12: Testar Acesso Remoto"

print_info "Certifique-se que o Android Emulator está rodando:"
print_info "  python3 app_vnc.py"

print_info "Acesse a URL do Railway:"
print_info "  $railway_url"

print_info "Clique em 'Iniciar Emulador'"
print_info "Aguarde 30-60 segundos"
print_info "Veja o Android aparecer!"

# PASSO 13: Resumo
print_header "✓ DEPLOY COMPLETO!"

echo -e "${GREEN}Seu Android Cloud Runner está rodando na nuvem!${NC}\n"

echo "📊 Resumo:"
echo "  - GitHub: $github_url"
echo "  - Railway: $railway_url"
echo "  - ngrok: $ngrok_url"
echo ""

echo "🎯 Próximos passos:"
echo "  1. Mantenha o Android Emulator rodando localmente"
echo "  2. Mantenha o ngrok rodando em outro terminal"
echo "  3. Acesse a URL do Railway de qualquer lugar"
echo "  4. Compartilhe a URL com outras pessoas"
echo ""

echo "💡 Dicas:"
echo "  - Reinicie ngrok se a conexão cair"
echo "  - Monitore o Dashboard do Railway"
echo "  - Verifique os logs no Railway se houver problemas"
echo ""

print_success "Deploy realizado com sucesso!"
