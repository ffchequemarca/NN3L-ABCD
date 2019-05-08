clear all
clc

%% Definimos La Red Neuronal
N1=16;
N2=10;
N3=10;

%% Definimos Las Entradas y Salidas y Parametros de entrenamiento
% In_T=[0 0;0 1;1 0;1 1];
% Out_T=[0;1;1;0];
load('Patterns.mat');
f_learn=0.01;

%% Inicializamos Variables

E=Out_T*0;
E_stop=0.1;
Ep=1;
Error_Training=[0 0];
Epoca=1;
Nsamples=size(E);
Nsamples=Nsamples(1);

%% Inicializamos Pesos
%NN3L_InitWeights(N1,N2,N3);
load('InitWeights.mat');

%% Entramos a Entrenar la Neurona 
while Ep>E_stop
    
    %Recorre Todas Las Muestras
    for n=1:Nsamples
        Input=In_T(n,:);
        Si=Out_T(n,:);
        [y,o2,x]=NN3L_Run(Input);
        
        E(n,:)=0.5*(y-Si).^2;
        
        %Hallamos los delta.
        d3=y.*(1.-y).*(-(Si-y));
        
        d2=zeros(1,N2);
        for k=1:N2
            for p=1:N3
                d2(k)=d2(k)+w2i3(k,p)*d3(p);
            end
            d2(k)=o2(k)*(1-o2(k))*d2(k);
        end
        
        
        
        %Hallamos el gradiente del error con respecto a los pesos           
        dEw2=zeros(N2,N3);
        for j=1:N2
            for k=1:N3
                dEw2(j,k)=o2(j)*d3(k);
            end
        end
        
        dEw1=zeros(N1,N2);
        for j=1:N1
            for k=1:N2
                dEw1(j,k)=x(j)*d2(k);
            end
        end
        
        %Actualizamos los pesos
        w1i2=w1i2-(f_learn*dEw1);
        w2i3=w2i3-(f_learn*dEw2);
        
        u3=u3-(f_learn*d3');
        u2=u2-(f_learn*d2')';
        
        save('InitWeights.mat','N1','N2','N3','u2','u3','w1i2','w2i3');
    end
    
    Ep=mean(sum((E')));
    Epoca=Epoca+1;    
    disp(Ep);
end


