# Script para build e deploy no Vercel
param(
    [switch]$Deploy
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  BUILD E DEPLOY PARA VERCEL" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

cd "d:\Projetos\Fraktal\acqua_way_web"

# 1. Limpar build anterior
Write-Host "[1/4] Limpando build anterior..." -ForegroundColor Yellow
flutter clean
if ($LASTEXITCODE -ne 0) {
    Write-Host "   AVISO: Erro ao limpar (pode ignorar)" -ForegroundColor Yellow
}

# 2. Instalar dependências
Write-Host "[2/4] Instalando dependencias..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ERRO ao instalar dependencias!" -ForegroundColor Red
    exit 1
}
Write-Host "   Dependencias instaladas" -ForegroundColor Green

# 3. Build para web
Write-Host "[3/4] Fazendo build para web..." -ForegroundColor Yellow
flutter build web --release
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ERRO ao fazer build!" -ForegroundColor Red
    exit 1
}
Write-Host "   Build concluido com sucesso!" -ForegroundColor Green

# 4. Verificar se build/web existe
if (-not (Test-Path "build\web\index.html")) {
    Write-Host "   ERRO: Arquivo index.html nao encontrado em build/web!" -ForegroundColor Red
    exit 1
}

# 4.5. Copiar vercel.json para build/web (necessário para GitHub Actions)
Write-Host "[4.5/5] Copiando vercel.json para build/web..." -ForegroundColor Yellow
if (Test-Path "vercel.json") {
    Copy-Item "vercel.json" "build\web\vercel.json" -Force
    Write-Host "   vercel.json copiado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "   AVISO: vercel.json nao encontrado na raiz!" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  BUILD CONCLUIDO!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Arquivos gerados em: build\web" -ForegroundColor Cyan
Write-Host ""

# 5. Deploy (se solicitado)
if ($Deploy) {
    Write-Host "[4/4] Fazendo deploy para Vercel..." -ForegroundColor Yellow
    Write-Host ""
    
    # Verificar se Vercel CLI está instalado
    $vercelInstalled = Get-Command vercel -ErrorAction SilentlyContinue
    if (-not $vercelInstalled) {
        Write-Host "   Vercel CLI nao encontrado!" -ForegroundColor Red
        Write-Host ""
        Write-Host "   Instale com:" -ForegroundColor Yellow
        Write-Host "   npm install -g vercel" -ForegroundColor White
        Write-Host ""
        Write-Host "   Ou faça deploy manualmente:" -ForegroundColor Yellow
        Write-Host "   1. Acesse https://vercel.com/dashboard" -ForegroundColor White
        Write-Host "   2. Clique em 'Add New Project'" -ForegroundColor White
        Write-Host "   3. Selecione 'Upload Files'" -ForegroundColor White
        Write-Host "   4. Arraste a pasta build\web" -ForegroundColor White
        Write-Host ""
        exit 1
    }
    
    cd "build\web"
    vercel --prod
    cd ..\..
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "  DEPLOY CONCLUIDO!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Red
        Write-Host "  ERRO NO DEPLOY" -ForegroundColor Red
        Write-Host "========================================" -ForegroundColor Red
    }
} else {
    Write-Host "[4/4] Deploy nao solicitado" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Para fazer deploy, execute:" -ForegroundColor Yellow
    Write-Host "  .\BUILD_E_DEPLOY.ps1 -Deploy" -ForegroundColor White
    Write-Host ""
    Write-Host "Ou manualmente:" -ForegroundColor Yellow
    Write-Host "  cd build\web" -ForegroundColor White
    Write-Host "  vercel --prod" -ForegroundColor White
    Write-Host ""
}
