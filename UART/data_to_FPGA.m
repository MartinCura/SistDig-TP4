
%agregar la parte de levantar el archivo

PORT = 'com3';
BAUDRATE = 115200;
DATA_BITS = 8;

datos = linspace(1,10,100);

%datos = datos/10;

FPGA = serial(PORT, 'BaudRate', BAUDRATE,'DataBits',DATA_BITS);
FPGA.StopBits = 1;
FPGA.Parity = 'none';
fopen(FPGA);
pause(2)

recov = zeros(1,length(datos));
%readasync(FPGA);
for i = 1:length(datos)
     
     fwrite(FPGA,datos(i),'double');
    % fscanf(FPGA,'%i')
    recov(i) = fread(FPGA,1,'double');
    
end

fclose(FPGA);