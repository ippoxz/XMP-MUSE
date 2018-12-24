function U = Runge_Kutta_5(U, F, dt, time)

    k1 = dt*F(U, time);
    k2 = dt*F(U + k1/6, time + dt/6);
    k3 = dt*F(U + 4/75*k1+16/75*k2, time + 4*dt/15);
    k4 = dt*F(U +5/6*k1 -8/3*k2 +5/2*k3, time +2/3*dt);
    k5 = dt*F(U -165/64*k1 +55/6*k2 -425/64*k3 +85/96*k4, time + 5/6*dt);
    k6 = dt*F(U +12/5*k1 -8*k2 +4015/612*k3 -11/36*k4+88/255*k5, time + dt);

    U = U + 13/160*k1 +2375/5984*k3 + 5/16*k4 + 12/85*k5 + 3/44*k6; 
    
end