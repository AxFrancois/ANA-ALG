clear all;
close all;
clc;
i=complex(0,1);

%% a
A=imread('barbara.jpg');
[a,b]=size(A);
figure(1);
subplot(3,2,1);
imagesc(A);
axis equal
colormap gray

%% b
TF_A = fftshift(fft2(A,a,b));
TF_A_int = uint8(log10(abs(TF_A)));
subplot(3,2,2);
imagesc(TF_A_int);
axis equal


%% c
%ma méthode à moi d'amour
%{
New_TF=TF_A_real;
seuil = 0 + 0i;
for i=1:a
    for j=1:b
        if abs(250 - i) > 50 || abs(250 -j) > 100
            New_TF(i,j) = seuil;
        end
    end
end

subplot(2,2,3);
New_TF_int = uint8(log10(abs(New_TF)));
imagesc(New_TF_int);
axis equal


Im2 = uint8(abs(ifft2(New_TF)));
subplot(2,2,4);
imagesc(Im2);
axis equal
%}

%%Methode prof

J = TF_A;
da = 0.25;
db = 0.3;
i = floor(da*a):floor((1-da)*a);
j = floor(db*b):floor((1-db)*b); %tous les pixels de la zone centrale
C = TF_A(i,j);
%supression de pics
seuil = 2000; %regardez les valeurs de max et min de TF_A
ind = abs(TF_A) > seuil; %matrice binaire (s'inspirer de la fonction porte), ind est une matrice axb qui contient des 0 (la condition n'est pas vérifiée) et des 1 (la condi est vérifié)
J(ind) = 0;
J(i,j) = C;

subplot(3,2,3);
imagesc(uint8(log10(abs(J))));
axis equal

Im2 = uint8(abs(ifft2(J)));
subplot(3,2,4);
imagesc(Im2);
axis equal

%% Bonus
J2 = TF_A;
da = 0.25;
db = 0.25;
i = floor(da*a):floor((1-da)*a);
j = floor(db*b):floor((1-db)*b); %tous les pixels de la zone centrale
B = TF_A(i,j);
%supression de pics
seuil = 40000; %regardez les valeurs de max et min de TF_A
ind2 = abs(B) > seuil; %matrice binaire (s'inspirer de la fonction porte), ind est une matrice axb qui contient des 0 (la condition n'est pas vérifiée) et des 1 (la condi est vérifié)
B(ind2) = 0;
J2(i,j) = B;


subplot(3,2,5);
imagesc(uint8(log10(abs(J2))));
axis equal

Im2 = uint8(abs(ifft2(J2)));
subplot(3,2,6);
imagesc(Im2);
axis equal