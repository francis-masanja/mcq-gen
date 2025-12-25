# 🎓 MCQ-Gen: AI-Powered Quiz Generator

Transform any text content into engaging, interactive multiple-choice quizzes using cutting-edge local AI technology. Built with Julia and powered by Ollama for complete privacy and offline functionality.

![MCQ-Gen Interface](gui/mcq-gen.png)

## ✨ What Makes MCQ-Gen Special?

**🤖 Intelligent Content Analysis**: Advanced AI understands context, key concepts, and learning objectives to generate pedagogically sound questions

**🎯 Adaptive Learning**: Choose difficulty levels (Easy/Medium/Hard) to match your knowledge level and learning goals

**💬 Interactive Experience**: Chat-like interface presents questions one-by-one with instant feedback and detailed explanations

**🔒 Complete Privacy**: Runs entirely on your machine with local models - no data ever leaves your computer

**⚡ Lightning Fast**: Built with Julia for optimal performance and rapid quiz generation

## 🚀 Quick Start

### Prerequisites
- [Julia 1.6+](https://julialang.org/downloads/)
- [Ollama](https://ollama.ai/) installed and running

### One-Time Setup
```bash
# Clone and setup
git clone <repository-url>
cd mcq-gen
./init.sh    # Linux/Mac
# or
init.bat     # Windows
```

### Choose Your Interface

#### 🌐 Web GUI (Recommended)
```bash
./bin/mcq-server
```
Open [http://localhost:8000](http://localhost:8000) in your browser for the full interactive experience.

#### ⌨️ Terminal CLI
```bash
./bin/mcq-cli
```

## 📖 How It Works

### 1. **Input Your Content**
- Paste lecture notes, textbooks, articles, or any educational material
- Or simply type a topic you want to learn about
- The AI analyzes the content for key concepts and relationships

### 2. **Configure Your Quiz**
- Select difficulty level:
  - **Easy**: Basic recall and recognition
  - **Medium**: Understanding and application
  - **Hard**: Analysis and synthesis
- Set the number of questions (coming soon)

### 3. **Interactive Learning**
- Questions appear one at a time in a conversational format
- Get instant feedback on your answers
- Receive detailed explanations for correct answers
- Track your progress and understanding

## 🛠️ Technical Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web GUI       │    │   Terminal CLI  │    │   Julia Core    │
│   (Vue.js)      │◄──►│   (TUI)         │◄──►│   (MCQGen.jl)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                                        │
                                               ┌─────────────────┐
                                               │   Ollama API    │
                                               │   (Local LLM)   │
                                               └─────────────────┘
```

### Core Components
- **MCQGen.jl**: Main orchestration module
- **Web.jl**: HTTP server and API endpoints
- **CLI.jl**: Terminal-based user interface
- **Ollama.jl**: Local LLM integration and prompt engineering

## 📚 Documentation

- 📥 **[Installation Guide](docs/INSTALLATION.md)** - Detailed setup for all platforms
- 👤 **[User Guide](docs/USER_GUIDE.md)** - Comprehensive usage instructions
- 🏗️ **[Development Guide](docs/DEVELOPMENT.md)** - Architecture and contribution guidelines
- 🔌 **[API Reference](docs/API.md)** - Backend endpoints and module documentation

## 🎯 Use Cases

### For Students
- Transform textbooks into practice quizzes
- Prepare for exams with targeted practice
- Test comprehension of complex topics
- Create study guides from lecture notes

### For Educators
- Generate assessment questions from curriculum materials
- Create differentiated quizzes for various skill levels
- Develop interactive classroom activities
- Provide immediate feedback to students

### For Content Creators
- Transform blog posts into engaging quizzes
- Create educational content for audiences
- Develop training materials with built-in assessment
- Generate discussion questions from content

## ⚙️ Configuration

### Ollama Setup
The application automatically creates and configures the optimal model on first run:
```bash
# View available models
ollama list

# Update model (if needed)
ollama pull <model-name>
```

### Environment Variables
```bash
# Optional: Custom Ollama endpoint
export OLLAMA_HOST=localhost:11434

# Optional: Custom port for web server
export MCQ_GEN_PORT=8000
```

## 🔧 Troubleshooting

### Common Issues

**Ollama not detected**
```bash
# Start Ollama service
ollama serve

# Or check if running
ps aux | grep ollama
```

**Julia packages missing**
```bash
# From project directory
julia --project -e 'using Pkg; Pkg.instantiate()'
```

**Port already in use**
```bash
# Kill process on port 8000
lsof -ti:8000 | xargs kill -9
# Or use a different port
./bin/mcq-server 8080
```

## 🤝 Contributing

We welcome contributions! Please see our [Development Guide](docs/DEVELOPMENT.md) for:
- Code style guidelines
- Architecture decisions
- Testing procedures
- Pull request process

### Development Setup
```bash
# Install development dependencies
julia --project -e 'using Pkg; Pkg.dev(".")'

# Run tests
julia test/runtests.jl
```

## 📊 Performance & Benchmarks

- **Quiz Generation**: ~2-5 seconds per question (varies by content complexity)
- **Memory Usage**: ~500MB base + model size
- **Supported Content**: Up to 50,000 characters per session
- **Concurrent Users**: Single-user optimized (web GUI supports multiple sessions)

## 🆚 Comparison

| Feature | MCQ-Gen | Online Tools | Traditional Methods |
|---------|---------|--------------|-------------------|
| **Privacy** | ✅ 100% Local | ❌ Cloud-based | ✅ Manual |
| **AI Quality** | ✅ Local LLM | ✅ Cloud AI | ❌ Human-created |
| **Cost** | ✅ Free | ❌ Subscription | ✅ Time-intensive |
| **Customization** | ✅ Full Control | ⚠️ Limited | ✅ Unlimited |
| **Speed** | ✅ Fast | ✅ Fast | ❌ Slow |

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- **Ollama Team** - For making local AI accessible
- **Julia Community** - For the powerful programming language
- **Vue.js Team** - For the reactive frontend framework
- **Contributors** - For improving this project

---

**Built with ❤️ for educators, students, and lifelong learners**

*Transform your learning experience today - no API keys required, no data shared, just pure AI-powered education.*
