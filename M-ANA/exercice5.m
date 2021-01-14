clear variables;
close all;
clc;

%% 1
D = 1;
N = 2^12;
dt = (D*2)/N;
t = -D:dt:D-dt;

%% 2 
T0 = [2^(-5), 2^(-6)];

for k=1:2
    figure(1)
    [p] = peigne(T0(k),t);
    subplot(2,2,1+(k-1)*2)
    plot(t,p)
    title(sprintf('peigne, %f',string(T0(k))))
    xlabel('temps (s)')
    [tfp, nu] = TransFourier(p,t);
    subplot(2,2,k*2)
    plot(nu,tfp)
    title(sprintf('tf peigne, %f',string(T0(k))))
    xlabel('fréquence (Hz)')
end

%% 3
nu0 = 5;
s = exp(-pi * t.^2) .* cos(2*pi*nu0.*t);
z = s.* peigne(T0(2),t);
[tfs, nu1] = TransFourier(s,t);
[tfz, nu2] = TransFourier(z,t);
tfz = tfz/max(tfz*2);   %QUAND ON FAIT UN PRODUIT DE CONVOLUTION SUR MATLAB IL FAUT DIVISER PAR LE MAX
figure(2);
subplot(3,1,1);
hold on;
plot(t,s,'k');
plot(t,z,'.r');
title('Echantillonnage')
legend('s(t)','z(t)')
xlabel('temps (s)')
subplot(3,1,2);
plot(nu1,tfs,'k');
axis([-50, 50, 0, 1])
title('TF(s(t))')
xlabel('fréquence (Hz)')
subplot(3,1,3);
plot(nu2, tfz, 'r')
axis([-500, 500, 0, 1])
title('TF(z(t))')
xlabel('fréquence (Hz)')