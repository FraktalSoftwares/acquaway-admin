# Solução Final para Problemas no Vercel

## 🔍 Problema Identificado

O erro NOT_FOUND no Vercel estava ocorrendo por **dois motivos principais**:

### 1. **Conflito entre `routes` e `rewrites`** (Já corrigido)
- Mistura de configurações antigas e modernas
- Causava ambiguidade no roteamento

### 2. **Localização do `vercel.json`** (Novo problema)
- O GitHub Actions faz deploy de dentro de `build/web`
- O Vercel procura `vercel.json` no diretório de deploy
- Se o arquivo está apenas na raiz, não é encontrado

## ✅ Solução Implementada

### Arquivo 1: `vercel.json` (Raiz do projeto)
Para quando o deploy é feito da raiz com `outputDirectory: build/web`:

```json
{
  "version": 2,
  "outputDirectory": "build/web",
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "headers": [
    {
      "source": "/assets/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

### Arquivo 2: `build/web/vercel.json` (Pasta de build)
Para quando o deploy é feito diretamente de `build/web` (GitHub Actions):

```json
{
  "version": 2,
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "headers": [
    {
      "source": "/assets/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

## 🎯 Por Que Isso Funciona?

### Como o Vercel Processa Requisições

1. **Primeiro**: Verifica se existe um arquivo estático correspondente
   - Se existe → serve o arquivo
   - Se não existe → aplica rewrites

2. **Segundo**: Aplica headers configurados

3. **Terceiro**: Aplica rewrites (só se o arquivo não foi encontrado)

### Por Que `"source": "/(.*)"` Funciona?

O padrão `/(.*)` captura **tudo**, mas:
- Arquivos estáticos (JS, CSS, imagens) são servidos **antes** do rewrite
- Apenas rotas que não correspondem a arquivos são reescritas para `index.html`
- O Flutter então gerencia o roteamento client-side

## 📋 Checklist de Verificação

### Antes de Fazer Deploy

- [ ] `vercel.json` existe na raiz do projeto
- [ ] `build/web/vercel.json` existe (será criado automaticamente no build)
- [ ] `build/web/index.html` existe
- [ ] Build foi executado: `flutter build web --release`

### Verificar no Vercel Dashboard

1. **Settings > General**
   - Se usar GitHub Actions: **Root Directory** deve estar vazio ou `build/web`
   - Se usar deploy manual da raiz: **Root Directory** vazio, **Output Directory** = `build/web`

2. **Deployments**
   - Verificar logs do último deploy
   - Procurar por erros 404 ou NOT_FOUND

### Testar Após Deploy

```bash
# Testar rota raiz
curl https://seu-dominio.vercel.app/

# Testar rota client-side
curl https://seu-dominio.vercel.app/dashboard

# Testar arquivo estático
curl https://seu-dominio.vercel.app/main.dart.js

# Verificar headers de cache
curl -I https://seu-dominio.vercel.app/assets/logo.png
```

## 🔧 Configuração do GitHub Actions

O workflow atual está correto:

```yaml
- name: Deploy to Vercel
  uses: amondnet/vercel-action@v25
  with:
    working-directory: ./build/web  # Deploy de dentro de build/web
```

**Importante**: Com `working-directory: ./build/web`, o Vercel procura `vercel.json` dentro de `build/web`, não na raiz.

## 🚨 Problemas Comuns e Soluções

### Problema 1: "Cannot find vercel.json"
**Solução**: Garantir que `build/web/vercel.json` existe após o build

### Problema 2: "404 em rotas client-side"
**Solução**: Verificar se o rewrite está configurado corretamente

### Problema 3: "Assets não carregam"
**Solução**: Verificar se os caminhos estão corretos e se os assets estão em `build/web/assets/`

### Problema 4: "Cache não funciona"
**Solução**: Verificar se os headers estão configurados corretamente

## 📝 Script para Garantir vercel.json no Build

Adicione ao seu script de build:

```powershell
# Após flutter build web --release
Copy-Item "vercel.json" "build/web/vercel.json"
```

Ou crie um script que copia automaticamente:

```powershell
# copiar-vercel-config.ps1
$source = "vercel.json"
$dest = "build/web/vercel.json"

if (Test-Path $source) {
    Copy-Item $source $dest -Force
    Write-Host "vercel.json copiado para build/web/" -ForegroundColor Green
} else {
    Write-Host "AVISO: vercel.json não encontrado na raiz!" -ForegroundColor Yellow
}
```

## 🎓 Entendendo a Ordem de Processamento

```
Requisição → Vercel
    ↓
Existe arquivo estático?
    ├─ SIM → Serve arquivo (com headers se configurado)
    └─ NÃO → Aplica rewrites → /index.html
```

Por isso `"source": "/(.*)"` funciona:
- Arquivos reais são servidos primeiro
- Apenas rotas inexistentes vão para `index.html`
- Flutter gerencia o roteamento client-side

## ✅ Próximos Passos

1. **Fazer build local**:
   ```powershell
   flutter build web --release
   ```

2. **Copiar vercel.json para build/web** (se não foi copiado automaticamente):
   ```powershell
   Copy-Item vercel.json build/web/vercel.json
   ```

3. **Commit e push**:
   ```powershell
   git add vercel.json build/web/vercel.json
   git commit -m "Fix: Corrige configuração do Vercel"
   git push
   ```

4. **Verificar deploy no Vercel Dashboard**

5. **Testar a aplicação** em produção

---

**Resumo**: O problema era que o `vercel.json` não estava acessível quando o deploy era feito de `build/web`. Agora temos o arquivo em ambos os lugares, garantindo que funcione em qualquer cenário de deploy.
