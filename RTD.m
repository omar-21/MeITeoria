clc
clear 
close all

% Propiedades del Pt100

R0=100;          % Resistencia nominal
alpha=0.00385;   % Coeficiente térmico
T0=0;            % Temperatura nominal
T=[0 25 50 75 100]; % Temperaturas reales

% Expresión lineal del Pt100

Rx=R0*(1+alpha*(T-T0));

% Expresión lineal del puente de Wheatstone

V=5;        % Fuente de voltaje
R=100;      % Resistencia de compensación
R1=5000;    % Resistencia superior del puente

Vab=V*( (Rx-R)./(R1+R) );

% Grafica VAB y T
figure
plot(T,1000*Vab,'LineWidth',2)
ylabel('V_{AB} [mV]')
xlabel('Temperatura Real (T) [º C]')
grid on

% Grafica VAB y Rx
figure
plot(Rx,1000*Vab,'LineWidth',2)
ylabel('V_{AB} [mV]')
xlabel('Resistencia a medir en PW (R_x) [\Omega]')
grid on

% Grafica Rx y T
figure
plot(T,Rx,'LineWidth',2)
ylabel('Resistencia a medir en PW (R_x) [\Omega]')
xlabel('Temperatura Real (T) [º C]')
grid on
