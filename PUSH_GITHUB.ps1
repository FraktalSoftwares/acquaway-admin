# Script para enviar código para GitHub
$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Enviando para GitHub" -ForegroundColor Cyan
Write-Host "  Repositorio: acquaway-admin" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

cd "d:\Projetos\Fraktal\acqua_way_web"

# Verificar se é um repositório git
if (-not (Test-Path .git)) {
    Write-Host "ERRO: Nao e um repositorio Git!" -ForegroundColor Red
    exit 1
}

# Verificar remote
Write-Host "[1/4] Verificando remote..." -ForegroundColor Yellow
$remote = git remote get-url origin 2>&1
Write-Host "Remote: $remote" -ForegroundColor Gray

# Adicionar todos os arquivos
Write-Host "[2/4] Adicionando arquivos..." -ForegroundColor Yellow
git add -A
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERRO ao adicionar arquivos!" -ForegroundColor Red
    exit 1
}
$status = git status --short
if ($status) {
    Write-Host "Arquivos adicionados:" -ForegroundColor Green
    Write-Host $status -ForegroundColor Gray
} else {
    Write-Host "Nenhum arquivo novo para adicionar" -ForegroundColor Gray
}

# Fazer commit
Write-Host "[3/4] Fazendo commit..." -ForegroundColor Yellow
$commitMsg = "Initial commit: AcquaWay Web - Configuracao completa para Vercel"
git commit -m $commitMsg
if ($LASTEXITCODE -ne 0) {
    Write-Host "AVISO: Nenhum commit necessario (sem mudancas)" -ForegroundColor Yellow
} else {
    $commitHash = git log --oneline -1
    Write-Host "Commit realizado: $commitHash" -ForegroundColor Green
}

# Push para GitHub
Write-Host "[4/4] Enviando para GitHub..." -ForegroundColor Yellow
Write-Host ""

$pushOutput = git push -u origin main 2>&1
$pushSuccess = $LASTEXITCODE -eq 0

Write-Host $pushOutput

if ($pushSuccess) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  SUCESSO! Codigo enviado!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repositorio: https://github.com/FraktalSoftwares/acquaway-admin" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ERRO ao enviar para GitHub" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possiveis causas:" -ForegroundColor Yellow
    Write-Host "1. Precisa autenticar no GitHub" -ForegroundColor Yellow
    Write-Host "2. Repositorio nao existe ou sem permissao" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Solucao:" -ForegroundColor Yellow
    Write-Host "Configure suas credenciais Git ou use um Personal Access Token" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}
