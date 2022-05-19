using RiccatiRecursion
using LinearAlgebra

include( "../utilites.jl" )

P = [ 1.0 0.0;
      0.0 2.0]

Q = [1.0 1.0;
     1.0 1.0]
R = [1.0]
S = zeros( Float64, (2, 1) )

# This is a controllable and stable discrete-time system
Astab = [0.9 1.0
         0.0 0.9]

B = [0.0;
     1.0]


gst = riccati_eq( P, Q, R, S, A, B )
dut = _factorize_step_standard( P, Q, R, S, A, B )

@test gst == dut
