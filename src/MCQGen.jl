module MCQGen

using HTTP
using JSON
using Crayons

# Export sub-modules or functions
export start_server, start_tui

include("Ollama.jl")
include("Web.jl")
include("CLI.jl")

using .Web
using .CLI

function start_server(port::Int=8000)
    Web.run_server(port)
end

function start_tui()
    CLI.run_cli()
end

end # module
