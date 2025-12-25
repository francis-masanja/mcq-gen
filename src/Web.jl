module Web

using HTTP
using JSON
using ..Ollama

const GUI_DIR = "gui"

function request_handler(req::HTTP.Request)
    # API: Chat
    if req.method == "POST" && req.target == "/api/chat"
        try
            body_str = String(req.body)
            data = JSON.parse(body_str)
            
            if haskey(data, "messages")
                try
                    response_msg = Ollama.query(data["messages"])
                    return HTTP.Response(200, ["Content-Type" => "application/json"], JSON.json(response_msg))
                catch e
                    return HTTP.Response(500, ["Content-Type" => "application/json"], JSON.json(Dict("error" => "Ollama Error: $e")))
                end
            else
                return HTTP.Response(400, "Missing 'messages' field")
            end
        catch e
            return HTTP.Response(500, "Server Error: $e")
        end
    end

    # API: Health
    if req.method == "GET" && req.target == "/api/health"
        is_up = Ollama.health_check()
        if is_up
            return HTTP.Response(200, ["Content-Type" => "application/json"], JSON.json(Dict("status" => "ok")))
        else
            return HTTP.Response(503, ["Content-Type" => "application/json"], JSON.json(Dict("status" => "error", "message" => "Ollama unreachable")))
        end
    end

    # Static Files
    path = req.target == "/" ? "/index.html" : req.target
    # Remove query parameters if any
    path = split(path, '?')[1]
    
    # Security: Normalize path and prevent traversal
    # Simple check: remove .. 
    clean_path = replace(path, ".." => "")
    file_path = joinpath(GUI_DIR, lstrip(clean_path, '/'))

    if isfile(file_path)
        content = read(file_path)
        content_type = "text/plain"
        if endswith(path, ".html") content_type = "text/html"
        elseif endswith(path, ".css") content_type = "text/css"
        elseif endswith(path, ".js") content_type = "application/javascript"
        elseif endswith(path, ".png") content_type = "image/png"
        elseif endswith(path, ".ico") content_type = "image/x-icon"
        end
        
        return HTTP.Response(200, ["Content-Type" => content_type], content)
    else
        return HTTP.Response(404, "File Not Found")
    end
end

function run_server(port::Int)
    println("Starting MCQ-Gen GUI Server on http://localhost:$port")
    println("Press Ctrl+C to stop.")
    
    # Ensure GUI directory exists
    if !isdir(GUI_DIR)
        println("Warning: '$GUI_DIR' directory not found. Static files will not be served correctly.")
    end

    try
        HTTP.serve(request_handler, "0.0.0.0", port)
    catch e
        if e isa InterruptException
            println("\nServer stopped.")
        else
            rethrow(e)
        end
    end
end

end # module
