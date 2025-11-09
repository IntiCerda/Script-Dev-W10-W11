# ----------------------------------------
# ----- Setup Dev  -----
# This script installs and configures a basic development environment
# on Windows 10/11 using winget and other built-in tools.
# It performs the following actions:
# - Ensure PowerShell execution policy (RemoteSigned for current process)
# - Ensure winget (App Installer) is installed, then update it and upgrade packages
# - Install core tools: Git, Visual Studio Code
# - Install runtimes and languages: Go, Node.js (LTS), Python 3.12, Temurin (Eclipse Adoptium) JDK
# - Install development utilities: Postman, MongoDB Server (or Compass in extended script)
# - Configure environment variables: add %USERPROFILE%\go\bin to the user PATH
# - Enable WSL2 features (Windows Subsystem for Linux and Virtual Machine Platform)
# - Install Ubuntu distribution under WSL
# - Download and install Docker Desktop and attempt to switch it to the WSL2 backend
# - Attempt to configure Docker CLI to use the Linux engine (may require restart)
# - Clean up temporary installation files and prompt for system restart
#
# Additional items installed by the extended setup (separate/related script):
# - VSCode extensions: Go, ESLint, Prettier, Python, Docker, MongoDB, themes, indent and bracket helpers
# - MongoDB Compass (GUI) and other optional GUI tools
#
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
