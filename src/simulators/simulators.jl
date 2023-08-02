# Pkg name: Simulators.jl
# abstract type: AbstractSimulator
# subtypes: XXXSimulator
abstract type AbstractSimulator end


function whatsit(simulator::AbstractSimulator, args...; kwrags...)
    error("Define function $(whatsit) for your simulator whose type is $(typeof(simulator))")
end


include("simple_simulator.jl")
include("complex_simulator.jl")
