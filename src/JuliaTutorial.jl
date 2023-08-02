module JuliaTutorial

using DifferentialEquations
using FSimZoo


include("simulators/simulators.jl")
include("fsimzoo.jl")


# simulator
export AbstractSimulator
export SimpleSimulator, ComplexSimulator
export sim


end
