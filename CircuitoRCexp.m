close all
clc

%Leemos tres archivos, y los guardamos en las variables SX
S1 = load('cap_10uF');
S2 = load('cap_47uF');
S3 = load('cap_100uF');

%SX tiene almacenados dos vectores: t, y

%Accesamos al contenido de cada SX y guardamos en nuevas variables
% t -> tiempo
% y -> amplitud
t_10uF = S1.t;
t_47uF = S2.t;
t_100uF = S3.t;

Vc_10uF = S1.y;
Vc_47uF = S2.y;
Vc_100uF = S3.y;

figure
plot(t_10uF, Vc_10uF)
hold on
plot(t_47uF, Vc_47uF)
plot(t_100uF, Vc_100uF)
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
grid on
legend('C=10uF','C=47uF', 'C=100uF')

% Respuestas en el tiempo teóricas
%Caso 1: C= 100uF y R=10k
tau_100uF = 1;
A = 6;
y_100uF = A*(1-exp(-t_100uF./tau_100uF));

figure
plot(t_100uF,y_100uF,'LineWidth',2)
hold on
plot(t_100uF,Vc_100uF,':','LineWidth',2)
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Teórica','Experimental')
title('Capacitor de 100 [\muF]')
hold off

%Caso 2: C= 47 uF y R=10k
tau_47uF = 0.47;
A = 5;
y_47uF = A*(1-exp(-t_47uF./tau_47uF));

figure
plot(t_47uF,y_47uF,'LineWidth',2)
hold on
plot(t_47uF,Vc_47uF,':','LineWidth',2)
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Teórica','Experimental')
title('Capacitor de 47 [\muF]')
hold off

%Caso 3:C= 10 uF y R=10k
tau_10uF = 0.1;
A = 5;
y_10uF = A*(1-exp(-t_10uF./tau_10uF));

figure
plot(t_10uF,y_10uF,'LineWidth',2)
hold on
plot(t_10uF,Vc_10uF,':','LineWidth',2)
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Teórica','Experimental')
title('Capacitor de 10 [\muF]')
hold off
