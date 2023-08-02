"""
dx = dynamics(x, p, t)
x0: initial state
"""
struct ComplexSimulator <: AbstractSimulator
    dynamics
    x0
    p
end


function whatsit(simulator::ComplexSimulator)
    (; x0, p) = simulator
    println("This is $(typeof(simulator)) with initial condition $(x0) and parameter $(p)!")
end


function sim(simulator::ComplexSimulator; tf, solver=Tsit5())
    (; dynamics, x0, p) = simulator
    tspan = (0, tf)
    prob = ODEProblem(dynamics, x0, tspan, p)
    sol = solve(prob, solver)
end
