function [Out_k3,Out_k2,Out_k1]=NN3L_Run(Input)
    load('InitWeights.mat','N1','N2','N3','u2','u3','w1i2','w2i3');
    
    %Calculo de la Primera Capa
        Out_k1=Input;

    %Calculo de la Salida de la Segunda Capa

        cube_k2=u2+((Out_k1*w1i2)');
        Out_k2=zeros(1,N2);

        for i=1:N2
            Out_k2(i)=logsig(cube_k2(i));
        end

    % Calculo de la Salida de la Tercer Capa

        cube_k3=u3+((Out_k2*w2i3)');
        Out_k3=zeros(1,N3);

        for i=1:N3
            Out_k3(i)=logsig(cube_k3(i));
        end


end
    