function U = Runge_Kutta_2(U, F, dt, time) 

    k1 = dt*F(U, time);
    k2 = dt*F(U + k1/2, time);
    
    U = U + k2; 
    
end