#!/bin/bash

echo "=== MCQ-Gen Official Setup ==="

# 1. Check for Dependencies
if ! command -v ollama &> /dev/null; then
    echo "[Error] Ollama is not installed."
    exit 1
fi

if ! command -v julia &> /dev/null; then
    echo "[Error] Julia is not installed."
    exit 1
fi

# 2. Setup AI Model
echo "--- Setting up AI Model ---"
if [ -f "Modelfile" ]; then
    ollama create mcq-gen -f Modelfile
    echo "[✓] Model 'mcq-gen' created."
else
    echo "[Error] Modelfile not found."
    exit 1
fi

# 3. Instantiate Julia Environment
echo "--- Instantiating Julia Environment ---"
julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'

echo "--- Setup Complete ---"
echo "Run the CLI: ./bin/mcq-cli"
echo "Run the GUI: ./bin/mcq-server"