# Windows 10/11 Development Environment Setup

## Overview

This repository provides a collection of **PowerShell scripts** that automate the setup of a **modern development environment on Windows 10 and Windows 11**.
It is designed to help developers quickly configure their systems with essential tools, languages, and environments — including **VSCode**, **Docker**, and **WSL2** —.

Each script can be executed individually depending on your needs, and all are designed to run safely on fresh or existing Windows installations.

---

## Repository Contents

### 1. **Basic Development Setup**

- **File:** [`setup-dev README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Basic%20Development%20Setup/README.md)
- **Purpose:** Installs the core tools, languages, and editors for a typical development environment.

#### Installs:

- **Tools:** Git, Visual Studio Code
- **Languages:** Go, Node.js (LTS), Python, Java (Temurin 21)
- **Development Tools:** Postman, MongoDB Compass
- **VSCode Extensions:**
  Go, ESLint, Prettier, Python, Docker, MongoDB, Indenticator, Material Icon Theme, Palenight Theme, Subtle Brackets

---

### 2. **Docker and WSL Setup**

- **File:** [`setup-docker-wsl README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Docker%20and%20WSL%20Setup/README.md)
- **Purpose:** Installs and configures **WSL2** (Windows Subsystem for Linux) and **Docker Desktop** for container-based development.

#### Installs and Configures:

- Enables **Windows Subsystem for Linux** and **Virtual Machine Platform**
- Sets **WSL2** as the default version
- Installs **Ubuntu**
- Downloads and installs **Docker Desktop**
- Configures Docker to use the **WSL2 backend**
- Cleans up installers after setup

⚠️ **Note:** Ensure that **virtualization is enabled in your BIOS** before running this script.
You can verify this in **Task Manager → Performance → CPU → Virtualization** (it should say _Enabled_).
Docker Desktop and WSL2 will not work correctly without it.

---

### 3. **Complete Development Setup**

- **File:** [`setup-dev-complete README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Complete%20Development%20Setup/README.md)
- **Purpose:** A full setup that combines the previous scripts into one process.
  It installs developer tools, languages, WSL2, Docker, and VSCode extensions — everything ready in a single run.

#### Includes:

- PowerShell execution policy configuration
- Installation/update of **Winget**
- Core tools (Git, VSCode, Postman, MongoDB Server)
- Programming languages (Go, Node.js, Python, Java)
- WSL2 + Ubuntu installation
- Docker Desktop configuration
- VSCode extensions (same as in _Basic Development Setup_)

---

## 🧱 System Requirements

- **Operating System:** Windows 10 or Windows 11
- **Privileges:** Administrator access required
- **Internet Connection:** Required for package downloads via Winget and official installers

---

## Why Use These Scripts?

- **Full automation:** No manual installations or downloads.
- **Consistency:** Ensures identical environments across different machines.
- **Time-saving:** One command sets up your entire development workspace.
- **Modular:** Use only the scripts you need.
- **Safe:** Uses official sources (Winget, Microsoft Store, Docker official downloads).

---

## 📎 Author

- **Created by:** [Inti Cerda](https://github.com/IntiCerda)
- **Repository:** [Script-Dev-W10-W11](https://github.com/IntiCerda/Script-Dev-W10-W11)

---

---

# Configuración de Entorno de Desarrollo para Windows 10/11

## Descripción General

Este repositorio contiene una colección de **scripts en PowerShell** que automatizan la configuración de un **entorno de desarrollo moderno en Windows 10 y Windows 11**.
Está diseñado para ayudar a los desarrolladores a preparar rápidamente su sistema con las herramientas, lenguajes y entornos esenciales — incluyendo **VSCode**, **Docker** y **WSL2** —

Cada script puede ejecutarse de forma independiente según tus necesidades, y todos están preparados para funcionar de forma segura en instalaciones nuevas o existentes de Windows.

---

## Contenido del Repositorio

### 1. **Basic Development Setup**

- **Archivo:** [`setup-dev README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Basic%20Development%20Setup/README.md)
- **Propósito:** Instala las herramientas, lenguajes y editores esenciales para un entorno de desarrollo estándar.

#### Instala:

- **Herramientas:** Git, Visual Studio Code
- **Lenguajes:** Go, Node.js (LTS), Python, Java (Temurin 21)
- **Herramientas de Desarrollo:** Postman, MongoDB Compass
- **Extensiones de VSCode:**
  Go, ESLint, Prettier, Python, Docker, MongoDB, Indenticator, Material Icon Theme, Palenight Theme, Subtle Brackets

---

### 2. **Docker and WSL Setup**

- **Archivo:** [`setup-docker-wsl README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Docker%20and%20WSL%20Setup/README.md)
- **Propósito:** Instala y configura **WSL2** (Subsistema de Windows para Linux) y **Docker Desktop** para desarrollo basado en contenedores.

#### Instala y Configura:

- Activa **Windows Subsystem for Linux** y **Virtual Machine Platform**
- Define **WSL2** como versión predeterminada
- Instala **Ubuntu**
- Descarga e instala **Docker Desktop**
- Configura Docker para usar **WSL2**
- Elimina los instaladores temporales tras finalizar

⚠️ **Importante:** Asegúrate de que la **virtualización esté activada en la BIOS** antes de ejecutar este script.
Puedes verificarlo en **Administrador de Tareas → Rendimiento → CPU → Virtualización** (debe decir _Habilitado_).
Sin esto, Docker Desktop y WSL2 no funcionarán correctamente.

---

### 3. **Complete Development Setup**

- **Archivo:** [`setup-dev-complete README`](https://github.com/IntiCerda/Script-Dev-W10-W11/blob/main/Complete%20Development%20Setup/README.md)
- **Propósito:** Configuración completa que combina los dos scripts anteriores en un solo proceso.
  Instala herramientas de desarrollo, lenguajes, WSL2, Docker y extensiones de VSCode.

#### Incluye:

- Configuración de política de ejecución de PowerShell
- Instalación/actualización de **Winget**
- Herramientas principales (Git, VSCode, Postman, MongoDB Server)
- Lenguajes (Go, Node.js, Python, Java)
- Instalación de WSL2 + Ubuntu
- Configuración de Docker Desktop
- Extensiones de VSCode (las mismas que en _Basic Development Setup_)

---

## Requisitos del Sistema

- **Sistema Operativo:** Windows 10 o Windows 11
- **Privilegios:** Acceso de administrador
- **Conexión a Internet:** Requerida para descargar paquetes e instaladores oficiales

---

## ¿Por qué usar estos scripts?

- **Automatización completa:** Sin instalaciones manuales.
- **Consistencia:** Mismo entorno en distintas máquinas.
- **Ahorro de tiempo:** Todo el entorno se configura en un solo paso.
- **Modularidad:** Usa solo los scripts que necesites.
- **Seguro:** Usa fuentes oficiales (Winget, Microsoft Store, Docker).

---

## 📎 Autor

- **Creado por:** [Inti Cerda](https://github.com/IntiCerda)
- **Repositorio:** [Script-Dev-W10-W11](https://github.com/IntiCerda/Script-Dev-W10-W11)

---
