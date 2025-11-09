# ===============================
# Setup Docker + WSL2 - PowerShell Script
# This script sets up WSL2 and installs Docker Desktop on Windows 10/11.
# It performs the following actions:
# - Enable WSL2 features (Windows Subsystem for Linux and Virtual Machine Platform)
# - Set WSL2 as the default version
# - Install Ubuntu distribution under WSL
# - Download and install Docker Desktop
# ===============================

Write-Host "Starting installation of WSL2 and Docker Desktop..." -ForegroundColor Cyan

# ---- Prerequisites ----
Write-Host "Enabling required Windows features..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# ---- Set WSL2 as default ----
wsl --set-default-version 2

# ---- Install Ubuntu (latest available) ----
Write-Host "Installing Ubuntu from Microsoft Store..."
wsl --install -d Ubuntu

# ---- Download and install Docker Desktop ----
Write-Host "Downloading Docker Desktop..."
$dockerInstaller = "$env:TEMP\DockerDesktopInstaller.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -OutFile $dockerInstaller

Write-Host "Installing Docker Desktop..."
Start-Process -Wait -FilePath $dockerInstaller -ArgumentList "install", "--quiet"

# ---- Docker configuration ----
Write-Host "Configuring Docker for WSL2..."
& "$env:ProgramFiles\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine

# ---- Cleanup ----
Remove-Item $dockerInstaller -Force

Write-Host "Installation completed."
Write-Host "Restart your system to apply all changes." -ForegroundColor Green
