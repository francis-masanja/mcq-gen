# Project Plan: MCQ-Gen App Expansion

## Phase 1: Planning & Documentation
- [ ] Create comprehensive plan in `todo.md`
- [ ] Initialize `summary.md` for detailed step-tracking

## Phase 2: Initialization Scripts
- [ ] Create `init.sh` (Linux/Mac)
    - Check for Julia and Ollama
    - Create the Ollama model
    - Install necessary Julia packages
- [ ] Create `init.bat` (Windows)
    - Equivalent checks and setup commands

## Phase 3: The TUI (Text User Interface)
- [ ] Review existing `mcq_gen.jl`
- [ ] Refine `mcq_gen.jl` to serve as the dedicated TUI application
- [ ] Ensure it handles file arguments and interactive chat robustly

## Phase 4: The GUI (Web-based Interface)
- [ ] Create `server.jl` (Backend)
    - Set up HTTP.jl server
    - Create endpoint to communicate with Ollama
    - Create endpoint to serve static files
- [ ] Create `gui/` directory
- [ ] Create `gui/index.html`
    - Implement Vue.js (via CDN) for reactive UI
    - Design chat layout (Chat bubble vs Settings pane)
- [ ] Create `gui/style.css`
    - Modern, clean aesthetics

## Phase 5: App Packaging & Guide
- [ ] Create `GUIDE.md` (User Manual)
    - Instructions for Installation
    - Instructions for TUI usage
    - Instructions for GUI usage
- [ ] Create `launch.sh` (Optional helper to pick mode)

## Phase 6: Final Verification
- [ ] Verify `init.sh` execution
- [ ] Verify TUI functionality
- [ ] Verify GUI server and frontend interaction