function[W_1, W_2, U_real,Error, Error_vs_real] =  Richardson_oscillator(t,n,U_0,dt,pert)

t_1 = linspace(0,t,n);

for i = 1:2
    U = euler_explicito_2(U_0,1/i*dt,i*n);
    if i == 1
        W_1 = U;
    else
        W_2 = U;
    end
    
end
U_real = zeros(1,n);
Error = zeros(1,n);
Error_vs_real = zeros(1,n);

for i = 1:n
    U_real(i) = (1+pert)*cos(t_1(i));
    Error(i) = abs(W_2(1,2*i) - W_1(1,i))*2;
    Error_vs_real(i) = abs(U_real(i)- W_1(1,i))  ;
end
end
