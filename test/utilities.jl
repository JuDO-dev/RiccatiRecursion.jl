
function riccati_eq( P, Q, R, S, A, B )
    return ( Q + A'*P*A - A'*P*B*inv( R + B'*P*B )*B'*P*A )
end
