addpath(genpath('Funciones y objetos'))

%-------------------Estudio de los puntos de Lagrange----------------------%

%Elección de tiempo y punto de Lagrange a estudiar

prompt = {'Elija tiempo (medido en periodos lunares)'...
    ,'Elija Punto de Lagrange (1-5)'};  
dlg_title = 'Puntos Langrange';
num_lines = 1;
defaultans = {'10','4'};   
datos = inputdlg(prompt,dlg_title,num_lines,defaultans);
datos = str2double(datos);
p = datos(1);
n = datos(2);

clearvars -except p n
%Variables adimensionales del problema

G = 1;
M_T = 81;
M_L = 1;
r_l = 1;

% Condiciones iniciales satelite

[r_s_0, v_s_0] = punto_lagrange(n,G,M_T,M_L,r_l);

%Condiciones iniciales Luna y Tierra
r_T_0 = [0, 0, 0];
r_L_0 = [1 0 0];
v_T_0 = [0 -1/9 0];
v_L_0 = [0 9 0];

U_0 = [r_T_0 ,r_L_0, r_s_0, v_T_0, v_L_0, v_s_0]';% Vector de condiciones iniciales
n = 1e4*p; %Numero de pasos
t = (2*pi*sqrt(r_l^3/G/M_T)+0.01325)*p; %tiempo de simulacion

[U, time] = Cauchy_Problem(U_0, @Tierra_Luna_Satelite, @Dormand_Prince, @time_domain_equalspacing, t, n);

%Transformacion de variables del vector de estado en variables físicas

r_T = U(1:3,:);
r_L = U(4:6,:);
r_s = U(7:9,:);
v_T = U(10:12,:);
v_L = U(13:15,:);
v_s = U(16:18,:);

%Representacion gráfica


figure(1)
plot(r_L(1,:),r_L(2,:))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')
title('Problema Tierra-Luna-Satelite','Interpreter','latex',...
      'FontSize',12)  
hold on
plot(r_T(1,:),r_T(2,:))

hold on 
plot(r_s(1,:),r_s(2,:))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');


%----------------------------Plano de Poincare---------------------------%

figure(2)
t_period = (length(time)-1)/p;
for i = 1:p
plot(sqrt(r_s(1,i*t_period+1)^2+r_s(2,i*t_period+1)^2),r_s(3,i*t_period+1),'x')
hold on
end
grid on
axis('equal');
xlim([0 1])
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')
title('Plano de Poincare','Interpreter','latex',...
      'FontSize',12) 
axis('square')
