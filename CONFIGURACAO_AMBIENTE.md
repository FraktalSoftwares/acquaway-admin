# Configuração de Variáveis de Ambiente

## 📋 Onde as Variáveis Devem Estar

### ✅ GitHub Actions (Obrigatório)
O build é feito no GitHub Actions, então os **secrets** devem estar configurados aqui:

**Localização**: `https://github.com/FraktalSoftwares/acquaway-admin/settings/secrets/actions`

**Secrets necessários**:
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `VERCEL_TOKEN`
- `VERCEL_ORG_ID`
- `VERCEL_PROJECT_ID`

### ✅ Vercel (Opcional mas Recomendado)
As variáveis no Vercel são úteis se você fizer build direto no Vercel ou para runtime.

**Localização**: Vercel Dashboard > Project Settings > Environment Variables

**Variáveis configuradas**:
- `SUPABASE_URL` ✅
- `SUPABASE_ANON_KEY` ✅
- `ENVIRONMENT` ✅
- `DEBUG` ✅

## 🔄 Como Funciona o Fluxo Atual

```
GitHub Actions (Build)
    ↓
1. Cria .env usando secrets do GitHub
2. flutter build web --release
3. Gera build/web/
    ↓
Deploy para Vercel
    ↓
Vercel serve os arquivos estáticos
```

## ⚠️ Importante

- O arquivo `.env` **NÃO** deve estar no repositório Git
- O `.env` é criado **durante o build** no GitHub Actions
- As variáveis do Vercel são úteis para runtime, mas o build usa os secrets do GitHub

## ✅ Checklist

- [x] Secrets configurados no GitHub Actions
- [x] Variáveis configuradas no Vercel
- [x] `.env` removido do repositório Git
- [x] `.env` adicionado ao `.gitignore`
- [x] Workflow criando `.env` durante o build

## 🎯 Tudo Configurado!

Seu projeto está configurado corretamente:
- ✅ Seguro (sem `.env` no Git)
- ✅ Funcional (`.env` criado durante o build)
- ✅ Redundante (variáveis em ambos os lugares)
