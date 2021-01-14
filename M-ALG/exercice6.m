clear variables;
close all;
clc;

myFile = 'einstein.jpg';
A = imread(myFile); %convertir l'image en 3 matrices

figure(1);
imshow(A);

A = A(:,:,1); %on ne garde que la 1ère matrice
A = double(A); %convertir les entiers en réels

[m,n] = size(A);
[U,S,V] = svd(A);
i = 1:1:min(m,n);


figure(2);
plot(i,diag(S));

figure(3)
k_array = [5,40,100,200];
Ak = zeros(m,n);
output = [];
for i = 1:1:min(m,n)
    Ak = Ak + U(:,i) * S(i,i)* V(:,i)';
    if ismember(i,k_array)
        output = uint8(Ak);
        subplot(2,2,find(k_array==i));
        imshow(output)
        title(i);
        [x,y] = size(output);
        tau = 1 - i*(1+m+n) / (m*n)
    end
end
    