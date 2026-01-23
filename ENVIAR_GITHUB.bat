@echo off
echo ========================================
echo Enviando para GitHub
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] Adicionando arquivos...
git add -A
if %errorlevel% neq 0 (
    echo ERRO ao adicionar arquivos!
    pause
    exit /b 1
)

echo [2/3] Fazendo commit...
git commit -m "Initial commit: AcquaWay Web - Configuracao completa para Vercel"
if %errorlevel% neq 0 (
    echo ERRO ao fazer commit!
    pause
    exit /b 1
)

echo [3/3] Enviando para GitHub...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo ERRO: Falha ao enviar para GitHub
    echo ========================================
    echo.
    echo Possiveis causas:
    echo - Precisa autenticar no GitHub
    echo - Repositorio nao existe ou sem permissao
    echo.
    echo Solucao:
    echo 1. Configure suas credenciais Git:
    echo    git config --global user.name "Seu Nome"
    echo    git config --global user.email "seu@email.com"
    echo.
    echo 2. Use um Personal Access Token do GitHub
    echo    quando pedir senha, use o token ao inves da senha
    echo.
    pause
    exit /b 1
) else (
    echo.
    echo ========================================
    echo SUCESSO! Codigo enviado para GitHub
    echo ========================================
    echo.
    echo Repositorio: https://github.com/FraktalSoftwares/acquaway-admin
    echo.
)

pause
