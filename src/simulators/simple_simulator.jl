"""
dx = dynamics(x, p, t)
x0: initial state
"""
struct SimpleSimulator <: AbstractSimulator
    dynamics
    x0
end


function whatsit(simulator::SimpleSimulator)
    (; x0) = simulator
    println("This is $(typeof(simulator)) with initial condition $(x0)!")
end


function sim(simulator::SimpleSimulator; tf, solver=Tsit5())
    (; dynamics, x0) = simulator
    tspan = (0, tf)
    prob = ODEProblem(dynamics, x0, tspan)
    sol = solve(prob, solver)
end
