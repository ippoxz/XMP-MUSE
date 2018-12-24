function U = Runge_Kutta_Fehlberg(U, F, dt, time) 

    k1 = dt*F(U, time);
    k2 = dt*F(U + k1/4, time + dt/4);
    k3 = dt*F(U + 3/32*k1+9/32*k2, time + 3*dt/8);
    k4 = dt*F(U +1932/2197*k1 -7200/2197*k2 +7296/2197*k3, time +12/13*dt);
    k5 = dt*F(U +439/216*k1 -8*k2 +3680/513*k3 -845/4104*k4, time + dt);
    k6 = dt*F(U -8/27*k1 +2*k2 -3544/2565*k3 +1859/4104*k4-11/40*k5, time + dt/2);

    U = U +16/135*k1+6656/12825*k3+28561/56430*k4-9/50*k5+2/55*k6; 

end