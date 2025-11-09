# Complete Development Setup — Windows 10/11 Developer Environment

## Description

The **Complete Development Setup** PowerShell script automates the installation and configuration of a **full developer environment** on Windows 10 or 11.
It leverages **Winget**, built-in Windows features, and several powerful developer tools to create a ready-to-code workstation.

This script not only installs common developer tools and languages, but also enables **WSL2**, installs **Ubuntu**, and configures **Docker Desktop** for a modern, container-based workflow.

It’s designed for developers who want a **complete environment** — covering local development, containerization, and Linux subsystem integration.

---

## What the Script Does

### Initial Configuration

- Sets **PowerShell execution policy** to `RemoteSigned` for the current session.
- Ensures **Winget** (Windows Package Manager) is installed and updated.
- Updates all existing applications installed via Winget.

### Core Development Tools

Installs essential development tools for source control and editing:

- **Git** — version control system for managing repositories.
- **Visual Studio Code** — extensible, cross-platform code editor.

### Programming Languages

Installs the most common developer languages and runtimes:

- **Go (GoLang)** — for backend and concurrent systems.
- **Node.js (LTS)** — JavaScript runtime for APIs and web development.
- **Python 3.12** — for scripting, data analysis, and automation.
- **Java (Temurin 21 JDK)** — stable Java runtime and compiler.

### Development Tools

Additional software to work with APIs and databases:

- **Postman** — test and design REST APIs.
- **MongoDB Server** — local NoSQL database server for development.

### Environment Configuration

- Adds the Go binary directory (`%USERPROFILE%\go\bin`) to the user’s **PATH** variable.

### WSL2 Setup (Windows Subsystem for Linux)

- Enables the **Windows Subsystem for Linux (WSL)** feature.
- Enables **Virtual Machine Platform** required by WSL2 and Docker.
- Sets **WSL2** as the default version.
- Installs **Ubuntu** from the Microsoft Store via command line.

### Docker Desktop Installation

- Downloads and installs **Docker Desktop** for Windows automatically.
- Attempts to configure Docker to use **WSL2** as its backend engine.
- Removes the installer after successful setup to keep the system clean.

### Cleanup & Completion

- Deletes temporary installation files (e.g., AppInstaller packages).
- Prompts the user to **restart the system** to apply all changes.

---

## ⚠️ Important Notes

> **Before running this script**, ensure the following BIOS and Windows settings are enabled:
>
> - **Virtualization Technology (VT-x / AMD-V)** — must be enabled in your BIOS/UEFI.
> - **Hyper-V and Virtual Machine Platform** — Windows features required for Docker and WSL2.
> - **Windows Subsystem for Linux** — will be automatically enabled by the script if missing.
>
> 💡 _Without these settings, Docker Desktop and WSL2 will fail to install or run properly._

---

## ⚡️ How to Run the Script

You can execute the **Complete Development Setup** script directly from PowerShell using one single command — no need to manually download the file.

### ▶️ One-line Execution (recommended)

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/IntiCerda/Script-Dev-W10-W11/main/Complete%20Development%20Setup/setup-dev-complete.ps1'))
```

This command:

- Downloads the latest version of the setup script from your public GitHub repository.
- Executes it automatically in your PowerShell session.

### 📂 Manual Download and Execution

If you prefer to download and run the script manually:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IntiCerda/Script-Dev-W10-W11/main/Complete%20Development%20Setup/setup-dev-complete.ps1" -OutFile "$env:USERPROFILE\Downloads\setup-dev-complete.ps1"
cd "$env:USERPROFILE\Downloads"
powershell -ExecutionPolicy Bypass -File .\setup-dev-complete.ps1
```

> 💡 **Note:**
> You might need to enable PowerShell script execution before running the setup:
>
> ```powershell
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```

---

## Summary of Installed Components

| Category           | Name               | Installer / Source                               | Description                   |
| ------------------ | ------------------ | ------------------------------------------------ | ----------------------------- |
| **Tool**           | Git                | `winget install Git.Git`                         | Source code version control   |
| **Tool**           | Visual Studio Code | `winget install Microsoft.VisualStudioCode`      | Developer code editor         |
| **Language**       | Go                 | `winget install GoLang.Go`                       | Compiled backend language     |
| **Language**       | Node.js (LTS)      | `winget install OpenJS.NodeJS.LTS`               | JavaScript runtime            |
| **Language**       | Python 3.12        | `winget install Python.Python.3.12`              | Scripting language            |
| **Language**       | Java (Temurin 21)  | `winget install Eclipse.Adoptium.Temurin.21.JDK` | Java runtime and compiler     |
| **Dev Tool**       | Postman            | `winget install Postman.Postman`                 | API development tool          |
| **Database**       | MongoDB Server     | `winget install MongoDB.Server`                  | NoSQL database                |
| **Subsystem**      | WSL2 + Ubuntu      | `dism.exe /online /enable-feature ...`           | Linux environment on Windows  |
| **Container Tool** | Docker Desktop     | `Invoke-WebRequest ...`                          | Container management platform |

---
