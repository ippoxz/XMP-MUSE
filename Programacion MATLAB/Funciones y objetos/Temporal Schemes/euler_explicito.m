function U = euler_explicito(U, F, dt, time) 
    U = U + dt*F(U,time); 
end
