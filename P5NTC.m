clc
clear
close all

%% NTC 10k

% Fórmula de Steinhart-Hart 

Rds=[98.96E+3 10E+3 3.588E+3];   % Resistencias de datasheet
Tds=[0 25 50];         % Temperaturas de datasheet

% Ecuaciones matriciales de SH

TSH=[1/(Tds(1)+273.15); 1/(Tds(2)+273.15); 1/(Tds(3)+273.15)]; 
M=[1 log(Rds(1)) log(Rds(1))^3;1 log(Rds(2)) log(Rds(2))^3;...
    1 log(Rds(3)) log(Rds(3))^3];

Coef=M\TSH; % Coeficientes de Steinhart-Hart


%% Implementación en Arduino

a = arduino("/dev/cu.usbmodem141401",'UNO');

N = 2000; %numero de lecturas
t_ini = 1; %tiempo inicial
x=0;

%Parámetros del termómetro Digital

V1 = 5; %Voltaje de entrada
Rs = 10000; % Resistencia conocida


while (t_ini<N) %ciclo para tomar N lecturas
  V2 = readVoltage(a,'A1');
  %toma la lectura del canal A0 de arduino, el resultado es el voltaje
  %directamente calculado por:
  %volts = (ADC*5)/1023
  
  % Conversión de voltaje a resistencia
  R = Rs * ((V1/V2) - 1);
  
  % Escribir AQUÍ la ecuación de Steinhart-Hart para convertir
  % de Resistencia a Temperatura
  
  T=( Coef(1)+Coef(2)*log(R)+Coef(3)*(log(R))^3 )^(-1);

  Tc = T - 273.15; % Convierte a °C
  
  
  %esto es para graficar en "tiempo-real"
  x=[x,Tc];
  plot(x)
  xlabel('Mediciones [N]')
  ylabel('Temperatura [ºC]')
  title('Termómetro con NTC 10k')
  grid on
  t_ini=t_ini+1; %cada ciclo se incrementa la variable de conteo
  drawnow
end