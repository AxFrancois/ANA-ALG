clear variables;
close all;
clc;

%Q1
%Fonction 1
X1=linspace(0,1,1000);
Fnc1 = (X1+3) ./ sqrt(2*X1 +1);
disp(trapz(X1,Fnc1))
disp(3 * sqrt(3) - 8/3)

%Fonction 2
X2=linspace(0.000000001,100,10000);
Fnc2 = sin(X2).^4 ./ X2.^4;
disp(trapz(X2,Fnc2))
disp(pi/3)

%Q2
X=linspace(-4,4,8001);
porte1 = 3*porte(X+3);
porte2 = -1*porte(1/4 * X);
triangle1 = 3*triangle(X+2);
triangle2 = -1*triangle(2*X);
porte3 = porte(X-2);
triangle3 = 2*triangle(2*(X-2));
Fnc3 = porte3 + triangle3;


subplot(3,1,1);
hold on;
plot(X,porte1,'color',[1,0,0],'linewidth',2);
plot(X,porte2,'color',[0,0,1],'linewidth',2);
axis([-4,4,-2,4]);
xticks([-4 -3 -2 -1 0 1 2 3 4])
grid on
xlabel('x');
title('Fonctions portes');
legend('porte 1','porte 2');

subplot(3,1,2);
hold on;
plot(X,triangle1,'color',[1,0,0],'linewidth',2);
plot(X,triangle2,'color',[0,0,1],'linewidth',2);
axis([-4,4,-2,4]);
xticks([-4 -3 -2 -1 0 1 2 3 4])
grid on
xlabel('x');
title('Fonctions triangles');
legend('triangle 1','triangle 2');

subplot(3,1,3);
plot(X,Fnc3,'color',[1,0,1],'linewidth',2)
axis([-4,4,-2,4]);
xticks([-4 -3 -2 -1 0 1 2 3 4])
grid on
xlabel('x');
title('Autre fonction');