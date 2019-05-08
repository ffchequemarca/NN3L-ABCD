function [Input_NN,Image] = NN_ImageProcessing(filename)
Image_In=imread(filename);
Image_In=imadjust(rgb2gray(Image_In));
Image_In=imresize(Image_In,[256 256]);


Image=zeros(256,256);

for i=1:256
    for j=1:256
        if Image_In(i,j)<40
            Image(i,j)=1;
        else
            Image(i,j)=0;
        end
    end
end

se=strel('square',10);
Image=imdilate(Image,se);

Image=im2bw(Image);

for i=1:256
    fila=257-i;
    if Image(fila,:)==zeros(1,256)
        Image(fila,:)=[];
    end
end

l_fila=size(Image);
l_fila=l_fila(1);

for i=1:256
    columna=257-i;
    if Image(:,columna)==zeros(l_fila,1)
        Image(:,columna)=[];
    end
end


Image=imresize(Image,[16 8]);


Input_NN=bin2dec(num2str(Image));

Input_NN=Input_NN'./255;


end

