# ----------------------------------------
# Basic Development Setup
# This script installs a basic development environment
# for Windows 10/11 using winget.
# Actions:
# - Install core tools: Git, Visual Studio Code
# - Install languages: Go, Node.js (LTS), Python 3.12, Java (Temurin JDK)
# - Install tools: Postman, MongoDB Compass
# - Install VS Code extensions: Go, ESLint, Prettier, Python, Docker, MongoDB, themes, bracket helpers
# - Add %USERPROFILE%\go\bin to the user PATH
# - Show completion message when finished
# ----------------------------------------

Write-Host "Starting..." -ForegroundColor Cyan

# ---- Tools ----
Write-Host "Installing basic tools..." -ForegroundColor Yellow
winget install --id Git.Git -e --source winget
winget install --id Microsoft.VisualStudioCode -e --source winget

# ---- language ----
Write-Host "Installing Go, Node.js, Python, and Java..." -ForegroundColor Yellow
winget install --id GoLang.Go -e --source winget
winget install --id OpenJS.NodeJS.LTS -e --source winget
winget install --id Python.Python.3.12 -e --source winget
winget install --id Eclipse.Adoptium.Temurin.21.JDK -e --source winget

# ---- Development tools ----
Write-Host "Installing Postman and MongoDB Compass..." -ForegroundColor Yellow
winget install --id Postman.Postman -e --source winget
winget install --id MongoDB.Compass.Full -e --source winget

# ---- VSCode extensions ----
Write-Host "VSCode extensions" -ForegroundColor Yellow
code --install-extension ms-vscode.Go
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension mongodb.mongodb-vscode
code --install-extension SirTori.indenticator
code --install-extension PKief.material-icon-theme
code --install-extension whizkydee.material-palenight-theme
code --install-extension rafamel.subtle-brackets

# ---- Environment variables ----
Write-Host "Configuring environment variables..." -ForegroundColor Yellow
[Environment]::SetEnvironmentVariable("Path", "$env:Path;$env:USERPROFILE\go\bin", "User")

Write-Host "✅ Installation completed." -ForegroundColor Green
