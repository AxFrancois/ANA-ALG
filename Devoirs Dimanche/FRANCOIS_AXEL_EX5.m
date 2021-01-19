clear variables;
close all;
clc;



%Ex1
t= linspace(-10,10,2001);

f1 = cos(t);
f2 = sin(t);
t2 = t(1:40:end);
f3 = (2*(t2.^2) - 6*t2 + 3).*exp((-t2.^2) /8);

subplot(3,1,1);
hold on;
plot(t,f1, 'color',[0,1,0]);
plot(t,f2, 'color',[0,0,1], '--');
legend('cos(t)','sin(t)');
ylim([-2, 3]);
xticks([-10 -8 -6 -4 -2 0 2 4 6 8 10]);
grid on;
xlabel('t');
title('Fonctions sinus et cosinus');

subplot(3,1,2);
plot(t2,f3,'  .bd','markerfacecolor','b');
xlabel('t');
ylabel('f(t)');
ylim([-5, 15]);
xticks([-10 -8 -6 -4 -2 0 2 4 6 8 10]);
title('Représentation graphique de f(t)=(2t^2-6t+3)e^{-t^2/8}');

%Ex2
f4 = cos(10*t).*sin(t);
f5 = -sin(t);
subplot(3,1,3);
hold on;
plot(t,f4, 'color',[1,0 ,0]);
plot(t,f2, 'color',[0,0,0]);
plot(t,f5, 'color',[0,0,0]);
xlabel('t');
ylabel('f(t)');
title('Représentation graphique de f(t)=cos(10t)sin(t)');
text(-4.5,1.5,'Un signal (en rouge) et son enveloppe (en noir)');
ylim([-3/2 3/2]);
xticks([-10 -8 -6 -4 -2 0 2 4 6 8 10]);