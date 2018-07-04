clear all, close all, clc;
%agregar la parte de levantar el archivo

PORT = 'com3';
BAUDRATE = 9600;
DATA_BITS = 8;

datos = [355 2 3 1 300 2 3 1 300 2 3 1 300 2 3 1 300 2 3 1];

%datos = datos/10;

FPGA = serial(PORT, 'BaudRate', BAUDRATE,'DataBits',DATA_BITS);
FPGA.StopBits = 1;
FPGA.Parity = 'none';
fopen(FPGA);
pause(2)

recov = zeros(1,length(datos));
%readasync(FPGA);
for i = 1:length(datos)
     
     fwrite(FPGA,datos(i),'uint8');
     pause(0.5)
    % fscanf(FPGA,'%i')
    % recov(i) = fread(FPGA,1,'char')
    
end

fclose(FPGA);