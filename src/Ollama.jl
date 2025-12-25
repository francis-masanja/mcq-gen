module Ollama

using HTTP
using JSON

const OLLAMA_API = "http://localhost:11434/api/chat"
const MODEL_NAME = "mcq-gen"

function query(messages)
    payload = Dict(
        "model" => MODEL_NAME,
        "messages" => messages,
        "stream" => false
    )
    
    try
        response = HTTP.post(OLLAMA_API, 
                             ["Content-Type" => "application/json"], 
                             JSON.json(payload))
        
        if response.status != 200
            error("Ollama API returned status $(response.status)")
        end
        
        body = JSON.parse(String(response.body))
        return body["message"]
    catch e
        rethrow(e)
    end
end

function health_check()
    try
        resp = HTTP.get("http://localhost:11434/")
        return resp.status == 200
    catch
        return false
    end
end

end # module
