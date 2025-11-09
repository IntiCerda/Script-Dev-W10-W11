# 🧰 Setup Dev Basic — Windows Developer Environment

## 📖 Description

The **Setup Dev Basic** PowerShell script automates the installation of a complete development environment on **Windows 10/11** using **Winget** (the Windows Package Manager) and **Visual Studio Code extensions**.

It is designed to provide a clean, ready-to-code setup for backend, frontend, and full-stack developers — focusing on productivity, language tooling, debugging, and code quality.

The script includes:

- 🧠 **Basic tools** (Git, VS Code)
- 🧩 **Programming languages and runtimes** (Go, Node.js, Python, Java)
- 🧪 **Development utilities** (Postman, MongoDB Compass)
- 🎨 **VSCode extensions** for linting, formatting, theming, and productivity
- ⚙️ **Environment variable setup** to ensure the Go toolchain is properly configured

---

### 1. 🧰 Tools Installation

Installs essential developer tools using **Winget**:

- **Git** — version control system for source code management.
- **Visual Studio Code (VSCode)** — lightweight, powerful source code editor for all major languages.

### 2. 🧑‍💻 Language Runtimes

Installs popular programming languages and their runtimes:

- **Go (GoLang)** — compiled language for backend and microservices development.
- **Node.js (LTS)** — JavaScript runtime environment for frontend tooling and APIs.
- **Python 3.12** — interpreted language for scripting, automation, and data science.
- **Java (Temurin 21 JDK)** — cross-platform language widely used for enterprise and Android development.

### 3. 🧪 Development Tools

Installs additional development tools:

- **Postman** — powerful API development and testing platform.
- **MongoDB Compass** — graphical interface for managing and visualizing MongoDB databases.

### 4. 💻 VSCode Extensions

Enhances VS Code with productivity, formatting, and aesthetic tools:

| Extension                     | ID                                   | Purpose                                                             |
| ----------------------------- | ------------------------------------ | ------------------------------------------------------------------- |
| **Go**                        | `ms-vscode.Go`                       | Provides IntelliSense, debugging, and code navigation for Go.       |
| **ESLint**                    | `dbaeumer.vscode-eslint`             | Enforces JavaScript/TypeScript code quality through linting.        |
| **Prettier – Code Formatter** | `esbenp.prettier-vscode`             | Auto-formats code consistently across multiple languages.           |
| **Python**                    | `ms-python.python`                   | Enables Python language support, linting, and debugging.            |
| **Docker**                    | `ms-azuretools.vscode-docker`        | Adds Dockerfile syntax highlighting and container management tools. |
| **MongoDB for VSCode**        | `mongodb.mongodb-vscode`             | Allows MongoDB connections and queries directly within VSCode.      |
| **Indenticator**              | `SirTori.indenticator`               | Highlights indentation levels for improved readability.             |
| **Material Icon Theme**       | `PKief.material-icon-theme`          | Beautiful icon set for files and folders in VSCode.                 |
| **Palenight Theme**           | `whizkydee.material-palenight-theme` | Elegant dark color theme inspired by Material Design.               |
| **Subtle Match Brackets**     | `rafamel.subtle-brackets`            | Softly highlights matching brackets to enhance code clarity.        |

### 5. ⚙️ Environment Configuration

Finally, the script adds the Go binary path (`$env:USERPROFILE\go\bin`) to the user’s **PATH** environment variable, allowing the `go` command to be recognized globally.

---

## 🧩 Requirements

Before running the script, ensure:

- You are using **Windows 10 or 11**.
- **Winget** (Windows Package Manager) is installed.
  It’s included by default on recent Windows versions.
- **PowerShell** is available (recommended: version 5.1+).
- You have **administrative privileges** to install system software.

---

## ⚡️ How to Run the Script

You can run the **Setup Dev Basic** script directly from PowerShell using a single command — no need to manually download the file.

### ▶️ One-line execution (recommended)

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/IntiCerda/Script-Dev-W10-W11/main/Basic%20Development%20Setup/setup-dev.ps1'))
```

This command:

- Downloads the latest version of the setup script from the public GitHub repository.
- Executes it automatically within your PowerShell session.

### 📂 Manual download and execution

If you prefer to download and run it manually, use:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IntiCerda/Script-Dev-W10-W11/main/Basic%20Development%20Setup/setup-dev.ps1" -OutFile "$env:USERPROFILE\Downloads\setup-dev.ps1"
cd "$env:USERPROFILE\Downloads"
powershell -ExecutionPolicy Bypass -File .\setup-dev.ps1
```

> 💡 **Note:**
> You might need to enable PowerShell script execution before running the script:
>
> ```powershell
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```

---

## 🧾 Summary of Installed Components

| Category             | Name                  | Installer / Source                               | Description                       |
| -------------------- | --------------------- | ------------------------------------------------ | --------------------------------- |
| **Tool**             | Git                   | `winget install Git.Git`                         | Source code version control       |
| **Tool**             | Visual Studio Code    | `winget install Microsoft.VisualStudioCode`      | Main development editor           |
| **Language**         | Go                    | `winget install GoLang.Go`                       | Modern compiled language          |
| **Language**         | Node.js (LTS)         | `winget install OpenJS.NodeJS.LTS`               | JavaScript runtime                |
| **Language**         | Python 3.12           | `winget install Python.Python.3.12`              | Scripting and automation language |
| **Language**         | Java (Temurin 21)     | `winget install Eclipse.Adoptium.Temurin.21.JDK` | JVM-based programming language    |
| **Dev Tool**         | Postman               | `winget install Postman.Postman`                 | API development and testing       |
| **Dev Tool**         | MongoDB Compass       | `winget install MongoDB.Compass.Full`            | GUI for MongoDB management        |
| **VSCode Extension** | Go                    | `ms-vscode.Go`                                   | Go language support               |
| **VSCode Extension** | ESLint                | `dbaeumer.vscode-eslint`                         | JavaScript/TypeScript linting     |
| **VSCode Extension** | Prettier              | `esbenp.prettier-vscode`                         | Code formatting                   |
| **VSCode Extension** | Python                | `ms-python.python`                               | Python support                    |
| **VSCode Extension** | Docker                | `ms-azuretools.vscode-docker`                    | Docker integration                |
| **VSCode Extension** | MongoDB               | `mongodb.mongodb-vscode`                         | MongoDB integration               |
| **VSCode Extension** | Indenticator          | `SirTori.indenticator`                           | Indentation visualization         |
| **VSCode Extension** | Material Icon Theme   | `PKief.material-icon-theme`                      | File and folder icons             |
| **VSCode Extension** | Palenight Theme       | `whizkydee.material-palenight-theme`             | Color theme                       |
| **VSCode Extension** | Subtle Match Brackets | `rafamel.subtle-brackets`                        | Bracket highlighting              |

---
