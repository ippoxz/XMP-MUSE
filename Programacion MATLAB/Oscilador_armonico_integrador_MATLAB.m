addpath(genpath('Funciones y objetos'))

%---------------------Oscilador armonico utilizando RK45------------------%

t =  20*pi;
U_0 = [1, 0];

options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20,'OutputFcn',@odeplot);
[T, U] = ode45(@(t,U)Oscillator(U), [0 t], U_0, options);

grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('$x$', 'FontSize',14,'Interpreter','latex')

figure
plot(U(:,1),U(:,2))
grid on
axis('equal');
title('Oscilador armonico RK','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

hold on

plot(U(length(T),1),U(length(T),2),'or')
legend('Orbita','Posicion final(para ver error de fase)')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');
