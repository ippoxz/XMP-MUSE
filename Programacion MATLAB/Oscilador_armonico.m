addpath(genpath('Funciones y objetos'))

%------------------Programa calculo radio oscilador armonico--------------%

U_0 = [1; 0]; %Vector de condiciones iniciales
n = 1e4; %Numero de pasos
t = 10; %tiempo de simulacion

%Elijase el temporal scheme deseado de la carpeta, en este caso se usa
%Dormand_Prince

[U, time] = Cauchy_Problem(U_0, @Oscillator, @Runge_Kutta_8, @time_domain_equalspacing, t, n);

resultado = U(2,n+1)^2 + U(1,n+1)^2;





