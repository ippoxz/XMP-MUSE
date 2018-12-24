function U = Runge_Kutta_3(U, F, dt, time) 

    k1 = dt*F(U, time);
    k2 = dt*F(U + k1/3, time + dt/3);
    k3 = dt*F(U + 2*k2/3, time + 2*dt/3);
    
    U = U + 1/4*(k1+3*k3); 
    
end