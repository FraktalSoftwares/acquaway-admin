Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CORRIGINDO E ENVIANDO PARA GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

cd "d:\Projetos\Fraktal\acqua_way_web"

# Verificar branch atual
Write-Host "[1] Verificando branch atual..." -ForegroundColor Yellow
$currentBranch = git branch --show-current
Write-Host "   Branch atual: $currentBranch" -ForegroundColor Green

# Verificar se há commits
Write-Host "[2] Verificando commits..." -ForegroundColor Yellow
$commitCount = (git rev-list --count HEAD 2>$null)
if ($commitCount -eq 0) {
    Write-Host "   ERRO: Nenhum commit encontrado!" -ForegroundColor Red
    Write-Host "   Criando commit inicial..." -ForegroundColor Yellow
    git add -A
    git commit -m "Initial commit: AcquaWay Web - Configuracao completa para Vercel"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "   ERRO ao criar commit!" -ForegroundColor Red
        exit 1
    }
    Write-Host "   Commit criado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "   Commits encontrados: $commitCount" -ForegroundColor Green
}

# Renomear branch para main se necessário
if ($currentBranch -ne "main") {
    Write-Host "[3] Renomeando branch de '$currentBranch' para 'main'..." -ForegroundColor Yellow
    git branch -M main
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   Branch renomeada para 'main'" -ForegroundColor Green
    } else {
        Write-Host "   AVISO: Nao foi possivel renomear branch" -ForegroundColor Yellow
    }
} else {
    Write-Host "[3] Branch ja e 'main'" -ForegroundColor Green
}

# Adicionar arquivos pendentes
Write-Host "[4] Verificando arquivos pendentes..." -ForegroundColor Yellow
$status = git status --short
if ($status) {
    Write-Host "   Adicionando arquivos pendentes..." -ForegroundColor Yellow
    git add -A
    git commit -m "Adiciona scripts de deploy e documentacao"
    Write-Host "   Arquivos commitados" -ForegroundColor Green
} else {
    Write-Host "   Nenhum arquivo pendente" -ForegroundColor Green
}

# Fazer push
Write-Host "[5] Enviando para GitHub..." -ForegroundColor Yellow
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
    Write-Host "  ERRO ao enviar" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Mensagem de erro:" -ForegroundColor Yellow
    Write-Host $pushOutput -ForegroundColor Red
    Write-Host ""
    Write-Host "Se o erro for de autenticacao, configure suas credenciais Git" -ForegroundColor Yellow
    Write-Host ""
}
