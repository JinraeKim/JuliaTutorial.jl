# The following example shows that multiple dispatch does not require "inherit"
abstract type AbstractShape end


struct Circle <: AbstractShape
    r
end


struct Rectangle <: AbstractShape
    a
    b
end


struct Square <: AbstractShape
    a
end


struct Complex <: AbstractShape
end


function area(shape::AbstractShape)
    error("Define area for your shape $(typeof(shape))")
end


function area(shape::Circle)
    (; r) = shape
    π * r^2
end


function area(shape::Rectangle)
    (; a, b) = shape
    a * b
end


function area(shape::Square)
    (; a) = shape
    a * a
end


function area(shape::Complex)
    error("area cannot be calculated")
end
