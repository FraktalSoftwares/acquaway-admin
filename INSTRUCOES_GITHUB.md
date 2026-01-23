# Instruções para Enviar ao GitHub

## ✅ O que já foi configurado:

1. ✅ Repositório Git inicializado
2. ✅ Remote configurado: `https://github.com/FraktalSoftwares/acquaway-admin.git`
3. ✅ Branch principal: `main`
4. ✅ Arquivo `vercel.json` criado
5. ✅ Arquivo `.vercelignore` criado
6. ✅ Commit inicial preparado

## 🚀 Para enviar ao GitHub:

### Opção 1: Usando o script PowerShell
```powershell
cd d:\Projetos\Fraktal\acqua_way_web
.\PUSH_GITHUB.ps1
```

### Opção 2: Comandos manuais
```powershell
cd d:\Projetos\Fraktal\acqua_way_web

# Verificar status
git status

# Adicionar arquivos (se necessário)
git add .

# Fazer commit (se necessário)
git commit -m "Initial commit: AcquaWay Web - Configuração completa para Vercel"

# Enviar para GitHub
git push -u origin main
```

## 🔐 Se pedir autenticação:

### Método 1: Personal Access Token (Recomendado)
1. Acesse: https://github.com/settings/tokens
2. Clique em "Generate new token" > "Generate new token (classic)"
3. Dê um nome (ex: "AcquaWay Web")
4. Selecione o escopo: `repo` (acesso completo aos repositórios)
5. Clique em "Generate token"
6. **COPIE O TOKEN** (você não verá novamente!)
7. Quando o Git pedir senha, use o token ao invés da senha

### Método 2: GitHub CLI
```powershell
# Instalar GitHub CLI (se não tiver)
winget install GitHub.cli

# Fazer login
gh auth login

# Depois fazer push normalmente
git push -u origin main
```

### Método 3: Credential Manager
```powershell
# Configurar credenciais
git config --global credential.helper manager-core

# Depois fazer push (vai abrir janela de login)
git push -u origin main
```

## ✅ Verificar se funcionou:

Acesse: https://github.com/FraktalSoftwares/acquaway-admin

Se você ver os arquivos do projeto, o push foi bem-sucedido! 🎉

## 📝 Notas:

- O repositório no GitHub está vazio, então o primeiro push pode demorar um pouco
- Se o repositório for privado, certifique-se de ter permissões
- O arquivo `.env` não será enviado (está no .gitignore)
