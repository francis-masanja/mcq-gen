# Installation Guide

## Prerequisites

Before running MCQ-Gen, ensure you have the following software installed on your system:

### 1. Ollama (The AI Engine)
MCQ-Gen uses Ollama to run the Llama 3 language model locally.
- **Download**: [https://ollama.com/download](https://ollama.com/download)
- **Verify**: Open a terminal and run `ollama --version`.
- **Start Service**: Ensure the Ollama service is running (`ollama serve` in a separate terminal if on Linux).

### 2. Julia (The Programming Language)
The application logic and server are written in Julia.
- **Download**: [https://julialang.org/downloads/](https://julialang.org/downloads/)
- **Version**: We recommend Julia v1.6 or higher (tested on v1.11).
- **Verify**: Run `julia --version`.

---

## Automatic Setup (Recommended)

We provide initialization scripts to automate the setup process.

### Linux / macOS
1. Open your terminal in the project root.
2. Run the initialization script:
   ```bash
   ./init.sh
   ```
3. This script will:
   - Check for dependencies.
   - Pull/Create the `mcq-gen` model in Ollama.
   - Install all required Julia packages defined in `Project.toml`.

### Windows
1. Open Command Prompt (cmd) or PowerShell in the project root.
2. Run the batch file:
   ```bat
   init.bat
   ```

---

## Manual Setup

If the scripts fail or you prefer manual control:

1. **Create the Model**:
   ```bash
   ollama create mcq-gen -f Modelfile
   ```

2. **Instantiate Julia Environment**:
   ```bash
   julia --project=. -e 'using Pkg; Pkg.instantiate()'
   ```

---

## Troubleshooting

### "Ollama not found"
- Ensure Ollama is installed and added to your system's PATH.
- On Linux, the service might not be active. Run `systemctl status ollama` or start it manually with `ollama serve`.

### "Package X not found" in Julia
- Ensure you are running Julia with the project environment active (`--project=.`).
- Run `julia --project=. -e 'using Pkg; Pkg.resolve(); Pkg.instantiate()'` to force dependency resolution.

### Permission Denied (Linux/Mac)
- If you cannot run the scripts in `bin/`, run:
  ```bash
  chmod +x bin/mcq-cli bin/mcq-server init.sh
  ```
