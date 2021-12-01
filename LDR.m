clc
clear
close all

%% LDR

%% Implementación en Arduino
% Puerto de conexión con tarjeta
a = arduino("/dev/cu.usbmodem143401",'UNO');

N = 1000; % Lecturas
ti = 1; % Tiempo inicial
x=zeros(1,N); % Vector para nivel de luminancia
R=zeros(1,N); % Vector para resistencia de LDR

% Datos del divisor de voltaje

Vi = 5; % Fuente de entrada
Rs = 10000; % Resistencia conocida

while (ti<N) % Ciclo de N lecturas
  Vs = readVoltage(a,'A0');   % Lectura de puerto analógico

   RLDR = Rs * ((Vi/Vs) - 1); % Despeje del div. voltaje

  %Convertir resistencia del sensor a nivel de luminanción
  LUX=800.69*((RLDR)^(-1.283));
  
  % Graficar lecturas al momento 
  x(ti)=LUX;
  R(ti)=RLDR;
  subplot(2,1,1)
  plot(x)
  title('LDR')
  ylabel('Nivel de luminancia [lx]')
  grid on
  subplot(2,1,2)
  plot(R)
  xlabel('Mediciones [N]')
  ylabel('Resistencia [\Omega]')
  grid on
  ti=ti+1; % Aumento del índice
  drawnow
end