function U = Runge_Kutta_4(U, F, dt, time) 

    k1 = dt*F(U, time);
    k2 = dt*F(U + k1/2, time + dt/2);
    k3 = dt*F(U + k2/2, time + dt/2);
    k4 = dt*F(U +k3, time + dt);
    
    U = U + 1/6*(k1+2*k2+2*k3+k4); 
    
end