module RiccatiRecursion


abstract type Formulation end

struct LTI <: Formulation end
struct LTV <: Formulation end


abstract type AbstractRiccatiRecursion{form<:Formulation} end


abstract type AbstractRiccatiFactorizationStep end


mutable struct RiccatiFactorization{F<:AbstractRiccatiFactorizationStep}
    S::Vector{F}
end

include( "standard.jl" )
include( "factorized.jl" )

end
