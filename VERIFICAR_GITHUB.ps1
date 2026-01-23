Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  VERIFICACAO DE CONEXAO COM GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

cd "d:\Projetos\Fraktal\acqua_way_web"

# 1. Verificar se é repositório Git
Write-Host "[1] Verificando repositorio Git..." -ForegroundColor Yellow
if (Test-Path .git) {
    Write-Host "   OK: Repositorio Git encontrado" -ForegroundColor Green
} else {
    Write-Host "   ERRO: Nao e um repositorio Git!" -ForegroundColor Red
    exit 1
}

# 2. Verificar remote
Write-Host "[2] Verificando remote configurado..." -ForegroundColor Yellow
$remoteUrl = git config --get remote.origin.url
if ($remoteUrl) {
    Write-Host "   Remote URL: $remoteUrl" -ForegroundColor Green
} else {
    Write-Host "   ERRO: Remote nao configurado!" -ForegroundColor Red
    exit 1
}

# 3. Verificar branch atual
Write-Host "[3] Verificando branch atual..." -ForegroundColor Yellow
$branch = git branch --show-current
Write-Host "   Branch: $branch" -ForegroundColor Green

# 4. Verificar commits locais
Write-Host "[4] Verificando commits locais..." -ForegroundColor Yellow
$commitCount = (git rev-list --count HEAD 2>$null)
if ($commitCount -gt 0) {
    Write-Host "   Commits locais: $commitCount" -ForegroundColor Green
    $lastCommit = git log --oneline -1
    Write-Host "   Ultimo commit: $lastCommit" -ForegroundColor Gray
} else {
    Write-Host "   AVISO: Nenhum commit local encontrado" -ForegroundColor Yellow
}

# 5. Testar conexão com GitHub
Write-Host "[5] Testando conexao com GitHub..." -ForegroundColor Yellow
try {
    $testConnection = git ls-remote --heads origin 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   OK: Conexao com GitHub estabelecida!" -ForegroundColor Green
        if ($testConnection) {
            Write-Host "   Branches remotos encontrados:" -ForegroundColor Gray
            $testConnection | ForEach-Object { Write-Host "     $_" -ForegroundColor Gray }
        } else {
            Write-Host "   AVISO: Repositorio remoto esta vazio" -ForegroundColor Yellow
        }
    } else {
        Write-Host "   ERRO: Nao foi possivel conectar ao GitHub" -ForegroundColor Red
        Write-Host "   Mensagem: $testConnection" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "   Possiveis causas:" -ForegroundColor Yellow
        Write-Host "   - Precisa autenticar no GitHub" -ForegroundColor Yellow
        Write-Host "   - Repositorio nao existe ou sem permissao" -ForegroundColor Yellow
        Write-Host "   - Problema de rede" -ForegroundColor Yellow
    }
} catch {
    Write-Host "   ERRO: $($_.Exception.Message)" -ForegroundColor Red
}

# 6. Verificar status
Write-Host "[6] Verificando status do repositorio..." -ForegroundColor Yellow
$status = git status --short
if ($status) {
    Write-Host "   Arquivos modificados/novos:" -ForegroundColor Yellow
    $status | ForEach-Object { Write-Host "     $_" -ForegroundColor Gray }
} else {
    Write-Host "   OK: Nenhuma mudanca pendente" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  RESUMO" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Repositorio: $remoteUrl" -ForegroundColor White
Write-Host "Branch: $branch" -ForegroundColor White
Write-Host "Commits locais: $commitCount" -ForegroundColor White
Write-Host ""
