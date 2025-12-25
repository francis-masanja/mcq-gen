# User Guide

MCQ-Gen allows you to generate quizzes in two ways: via a terminal (CLI) or a web browser (GUI).

## 1. Web Interface (GUI)

The Graphical User Interface provides the richest experience, featuring a modern design, dark mode, and easy configuration.

### Starting the GUI
Run the server script:
```bash
./bin/mcq-server
```
*Wait for the message: `Starting MCQ-Gen GUI Server on http://localhost:8000`*

### Using the App
1. **Open Browser**: Navigate to [http://localhost:8000](http://localhost:8000).
2. **Input Context**:
   - In the sidebar on the left, paste your lecture notes, article text, or simply type a topic (e.g., "Photosynthesis").
3. **Select Difficulty**:
   - Choose **Easy**, **Medium**, or **Hard** from the dropdown.
4. **Start Quiz**:
   - Click the "Start Quiz" button.
   - The AI will process your input and present the first question in the chat area on the right.
5. **Answering**:
   - Type your answer (`A`, `B`, `C`, or `D`) in the input box at the bottom and press Enter.
   - The AI will evaluate your answer, provide an explanation, and generate the next question.
6. **Resetting**:
   - Click "Reset" in the sidebar to clear the history and start over with new context.

### Features
- **Dark Mode**: Toggle between light and dark themes using the moon/sun icon.
- **Connection Status**: A red banner appears if the backend connection is lost.

---

## 2. Terminal Interface (TUI)

The Text User Interface is ideal for quick, distraction-free sessions or for use on servers without a display.

### Starting the TUI
Run the CLI script:
```bash
./bin/mcq-cli
```

### Loading Files Directly
You can pass a text file as an argument to immediately generate questions from it:
```bash
./bin/mcq-cli my_notes.txt
```

### Usage
- The app works like a chat.
- If you didn't load a file, type your topic when prompted.
- Answer questions by typing the letter option.
- Type `exit` or `quit` to end the session.

---

## Tips for Best Results
- **Context is Key**: The more specific text you provide, the better the questions will be. Pasting a few paragraphs of a textbook works better than just typing a keyword.
- **Conceptual vs. Factual**: The "Hard" difficulty tries to ask conceptual questions that require understanding, while "Easy" focuses on basic recall.
