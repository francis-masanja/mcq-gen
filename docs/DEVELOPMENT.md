# Development Guide

This document is for developers who want to modify or contribute to MCQ-Gen.

## Project Architecture

MCQ-Gen follows a modular architecture using Julia.

### Directory Structure
- **`src/`**: Contains the core logic.
  - **`MCQGen.jl`**: The main package entry point. Exports `start_server` and `start_tui`.
  - **`Ollama.jl`**: Handles all communication with the Ollama API.
  - **`Web.jl`**: Implements the HTTP server and routing logic.
  - **`CLI.jl`**: Implements the terminal loop and ANSI coloring.
- **`gui/`**: Contains frontend assets.
  - **`index.html`**: The Vue.js application.
  - **`style.css`**: CSS variables and styling.
- **`bin/`**: Wrapper scripts to launch the application easily.

## Setting Up Dev Environment

1. **Clone & Enter**:
   ```bash
   git clone <repo-url>
   cd mcq-gen
   ```
2. **Instantiate**:
   ```bash
   julia --project=. -e 'using Pkg; Pkg.instantiate()'
   ```
3. **Running in REPL**:
   For rapid development, start Julia in the project root:
   ```bash
   julia --project=.
   ```
   Then you can load the package and run functions:
   ```julia
   using MCQGen
   MCQGen.start_server(8080) # Run on port 8080
   ```

## Running Tests

We use Julia's built-in `Test` unit.
```bash
julia --project=. test/runtests.jl
```

## Frontend Development

The frontend is a simple HTML/CSS/JS application using **Vue.js 3** (via CDN). No build step (Webpack/Vite) is required, making it easy to edit.
- Modify `gui/index.html` for layout and logic.
- Modify `gui/style.css` for styling.
- Simply refresh your browser to see changes (ensure the server is running).

## Extending the AI

To change how the AI behaves, modify the `Modelfile`.
- **System Prompt**: Update the `SYSTEM` instruction to change the personality or rules.
- **Parameters**: You can add `PARAMETER temperature 0.7` to control creativity.
- **Apply Changes**: After editing `Modelfile`, run `ollama create mcq-gen -f Modelfile` to update the model.
