module CLI

using Crayons
using ..Ollama

# Colors
const STYLE_USER = Crayon(foreground = :cyan, bold = true)
const STYLE_BOT = Crayon(foreground = :green)
const STYLE_SYSTEM = Crayon(foreground = :yellow, bold = true)
const RESET = Crayon(reset = true)

function run_cli()
    # Clear screen
    print("\033[2J\033[H")
    
    println(STYLE_SYSTEM, "==============================================", RESET)
    println(STYLE_SYSTEM, "   MCQ-Gen: The TUI (Text User Interface)     ", RESET)
    println(STYLE_SYSTEM, "==============================================", RESET)
    println("Interactive CLI powered by Ollama and Julia")
    println("Type 'exit' to quit at any time.\n")

    messages = []
    
    # Check for file argument
    if !isempty(ARGS)
        file_path = ARGS[1]
        if isfile(file_path)
            println(STYLE_SYSTEM, "Reading content from: $(file_path)", RESET)
            content = read(file_path, String)
            push!(messages, Dict("role" => "user", "content" => "Hi! I want to generate MCQs based on this content:\n\n" * content))
            println("Content loaded successfully.\n")
        else
            println(STYLE_SYSTEM, "Warning: File '$(file_path)' not found. Starting normally.", RESET)
            push!(messages, Dict("role" => "user", "content" => "Hi! I'd like to generate some MCQs."))
        end
    else
        push!(messages, Dict("role" => "user", "content" => "Hi! I'd like to generate some MCQs."))
    end

    should_call_ai = true

    while true
        try
            if should_call_ai
                print(STYLE_SYSTEM, "MCQ-Gen is thinking...", RESET, "\r")
                
                assistant_msg = Ollama.query(messages)
                
                # Clear "thinking" line
                print(" "^30, "\r")
                
                println(STYLE_BOT, "MCQ-Gen:", RESET)
                println(assistant_msg["content"])
                println()
                
                push!(messages, assistant_msg)
            end
            
            should_call_ai = false
            
            print(STYLE_USER, "You: ", RESET)
            user_input = readline()
            
            if isempty(strip(user_input))
                continue
            end
            
            if lowercase(strip(user_input)) in ["exit", "quit", "q"]
                println(STYLE_SYSTEM, "Goodbye!", RESET)
                break
            end
            
            push!(messages, Dict("role" => "user", "content" => user_input))
            should_call_ai = true
            
        catch e
            if isa(e, InterruptException)
                println("\n", STYLE_SYSTEM, "Goodbye! (Interrupted)", RESET)
                break
            elseif isa(e, EOFError)
                println("\n", STYLE_SYSTEM, "Goodbye! (EOF)", RESET)
                break
            else
                println("\n", STYLE_SYSTEM, "Error:", RESET, " ", e)
                break
            end
        end
    end
end

end # module
