# API Documentation

## Backend API

The Julia server exposes a simple REST API consumed by the frontend.

### 1. Chat Completion
**Endpoint**: `POST /api/chat`

**Description**: Sends conversation history to the AI and retrieves the next response.

**Request Body**:
```json
{
  "messages": [
    { "role": "user", "content": "Topic: Biology" },
    { "role": "assistant", "content": "Question 1..." },
    { "role": "user", "content": "A" }
  ]
}
```

**Response (200 OK)**:
```json
{
  "role": "assistant",
  "content": "Correct! The answer is A because..."
}
```

### 2. Health Check
**Endpoint**: `GET /api/health`

**Description**: Checks if the Julia server can communicate with the Ollama instance.

**Response (200 OK)**:
```json
{
  "status": "ok"
}
```

**Response (503 Service Unavailable)**:
```json
{
  "status": "error",
  "message": "Ollama unreachable"
}
```

---

## Julia Internal Modules

### `MCQGen.Ollama`
- `query(messages::Vector)`: Sends a request to Ollama and returns the message content.
- `health_check()`: Returns `true` if Ollama is responsive, `false` otherwise.

### `MCQGen.Web`
- `run_server(port::Int)`: Starts the blocking HTTP server.
- `request_handler(req)`: Routes incoming HTTP requests.

### `MCQGen.CLI`
- `run_cli()`: Starts the interactive terminal loop.
