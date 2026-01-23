Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ENVIANDO PARA GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

cd "d:\Projetos\Fraktal\acqua_way_web"

# Verificar status
Write-Host "[1/4] Verificando status..." -ForegroundColor Yellow
$status = git status --short
if ($status) {
    Write-Host "   Arquivos modificados:" -ForegroundColor Green
    Write-Host $status -ForegroundColor Gray
} else {
    Write-Host "   Nenhuma mudanca pendente" -ForegroundColor Gray
}

# Adicionar arquivos
Write-Host "[2/4] Adicionando arquivos..." -ForegroundColor Yellow
git add -A
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ERRO ao adicionar arquivos!" -ForegroundColor Red
    exit 1
}
Write-Host "   Arquivos adicionados" -ForegroundColor Green

# Fazer commit
Write-Host "[3/4] Fazendo commit..." -ForegroundColor Yellow
$commitMsg = "Configuracao completa para Vercel: scripts de deploy, documentacao e correcoes"
git commit -m $commitMsg
if ($LASTEXITCODE -ne 0) {
    Write-Host "   AVISO: Nenhum commit necessario (sem mudancas)" -ForegroundColor Yellow
} else {
    $commitHash = git log --oneline -1
    Write-Host "   Commit realizado: $commitHash" -ForegroundColor Green
}

# Push para GitHub
Write-Host "[4/4] Enviando para GitHub..." -ForegroundColor Yellow
Write-Host ""

# Verificar branch
$branch = git branch --show-current
if ($branch -ne "main" -and $branch -ne "master") {
    Write-Host "   Renomeando branch para main..." -ForegroundColor Yellow
    git branch -M main
    $branch = "main"
}

$pushOutput = git push -u origin $branch 2>&1
$pushSuccess = $LASTEXITCODE -eq 0

Write-Host $pushOutput

if ($pushSuccess) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  SUCESSO! Codigo enviado!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repositorio: https://github.com/FraktalSoftwares/acquaway-admin" -ForegroundColor Cyan
    Write-Host "Branch: $branch" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ERRO ao enviar" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Mensagem:" -ForegroundColor Yellow
    Write-Host $pushOutput -ForegroundColor Red
    Write-Host ""
    Write-Host "Se o erro for de autenticacao:" -ForegroundColor Yellow
    Write-Host "1. Configure suas credenciais Git" -ForegroundColor White
    Write-Host "2. Ou use um Personal Access Token do GitHub" -ForegroundColor White
    Write-Host ""
}
