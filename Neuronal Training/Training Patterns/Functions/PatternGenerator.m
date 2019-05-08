clc
clear all;

%% Generar Vector Numero 0
In_T=zeros(30,16);
Out_T=zeros(30,10);

Out_TAux=zeros(10,10);
In_TAux=zeros(10,16);

Out_TAux1=zeros(10,10);
In_TAux1=zeros(10,16);

% Out_TAux2=zeros(10,10);
% In_TAux2=zeros(10,16);

for i=1:10    
    filename=strcat('Diapositiva',num2str(i));
    filename=strcat(filename,'.jpg');
    fila=i;
    In_T(fila,:)=NN_ImageProcessing(filename);  
    disp(fila)
    Out_T(fila,i)=1;
end

for i=1:10    
    filename=strcat('Fotos1 (',num2str(i));
    filename=strcat(filename,').jpg');
    fila=i;
    In_TAux(fila,:)=NN_ImageProcessing(filename);  
    disp(fila)
    Out_TAux(fila,i)=1;
end

Out_T(11:20,:)=Out_TAux;
In_T(11:20,:)=In_TAux;


for i=1:10    
    filename=strcat('Fotos3 (',num2str(i));
    filename=strcat(filename,').jpg');
    fila=i;
    In_TAux1(fila,:)=NN_ImageProcessing(filename);  
    disp(fila)
    Out_TAux1(fila,i)=1;
end

Out_T(21:30,:)=Out_TAux1;
In_T(21:30,:)=In_TAux1;

% for i=1:10    
%     filename=strcat('Fotos3 (',num2str(i));
%     filename=strcat(filename,').jpg');
%     fila=i;
%     In_TAux2(fila,:)=NN_ImageProcessing(filename);  
%     disp(fila)
%     Out_TAux2(fila,i)=1;
% end
% 
% Out_T(31:40,:)=Out_TAux2;
% In_T(31:40,:)=In_TAux2;

save('Patterns.mat','In_T','Out_T');

