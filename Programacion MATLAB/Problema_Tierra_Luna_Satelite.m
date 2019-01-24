addpath(genpath('Funciones y objetos'))

%------------------------Problem Tierra Luna Satelite--------------------------%

% Condiciones iniciales satelite

prompt = {'Elija orbita del satelite (1 = caotica, 2 = circular, 3 = eliptica con inclinacion)'};  
title = 'SelecciÃ³n de Ã³rbita';
num_lines = 1;
default = {'1'};   
Init_orb = inputdlg(prompt,title,num_lines,default);
Init_orb = char(Init_orb);
Init_orb = str2double(Init_orb);

clearvars default  prompt title num_lines
M_T = 81;

[r_s_0, v_s_0]  = condicion_init(Init_orb,M_T);


r_T_0 = [0, 0, 0];
r_L_0 = [1 0 0];
v_T_0 = [0 -1/9 0];
v_L_0 = [0 9 0];

U_0 = [r_T_0 ,r_L_0, r_s_0, v_T_0, v_L_0, v_s_0]';% Vector de condiciones iniciales
n = 1e4; %Numero de pasos
t = 20*pi/9; %tiempo de simulacion

[U, time] = Cauchy_Problem(U_0, @Tierra_Luna_Satelite, @Runge_Kutta_Fehlberg, @time_domain_equalspacing, t, n);

%Transformacion de variables del vector de estado en variables físicas

r_T = U(1:3,:);
r_L = U(4:6,:);
r_s = U(7:9,:);
v_T = U(10:12,:);
v_L = U(13:15,:);
v_s = U(16:18,:);

%Representacion gráfica

if Init_orb == 3
    
    
    figure
plot3(r_L(1,:),r_L(2,:),r_L(3,:))
grid on
axis('equal');
zlim([-0.5 0.5])
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')
title('Problema Tierra-Luna-Satelite','Interpreter','latex',...
      'FontSize',12)  
hold on
plot3(r_T(1,:),r_T(2,:),r_T(3,:))

hold on 
comet3(r_s(1,:),r_s(2,:),r_s(3,:))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

else
figure
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
comet(r_s(1,:),r_s(2,:))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

end

