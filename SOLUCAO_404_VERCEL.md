# Solução para Erro 404 no Vercel

## 🔍 Diagnóstico

O erro 404 geralmente ocorre porque:

1. **A pasta `build/web` não está no repositório GitHub**
   - Verifique se a pasta foi commitada: `git ls-files build/web/index.html`
   - Se não existir, a pasta foi ignorada pelo `.gitignore`

2. **O Vercel não encontra o `index.html`**
   - O `outputDirectory` pode estar incorreto
   - Os arquivos podem não estar na estrutura esperada

## ✅ Soluções

### Solução 1: Garantir que build/web está no repositório

```powershell
cd d:\Projetos\Fraktal\acqua_way_web

# 1. Fazer build
flutter build web --release

# 2. Verificar se build/web/index.html existe
Test-Path build\web\index.html

# 3. Forçar adição da pasta build (mesmo que esteja no .gitignore)
git add -f build/web/

# 4. Commit e push
git commit -m "Adiciona build/web para deploy no Vercel"
git push origin main
```

### Solução 2: Configurar Root Directory no Vercel Dashboard

1. Acesse [Vercel Dashboard](https://vercel.com/dashboard)
2. Vá no seu projeto
3. Settings > General
4. Em **Root Directory**, configure:
   - `build/web` (se a pasta estiver no repositório)
   - Ou deixe vazio se fizer deploy direto da pasta

### Solução 3: Deploy Manual via Vercel CLI

```powershell
# Instalar Vercel CLI (se não tiver)
npm install -g vercel

# Fazer login
vercel login

# Fazer build
cd d:\Projetos\Fraktal\acqua_way_web
flutter build web --release

# Deploy direto da pasta build/web
cd build\web
vercel --prod
```

### Solução 4: Usar GitHub Actions (Recomendado)

O arquivo `.github/workflows/deploy-vercel.yml` já está configurado.

Configure os secrets no GitHub:
- `VERCEL_TOKEN`
- `VERCEL_ORG_ID`
- `VERCEL_PROJECT_ID`

Isso fará build automático e deploy.

## 🔧 Configuração Atual do vercel.json

```json
{
  "version": 2,
  "outputDirectory": "build/web",
  "rewrites": [
    {
      "source": "/((?!assets/).*)",
      "destination": "/index.html"
    }
  ]
}
```

## 📝 Checklist

- [ ] Pasta `build/web` existe localmente
- [ ] Arquivo `build/web/index.html` existe
- [ ] Pasta `build/web` está no repositório GitHub
- [ ] `vercel.json` está configurado corretamente
- [ ] Root Directory no Vercel está configurado (se necessário)
- [ ] Variáveis de ambiente configuradas no Vercel

## 🚨 Se nada funcionar

Use o método de deploy manual:

1. Faça build local: `flutter build web --release`
2. Acesse Vercel Dashboard
3. Clique em "Deploy" > "Upload Files"
4. Arraste a pasta `build/web`
5. Faça deploy
