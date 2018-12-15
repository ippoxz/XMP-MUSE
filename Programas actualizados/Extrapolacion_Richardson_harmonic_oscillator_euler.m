addpath ('Funciones y objetos')
%-------------------Extrapolacion Richardson------------------------------%
n = 2000000;

U_0 = zeros(2,n);
U_0(:,1) = [1; 0]; %Condicion inicial
t = 50;
dt = t/n;
t_1 = linspace(0,t,n);
t_2 = linspace(0,t,2*n);

[W_1, W_2, U_real,Error, Error_vs_real] =  Richardson_oscillator(t,n,U_0,dt);

figure
plot(t_1,Error)
grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('Error entre dos numericas', 'FontSize',14,'Interpreter','latex')



figure
plot(t_1,Error_vs_real)
grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('Error entre numerico y analitico', 'FontSize',14,'Interpreter','latex')


figure 
plot(t_1,W_1(1,:))
grid on
hold on
plot(t_2,W_2(1,:))
hold on
plot(t_1,U_real)
xlabel('$tiempo$', 'FontSize',14,'Interpreter','latex')
ylabel('$x$', 'FontSize',14,'Interpreter','latex')
legend('Solucion $\Delta t$','Solucion $\Delta t/2$','Solucion analitica')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');


