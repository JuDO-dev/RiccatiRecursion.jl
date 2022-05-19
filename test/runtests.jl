using RiccatiRecursion
using Test
using SafeTestsets

@testset "RiccatiRecursion.jl" begin

    @testset "Standard Recursion" begin
        @safetestset "Factorization" begin include( "standard/factorization.jl" ) end
    end
end
