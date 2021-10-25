clear
close all
clc

a = arduino('/dev/cu.usbmodem141401','Uno');


i = 0; 
y=0;
t=0;
t0=0; %tiempo inicial
tFinal = 5;

% Señal de entrada de tipo ESCALON
writeDigitalPin(a,'D8',0);
pause(5);
writeDigitalPin(a,'D8',1);
voltaje = 0;
while (t(end) < tFinal)
        tic;
        voltaje = readVoltage(a, 'A0'); %lectura de voltaje
        t_muestreo = toc; 
        % Registramos el tiempo en el que la medicIión se realiza
        t0 = t0 + t_muestreo;
        y = [y, voltaje]; %guardamos los datos de amplitud (voltaje)
        t = [t, t0];   %guardamos los datos de tiempo
        i = i + 1;
end

figure
plot(t,y)
grid on
ylabel('Voltaje (V)')
xlabel('Tiempo (s)')

%guardamos los vectores de tiempo "t", y amplitud "y"
save ('cap_100uF.mat', 't','y'); %cambiar 100uF por el valor del capacitor que se esté
                     %midiendo