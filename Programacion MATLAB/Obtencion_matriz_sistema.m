addpath(genpath('Funciones y objetos'))

%------------------Obtencion de la matriz de un sistema--------------%

U_0 = [1 0]'; %Vector de condiciones iniciales
n = 100; %Numero de pasos
t = 2*pi; %tiempo de simulacion

eps = 1e-3;%Pertubacion

A = SystemMatrix(@Cauchy_Problem, @Oscillator, U_0, eps, @Dormand_Prince, @time_domain_equalspacing, t, n);




