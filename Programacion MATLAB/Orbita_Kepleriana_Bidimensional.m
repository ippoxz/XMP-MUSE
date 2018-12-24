addpath(genpath('Funciones y objetos'))

%--------------------Orbita kepler bidimensional--------------------------%

r_0 = [1, 0];
v_0 = [0, 1];

U_0 = [r_0, v_0]'; %Vector de condiciones iniciales
n = 1e6; %Numero de pasos
t = 2*pi*10*365; %tiempo de simulacion


[U, time] = Cauchy_Problem(U_0, @kepler_2D, @Runge_Kutta_8, @time_domain_equalspacing, t, n);

%Transformacion de variables del vector de estado en variables físicas

x = U(1,:);
y = U(2,:);
dxdt = U(3,:);
dydt = U(4,:);

%Representacion gráfica

figure
plot(x,y)
grid on
axis('equal');
title('Orbita Kepler bidimensional','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(x(length(time)),y(length(time)),'or')
legend('Orbita','Posicion final(para ver error de fase)')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');