function [] = NN3L_InitWeights(N1,N2,N3)

u2=rand(N2,1);
u3=rand(N3,1);

w1i2=rand(N1,N2);
w2i3=rand(N2,N3);

save('InitWeights.mat','N1','N2','N3','u2','u3','w1i2','w2i3');

end

