using JuliaTutorial
using ComponentArrays
using Plots


function main(; tf=10)
    dynamics = (x, p, t) -> -x
    x0 = ComponentArray(x1=1, x2=2, x3=3)
    simulator = SimpleSimulator(dynamics, x0)
    sol = sim(simulator; tf)
    ts = sol.t
    x1s = [x.x1 for x in sol.u]
    x2s = [x.x2 for x in sol.u]
    x3s = [x.x3 for x in sol.u]
    fig = plot(; layout=(3, 1))
    plot!(fig[1], ts, x1s)
    plot!(fig[2], ts, x2s)
    plot!(fig[3], ts, x3s)
    display(fig)
end
