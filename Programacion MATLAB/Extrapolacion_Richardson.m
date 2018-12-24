addpath(genpath('Funciones y objetos'))
%-------------------Extrapolacion Richardson------------------------------%

p = 10;
pert = linspace(0.00001,0.01,p);
exp_Lyap = zeros(1,p);

n = 1e4; %Numero de pasos
t = 100; %tiempo de simulacion

U_real = zeros(1,n);
V_real = zeros(1,n);
Error = zeros(1,n);
Error_vs_real = zeros(1,n);

order = 4; %Orden del esquema numerico

for j = 1:p
a = pert(j);

U_0_p = [1+a; 0]; %Condicion inicial perturbada
U_0 = [1, 0]'; %Vector de condiciones iniciales


[U_1, time_1] = Cauchy_Problem(U_0_p, @Oscillator, @Runge_Kutta_4, @time_domain_equalspacing, t, n);
[U_2, time_2] = Cauchy_Problem(U_0, @Oscillator, @Runge_Kutta_4, @time_domain_equalspacing, t, 2*n);

for i = 1:n+1
    U_real(i) = cos(time_1(i));
    V_real(i) = -sin(time_1(i));
    Error(i) = norm(U_2(:,2*i-1) - U_1(:,i))/(1-(1/2)^order);
    Error_vs_real(i) = norm([U_real(i); V_real(i)]- U_1(:,i));
end

exp_Lyap(j) = 1/time_1(n)*log(Error(n)/a);

plot(time_1,log(Error))
grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('Curvas logaritmicas del error', 'FontSize',14,'Interpreter','latex')
hold on
end



%Representaciones gráficas


figure 
plot(time_1,U_1(1,:))
grid on
hold on
plot(time_2,U_2(1,:))
hold on
plot(time_1,U_real)
xlabel('$tiempo$', 'FontSize',14,'Interpreter','latex')
ylabel('$x$', 'FontSize',14,'Interpreter','latex')
legend('Solucion $\Delta t$','Solucion $\Delta t/2$','Solucion analitica')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');
