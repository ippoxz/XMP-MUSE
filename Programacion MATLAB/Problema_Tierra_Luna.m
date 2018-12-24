addpath(genpath('Funciones y objetos'))

%------------------------Problema Tierra Luna--------------------------%
%U_0 = [0, 0, 0,1 0 0,0.2 0 0,0 -1/9 0,0 9 0,0 20.1246 0]';

r_T_0 = [0, 0, 0];
r_L_0 = [1 0 0];
v_T_0 = [0 -1/9 0];
v_L_0 = [0 9 0];

U_0 = [r_T_0, r_L_0, v_T_0, v_L_0]';% Vector de condiciones iniciales
n = 1e4; %Numero de pasos
t = 20*pi/9; %tiempo de simulacion

[U, time] = Cauchy_Problem(U_0, @Tierra_Luna, @Runge_Kutta_Fehlberg, @time_domain_equalspacing, t, n);

%Transformacion de variables del vector de estado en variables físicas

r_T = U(1:3,:);
r_L = U(4:6,:);
v_T = U(7:9,:);
v_L = U(10:12,:);

%Representacion gráfica


figure
plot(r_L(1,:),r_L(2,:))
grid on
axis('equal');
title('Problema dos cuerpos Tierra-Luna','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(r_T(1,:),r_T(2,:))
legend('$Luna$','$Tierra$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');