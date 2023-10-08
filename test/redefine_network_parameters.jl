using Random
using Lux
using Zygote
using ComponentArrays
using Statistics


"""
Given a network x -> f(x; p), how to redefine it as t -> f(x; g(t, p))?
"""
function main(; seed=2023)
    Random.seed!(seed)
    rng = Random.default_rng()
    N = 10
    x = rand(1, N)
    y = rand(1, N)
    model = Chain(
                  Dense(1, 2),
                  Dense(2, 1),
                 )
    ps, ls = Lux.setup(rng, model)
    ps = ComponentArray(ps)  # important to make it an array
    loss_fn(ps, ls) = mean(abs2.(model(x, ps, ls)[1] .- y))
    gs = Zygote.gradient(ps -> loss_fn(ps, ls), ps)[1];
    g(t, ps, gs) = cos(t)*ps - sin(t)*gs
    @show grad_t = Zygote.gradient(t-> loss_fn(g(t, ps, gs), ls), 0)
end
