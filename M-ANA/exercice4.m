clear variables;
close all;
clc;

%% Partie A
%% 1
D = 4;
N = 2^16;
dt = (D*2)/N;
t = -D:dt:D-dt;
%% 2
sigma = 2.^[-1:-2:-7]; %Contient [1/2, 1/2^3, 1/2^5, 1/2^7]

%% 3
for k=1:4
    g = 1/(sigma(k) * sqrt(2*pi)) * exp(-t.^2/(2*sigma(k)^2));
    figure(1);
    subplot(2,2,k);
    plot(t,g);
    xlabel('temps (s)')
    %TF de g
    [tfg, nu] = TransFourier(g,t);
    figure(2);
    subplot(2,2,k);
    plot(nu, tfg)
    xlabel('fréquence (Hz)')
    axis([-100, 100, 0, 1])
end

%% Partie B
%% 1
nu0 = 5;
s = exp(-pi * t.^2) .* cos(2*pi*nu0.*t);
[tfs, nu] = TransFourier(s,t);
figure(3)
subplot(1,2,1)
plot(t,s)
xlabel('temps (s)')
subplot(1,2,2)
plot(nu, tfs)
xlabel('fréquence (Hz)')
axis([-15, 15, 0, 0.6])

%% 2
color = [[1,0,1]; [1,0,0]; [0,1,0]; [0,0,1]];
for k=1:4
    g = 1/(sigma(k) * sqrt(2*pi)) * exp(-t.^2/(2*sigma(k)^2));
    y = conv(s,g,'same');
    y = y/max(y);   %QUAND ON FAIT UN PRODUIT DE CONVOLUTION SUR MATLAB IL FAUT DIVISER PAR LE MAX
    figure(4);
    subplot(4,1,k);
    hold on
    plot(t,s, 'k')
    plot(t,y, 'color', color(k,:))
    text = sprintf('ysigma(t), sigma = %f',sigma(k));
    legend('s(t)',text)
    xlabel('temps (s)')
end