# Deploy no Vercel - Flutter Web

## ⚠️ IMPORTANTE: Flutter no Vercel

O Vercel **não tem suporte nativo para Flutter**. Você precisa fazer o build localmente e fazer deploy dos arquivos estáticos.

## 🚀 Método Recomendado: Build Local + Deploy

### Passo 1: Build Local

```powershell
cd d:\Projetos\Fraktal\acqua_way_web

# Limpar builds anteriores
flutter clean

# Instalar dependências
flutter pub get

# Build para web
flutter build web --release
```

### Passo 2: Deploy no Vercel

#### Opção A: Via CLI do Vercel (Recomendado)

1. **Instalar Vercel CLI:**
```powershell
npm install -g vercel
```

2. **Fazer login:**
```powershell
vercel login
```

3. **Deploy da pasta build/web:**
```powershell
cd d:\Projetos\Fraktal\acqua_way_web\build\web
vercel --prod
```

#### Opção B: Via Dashboard do Vercel

1. Acesse [Vercel Dashboard](https://vercel.com/dashboard)
2. Clique em "Add New Project"
3. Selecione "Import Git Repository"
4. Importe o repositório `FraktalSoftwares/acquaway-admin`
5. **IMPORTANTE:** Nas configurações do projeto:
   - **Framework Preset:** Other
   - **Root Directory:** `build/web` (ou deixe vazio se fizer build local)
   - **Build Command:** Deixe vazio (build é feito localmente)
   - **Output Directory:** Deixe vazio ou `build/web`
   - **Install Command:** Deixe vazio

6. **OU** faça upload manual da pasta `build/web`:
   - Clique em "Deploy"
   - Selecione "Upload Files"
   - Arraste a pasta `build/web`

## 🔄 Método Alternativo: GitHub Actions (Build Automático)

Crie o arquivo `.github/workflows/deploy-vercel.yml`:

```yaml
name: Deploy to Vercel

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.24.0'
        channel: 'stable'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Build web
      run: flutter build web --release
    
    - name: Deploy to Vercel
      uses: amondnet/vercel-action@v25
      with:
        vercel-token: ${{ secrets.VERCEL_TOKEN }}
        vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
        vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
        working-directory: ./build/web
```

## 📝 Configuração de Variáveis de Ambiente

No Vercel Dashboard:
1. Vá em Settings > Environment Variables
2. Adicione:
   - `SUPABASE_URL` = `https://ljpuzupbogxjdowibfoy.supabase.co`
   - `SUPABASE_ANON_KEY` = (sua chave anônima)
   - `ENVIRONMENT` = `production`
   - `DEBUG` = `false`

**Nota:** Para Flutter Web, as variáveis de ambiente precisam ser injetadas no build. Considere usar um arquivo de configuração ou variáveis de build-time.

## 🐛 Troubleshooting

### Erro 404: NOT_FOUND
- Certifique-se de que a pasta `build/web` existe e tem os arquivos
- Verifique se o `index.html` está na raiz de `build/web`
- Confirme que as rotas estão configuradas corretamente no `vercel.json`

### Build falha no Vercel
- O Vercel não tem Flutter instalado por padrão
- Use o método de build local + deploy
- Ou configure GitHub Actions para build automático

### Assets não carregam
- Verifique se os assets estão em `build/web/assets/`
- Confirme que os caminhos no código estão corretos
- Use caminhos relativos ao invés de absolutos

## ✅ Checklist de Deploy

- [ ] Build local executado com sucesso (`flutter build web --release`)
- [ ] Pasta `build/web` contém `index.html`
- [ ] Assets estão na pasta `build/web/assets/`
- [ ] Variáveis de ambiente configuradas no Vercel
- [ ] `vercel.json` configurado corretamente
- [ ] Testado localmente: `flutter run -d chrome --release`

## 🔗 Links Úteis

- [Vercel Documentation](https://vercel.com/docs)
- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [Vercel CLI](https://vercel.com/docs/cli)
