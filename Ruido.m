clear
close all
clc

%generación de la señal senoidal
A = 10e-3;    %Amplitud 10 mV
N = 100; %Número de muestras
ts = 1e-4; %Periodo de muestreo (intervalo entre puntos) de la señal
t = 0:ts:ts*(N-1); %vector de tiempo
f = 200; % Frecuencia de la señal (200 Hz)

Vo = A*sin(2*pi*f*t); %voltaje senoidal sin ruido

% Ruido blanco -> PDF normal
%sigmav = 0.01e-3; % 0.01 mV de ruido
sigmavvar = [0.01e-3 0.05e-3 0.1e-3 1e-3 5e-3]; % Vector de amplitudes de ruido

% Ciclo para diferentes amplitudes de la señal de ruido

for i = 1:length(sigmavvar)

nv = sigmavvar(i) * randn(1,N); %voltaje de ruido
                          % N=100 muestras de ruido, para que se puedan sumar
                          % con las N muestras de la senoidal

V = (Vo + nv); % voltaje más ruido

% Indica el inicio de la iteracion.
fprintf('CON AMPLITUD DE RUIDO DE %s [mVrms]: \n',num2str(1000*sigmavvar(i)));

figure
subplot(2,1,1)
plot(t,Vo)
ylabel('Voltaje (V)')
xlabel('Tiempo (s)')
title ('Señal sin ruido')  % ponemos titulo a la gráfica

subplot(2,1,2)
plot(t,V)
ylabel('Voltaje (V)')
xlabel('Tiempo (s)')
title (['Señal con ruido de:' num2str(sigmavvar(i)) 'Vrms'])  % ponemos titulo a la gráfica con el valor de la amplitud del ruido (sigmav)

snratio=20*(log10(((A/sqrt(2))/sigmavvar(i)))); %Relacion señal a ruido
% Imprime el valor de relación señal a ruido
fprintf(' La relacion señal a ruido es: %s [dB].\n \n',num2str(snratio));

end