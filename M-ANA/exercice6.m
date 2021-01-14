clear all;
close all;
clc;

%% 1
n=300;
m=n;
M=zeros(n,m);
for p=floor(0.25*n):floor(0.75*n)
    for q=floor(0.35*m):floor(0.65*m)
        M(p,q)=1;
    end
end
TF_M_real = fftshift(abs(fft2(M,m,n)));
TF_M_int = uint8(TF_M_real);
figure(1)
subplot(1,2,1);
imshow(M);
subplot(1,2,2);
imshow(TF_M_int);

M2=zeros(n,m);
Milieu = [m/2, n/2];
Rayon = m/8;
for i=1:m
    for j=1:n
        if (j-Milieu(1))^2 + (i-Milieu(2))^2 < Rayon^2
            M2(i,j)=1;
        end
    end
end
TF_M_real = fftshift(abs(fft2(M2,m,n)));
TF_M_int = uint8(TF_M_real);
figure(2)
subplot(1,2,1);
imshow(M2);
subplot(1,2,2);
imshow(TF_M_int);

%% 2
%% a
clear all;
close all;
n=300;
m=n;
figure(1)
[x,y]=meshgrid(1:n,1:m);
M=cos(0.5*x+0.5*y);
subplot(1,2,1);
imshow(M);
TF_M_real = fftshift(abs(fft2(M,m,n)));
TF_M_int = uint8(TF_M_real);
subplot(1,2,2);
imshow(TF_M_int);
 
%% a
clear all;
close all;
n=300;
m=n;
figure(1)
[x,y]=meshgrid(1:n,1:m);
M=cos(0.5*x+0.5*y) + cos(0.5*x-0.5*y);
subplot(1,2,1);
imshow(M);
TF_M_real = fftshift(abs(fft2(M,m,n)));
TF_M_int = uint8(TF_M_real);
subplot(1,2,2);
imshow(TF_M_int);

%% b
clear all;
close all;
n=300;
m=n;
frequence1 = [0.35, 0.7, 1];
frequence2 = [0.2, 0.4, 0.8];
for k = 1:3
    figure(1)
    [x,y]=meshgrid(1:n,1:m);
    M=cos(frequence1(k)*x+frequence2(k)*y);
    subplot(2,3,k);
    imshow(M);
    TF_M_real = fftshift(abs(fft2(M,m,n)));
    TF_M_int = uint8(TF_M_real);
    subplot(2,3,k+3);
    imshow(TF_M_int);
end