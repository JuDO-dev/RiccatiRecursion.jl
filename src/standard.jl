
struct RiccatiRecursion{form<:Formulation} <: AbstractRiccatiRecursion{form}


    Q
    R
    S
    P

    q
    s

    A
    B

    formulation::form

end

struct StandardRiccatiFactorization{NT} <: AbstractRiccatiFactorizationStep
    P::Matrix{NT}
    H::Matrix{NT}
    C::Cholesky{NT, Matrix{NT}}
end


function factorize( recur::RiccatiRecursion{<:LTI}, N::Int )
    factor = RiccatiFactorization{StandardRiccatiFactorization}()

    P = recur.P

    i = N-1
    while i >= 0
        Pₙ, Hₙ, Cₙ = _factorize_step_standard( P, recur.Q, recur.R, recur.S, recur.A, recur.B )

        push!( factor.S, StandardRiccatiFactorization( P, Hₙ, Cₙ ) )

        P = Pₙ
        i = i-1
    end

end


function factorize( recur::RiccatiRecursion{<:LTV} )

end


function _factorize_step_standard( P, Q, R, S, A, B )
    Fₙ = Q + A'*P*A
    Gₙ = R + B'*P*B
    Hₙ = S + A'*P*B

    C = cholesky( Gₙ )

    Kₙ = C\(-Hₙ)

    Pₙ = Fₙ - Kₙ'*Gₙ*Kₙ

    return Pₙ, Hₙ, C
end
