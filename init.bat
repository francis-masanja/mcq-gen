@echo off
echo === MCQ-Gen Official Setup ===

:: 1. Check Dependencies
where ollama >nul 2>nul
if %errorlevel% neq 0 (
    echo [Error] Ollama is not installed.
    pause
    exit /b
)

where julia >nul 2>nul
if %errorlevel% neq 0 (
    echo [Error] Julia is not installed.
    pause
    exit /b
)

:: 2. Setup AI Model
echo --- Setting up AI Model ---
if exist Modelfile (
    ollama create mcq-gen -f ./Modelfile
    echo [✓] Model 'mcq-gen' created.
) else (
    echo [Error] Modelfile not found.
    pause
    exit /b
)

:: 3. Instantiate Julia Environment
echo --- Instantiating Julia Environment ---
julia --project=. -e "using Pkg; Pkg.instantiate(); Pkg.precompile()"

echo --- Setup Complete ---
echo Run the CLI: julia --project=. -e "using MCQGen; start_tui()"
echo Run the GUI: julia --project=. -e "using MCQGen; start_server()"
pause
