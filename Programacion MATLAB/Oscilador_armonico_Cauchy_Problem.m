addpath(genpath('Funciones y objetos'))

%---------------------Oscilador armonico utilizando Cauchy_Problem------------------%

U_0 = [1; 0]; %Vector de condiciones iniciales
n = 1e5; %Numero de pasos
t = 20*pi; %tiempo de simulacion

[U, time] = Cauchy_Problem(U_0, @Oscillator, @Dormand_Prince, @time_domain_equalspacing, t, n);

%Transformacion de variables del vector de estado en variables físicas

x = U(1,:);
dxdt = U(2,:);

%Representacion gráfica

figure
plot(x,dxdt)
grid on
axis('equal');
title('Oscilador armonico RK','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

hold on

plot(x(length(time)),dxdt(length(time)),'or')
legend('Orbita','Posicion final(para ver error de fase)')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');
