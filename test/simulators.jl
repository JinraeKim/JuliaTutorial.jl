using Test
using ComponentArrays  # unnecessary; only for tutorial (extras and targets in Project.toml)
using JuliaTutorial


function test_simple_whatsit(simulator)
    @show "This is for simple whatsit"
    JuliaTutorial.whatsit(simulator)
end


function test_complex_whatsit(simulator)
    @show "This is for complex whatsit"
    y = ComponentArray(x=[1, 2, 3])
    @show "ComponentArrays is awesome! $(y.x)"
    # whatsit(simulator)  # will report an error due to no export
end


function test_simple_sim(simulator; eps=1e-3)
    sol = sim(simulator; tf=10)
    @test sum(sol[end] .^ 2) < eps
end


function test_complex_sim(simulator; eps=1e-3)
    sol = sim(simulator; tf=10)
    @test sum(sol[end] .^ 2) < eps
end


function main()
    simple_dyn = (x, p, t) -> -x
    x0 = [1, 2, 3]
    simple_simulator = SimpleSimulator(simple_dyn, x0)
    complex_dyn = (x, p, t) -> -p * x
    p = 5
    complex_simulator = ComplexSimulator(complex_dyn, x0, p)

    test_simple_whatsit(simple_simulator)
    test_complex_whatsit(complex_simulator)
    test_simple_sim(simple_simulator)
    test_complex_sim(complex_simulator)
end



@testset "simulators" begin
    main()
end
