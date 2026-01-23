# Configuração de Variáveis de Ambiente no GitHub Actions

## 📋 Variáveis Necessárias

O workflow do GitHub Actions precisa das seguintes variáveis de ambiente para fazer o build:

### Secrets do GitHub (Configurar no repositório)

1. **`SUPABASE_URL`** - URL do projeto Supabase
   - Exemplo: `https://ljpuzupbogxjdowibfoy.supabase.co`

2. **`SUPABASE_ANON_KEY`** - Chave anônima do Supabase
   - Esta chave pode ser exposta no frontend
   - Exemplo: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`

### Secrets do Vercel (Já configurados)

3. **`VERCEL_TOKEN`** - Token de autenticação do Vercel
4. **`VERCEL_ORG_ID`** - ID da organização no Vercel
5. **`VERCEL_PROJECT_ID`** - ID do projeto no Vercel

## 🔧 Como Configurar os Secrets no GitHub

### Passo 1: Acessar Configurações do Repositório

1. Acesse o repositório no GitHub: `https://github.com/FraktalSoftwares/acquaway-admin`
2. Clique em **Settings** (Configurações)
3. No menu lateral, clique em **Secrets and variables** > **Actions**

### Passo 2: Adicionar Secrets

Para cada variável, clique em **New repository secret** e adicione:

#### `SUPABASE_URL`
- **Name**: `SUPABASE_URL`
- **Secret**: `https://ljpuzupbogxjdowibfoy.supabase.co`
- Clique em **Add secret**

#### `SUPABASE_ANON_KEY`
- **Name**: `SUPABASE_ANON_KEY`
- **Secret**: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxqcHV6dXBib2d4amRvd2liZm95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU2MjQ2MjMsImV4cCI6MjA3MTIwMDYyM30.B8JEOIsEjYWltjMzG-w7jdy8W-4dS-JwxlkVGYnSItI`
- Clique em **Add secret**

## 📝 Como o Workflow Usa as Variáveis

O workflow cria automaticamente o arquivo `.env` antes do build:

```yaml
- name: Create .env file
  run: |
    echo "SUPABASE_URL=${{ secrets.SUPABASE_URL }}" >> .env
    echo "SUPABASE_ANON_KEY=${{ secrets.SUPABASE_ANON_KEY }}" >> .env
    echo "ENVIRONMENT=production" >> .env
    echo "DEBUG=false" >> .env
```

Isso garante que:
- O arquivo `.env` seja criado durante o build
- As variáveis estejam disponíveis quando o Flutter carregar o `dotenv`
- O ambiente seja configurado como `production` para builds de deploy

## ✅ Verificação

Após configurar os secrets, você pode verificar:

1. **No GitHub**: Vá em Settings > Secrets and variables > Actions
   - Você deve ver `SUPABASE_URL` e `SUPABASE_ANON_KEY` listados

2. **No Workflow**: O próximo build deve:
   - Criar o arquivo `.env` automaticamente
   - Fazer o build com sucesso
   - Fazer deploy no Vercel

## 🔒 Segurança

### ⚠️ Importante

- **NUNCA** commite o arquivo `.env` no Git
- **NUNCA** exponha `SUPABASE_SERVICE_KEY` (chave de serviço)
- Use apenas `SUPABASE_ANON_KEY` (chave anônima) no frontend
- Os secrets do GitHub são criptografados e não podem ser visualizados após serem salvos

### O que está seguro

- ✅ `SUPABASE_ANON_KEY` - Pode ser exposta no frontend
- ✅ Secrets do GitHub - Criptografados e seguros
- ✅ Variáveis no workflow - Não aparecem nos logs

## 🐛 Troubleshooting

### Erro: "SUPABASE_URL não encontrada no arquivo .env"

**Causa**: O secret `SUPABASE_URL` não foi configurado ou está com nome incorreto.

**Solução**:
1. Verifique se o secret existe em Settings > Secrets and variables > Actions
2. Confirme que o nome está exatamente como `SUPABASE_URL` (case-sensitive)
3. Re-execute o workflow

### Erro: "SUPABASE_ANON_KEY não encontrada no arquivo .env"

**Causa**: O secret `SUPABASE_ANON_KEY` não foi configurado ou está com nome incorreto.

**Solução**:
1. Verifique se o secret existe em Settings > Secrets and variables > Actions
2. Confirme que o nome está exatamente como `SUPABASE_ANON_KEY` (case-sensitive)
3. Re-execute o workflow

### Build funciona localmente mas falha no GitHub Actions

**Causa**: O arquivo `.env` local não está sendo usado no GitHub Actions.

**Solução**: 
- Os secrets devem estar configurados no GitHub
- O workflow cria o `.env` automaticamente durante o build
- Não é necessário commitar o `.env` (está no `.gitignore`)

## 📚 Referências

- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Flutter Dotenv Package](https://pub.dev/packages/flutter_dotenv)
- [Supabase Documentation](https://supabase.com/docs)
