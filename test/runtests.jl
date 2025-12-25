using Test
using MCQGen

@testset "MCQGen Tests" begin
    # Mock tests - since we can't easily mock the full HTTP server/Ollama in this environment without more deps,
    # we test basic existence of modules.
    @test isdefined(MCQGen, :start_server)
    @test isdefined(MCQGen, :start_tui)
    
    # Test internal module loading
    @test isdefined(MCQGen.Web, :run_server)
    @test isdefined(MCQGen.CLI, :run_cli)
    @test isdefined(MCQGen.Ollama, :query)
end
