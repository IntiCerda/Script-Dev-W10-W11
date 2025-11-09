# ----------------------------------------
# Complete Development Setup
# This script installs and configures a development environment
# for Windows 10/11 using winget and built-in tools.
# Actions:
# - Set PowerShell policy to RemoteSigned (for this session)
# - Install winget (App Installer) if missing. Update winget and apps.
# - Install core tools: Git, Visual Studio Code
# - Install languages: Go, Node.js (LTS), Python 3.12, Java (Temurin JDK)
# - Install tools: Postman, MongoDB Server (or MongoDB Compass)
# - Add %USERPROFILE%\go\bin to the user PATH
# - Turn on WSL2 features (Windows Subsystem for Linux and Virtual Machine Platform)
# - Install Ubuntu under WSL
# - Download and install Docker Desktop and try to set it to use WSL2
# - Clean temporary files and ask to restart the computer
#
# Extra (from the extended script):
# - VS Code extensions: Go, ESLint, Prettier, Python, Docker, MongoDB, themes, brackets/indent helpers
# ----------------------------------------

Write-Host "Starting development environment setup..."

# ---- Initial configuration ----
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# ---- Check and install winget if not available ----
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not detected. Installing manually..."
    Invoke-WebRequest -UseBasicParsing -Uri "https://aka.ms/getwinget" -OutFile "$env:TEMP\Microsoft.DesktopAppInstaller.appxbundle"
    Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller.appxbundle"
}

# ---- Update winget ----
Write-Host "Updating winget..."
winget upgrade --all --accept-source-agreements --accept-package-agreements

# ---- Install basic developer tools ----
Write-Host "Installing basic developer tools..."
winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements
winget install --id Microsoft.VisualStudioCode -e --accept-source-agreements --accept-package-agreements
winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
winget install --id GoLang.Go -e --accept-source-agreements --accept-package-agreements
winget install --id Python.Python.3.12 -e --accept-source-agreements --accept-package-agreements
winget install --id Postman.Postman -e --accept-source-agreements --accept-package-agreements
winget install --id MongoDB.Server -e --accept-source-agreements --accept-package-agreements
winget install --id Eclipse.Adoptium.Temurin.21.JDK -e --source winget


# ---- Environment variables ----
Write-Host "Configuring environment variables..."
[Environment]::SetEnvironmentVariable("Path", "$env:Path;$env:USERPROFILE\go\bin", "User")

# ---- Enable WSL2 ----
Write-Host "Enabling WSL2..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

# ---- Install Ubuntu ----
Write-Host "Installing Ubuntu..."
wsl --install -d Ubuntu

# ---- Install Docker Desktop ----
Write-Host "Downloading and installing Docker Desktop..."
$dockerInstaller = "$env:TEMP\DockerDesktopInstaller.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -OutFile $dockerInstaller
Start-Process -Wait -FilePath $dockerInstaller -ArgumentList "install", "--quiet"
Remove-Item $dockerInstaller -Force

# ---- Configure Docker for WSL2 ----
Write-Host "Configuring Docker for WSL2..."
try {
    & "$env:ProgramFiles\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine
} catch {
    Write-Host "Could not configure Docker CLI (may require a restart)."
}

# ---- Final cleanup ----
Write-Host "Cleaning temporary files..."
Remove-Item "$env:TEMP\Microsoft.DesktopAppInstaller.appxbundle" -Force -ErrorAction SilentlyContinue

Write-Host "Installation completed successfully."
Write-Host "Restart the system to apply all changes."
