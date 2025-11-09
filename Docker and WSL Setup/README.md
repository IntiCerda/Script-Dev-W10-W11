# Docker and WSL Setup – Windows 10/11

## Description

This PowerShell script automates the full installation and configuration of **WSL2 (Windows Subsystem for Linux)** and **Docker Desktop** on Windows 10 or Windows 11.
It is designed to simplify the setup process for developers who need a ready-to-use Linux and Docker environment on Windows.

### What the Script Does

The script performs the following steps automatically:

1. **Enable Required Windows Features**

   - Activates the **Windows Subsystem for Linux (WSL)** and the **Virtual Machine Platform** features through `dism.exe`.
   - These are required components to run Linux distributions on Windows and to use Docker with WSL2.

2. **Set WSL2 as Default**

   - Ensures that any new Linux distributions installed will use **WSL2** instead of the legacy WSL1 engine.
   - WSL2 provides better performance, full system call compatibility, and is required for Docker integration.

3. **Install Ubuntu**

   - Installs the **latest version of Ubuntu** available from the Microsoft Store using the `wsl --install` command.
   - This provides a stable and widely used Linux environment ready for development.

4. **Download and Install Docker Desktop**

   - Downloads the latest **Docker Desktop Installer** directly from Docker’s official source.
   - Installs Docker Desktop silently (`--quiet`), ensuring a smooth setup experience.
   - Once installed, Docker Desktop provides a GUI for managing containers, images, and volumes.

5. **Configure Docker to Use WSL2**

   - Automatically switches Docker to use the **Linux Engine** (WSL2 backend) instead of the Hyper-V engine.
   - This ensures optimal performance and seamless integration with your Ubuntu environment.

6. **Cleanup Temporary Files**

   - Removes the Docker installer after setup to keep the system clean.

7. **Final Step – Restart**

   - Prompts the user to **restart the system** to finalize changes and apply all configurations.

---

## Installed Components

| Component                             | Description                                             | Source          |
| ------------------------------------- | ------------------------------------------------------- | --------------- |
| **Windows Subsystem for Linux (WSL)** | Enables running Linux directly on Windows.              | Microsoft       |
| **Virtual Machine Platform**          | Required for WSL2 virtualization.                       | Microsoft       |
| **Ubuntu**                            | Default Linux distribution installed under WSL2.        | Microsoft Store |
| **Docker Desktop**                    | Provides Docker engine and GUI for managing containers. | Docker Inc.     |

---

## Why This Script is Useful

- **Automates all setup steps** — no need to manually enable Windows features or download installers.
- ⚡ **Saves time** by installing and configuring both WSL2 and Docker in one go.
- **Ensures compatibility** by setting Docker to use the optimal WSL2 backend.
- **Ideal for developers** working with containers, microservices, or Linux-based tools from Windows.

---

## How to Run

To execute the script directly from your terminal (PowerShell) using the raw file from GitHub, run the following command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
iwr -useb https://raw.githubusercontent.com/IntiCerda/Script-Dev-W10-W11/main/Docker%20and%20WSL%20Setup/setup-docker-wsl.ps1 | iex
```

This command:

- Temporarily **bypasses PowerShell’s execution policy** (so you don’t need admin changes).
- **Downloads and runs** the script directly from your GitHub repository.
- Works on **Windows 10 and 11**.

---

## 🚀 Post-Installation Notes

- After installation completes, **restart your computer**.
- You can verify that WSL2 and Docker are working properly by running:

  ```powershell
  wsl --status
  docker version
  ```

- Once restarted, you’ll be able to launch **Docker Desktop** and **Ubuntu** from the Start Menu.

---
