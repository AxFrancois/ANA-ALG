clear variables;
close all;
clc;
i=complex(0,1);

hold on;

tmin=-5;
tmax=5;
pas=0.01;
t=tmin:pas:tmax;


n=length(t);
f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n);
figure(1);
plot(t,f);

%% 1

largeur = [0.5,0.75,1,2];
figure(2);
for k = 1:1:4
    subplot(2,2,k)
    plot(t,conv(f,porte(t/largeur(k)), 'same'))
    title(largeur(k))
end


%% 2

figure(3);
nu_min=-10;
nu_max=10;
nu_step=0.1;
nu=nu_min:nu_step:nu_max;

% calcul de la transformée de Fourier (calcul approché)
tf_approxFCTN=zeros(1,length(nu)); % initialisation (commande zeros)
tf_approxPORTE=zeros(1,length(nu)); % initialisation (commande zeros)

for k=1:length(nu)
    tf_approxFCTN(k)=trapz(t, f .* exp(-2*i*pi*nu(k)*t));% (commande trapz)
    tf_approxPORTE(k)=trapz(t, porte(t) .* exp(-2*i*pi*nu(k)*t));% (commande trapz)
end

subplot(2,2,1)
plot(nu,abs(tf_approxFCTN))
subplot(2,2,2)
plot(nu,abs(tf_approxPORTE))

Produit = tf_approxFCTN .* tf_approxPORTE;

subplot(2,2,3)
plot(nu,abs(Produit))

TF_Inverse_Produit = zeros(1,length(t));
for k=1:length(t)
    TF_Inverse_Produit(k) = trapz(nu, Produit .* exp(2*i*pi*nu*t(k)));
end

subplot(2,2,4)
plot(t,abs(TF_Inverse_Produit))


%A généraliser avec les 3 autres trucs mais ça fonctionne !


%{
figure(3);
nu_min=-100;
nu_max=100;
nu_step=0.1;
nu=nu_min:nu_step:nu_max;
tf_approx=zeros(1,length(nu)); % initialisation (commande zeros)
tf_Produit = zeros(length(largeur),length(nu));
for k=1:length(nu)
    tf_approx(k)=trapz(t, f .* exp(-2*i*pi*nu(k)*t));% (commande trapz)
    for j= 1:1:4
        tf_Produit(j,k) = tf_approx(k)*trapz(t, porte(t/largeur(j)) .* exp(-2*i*pi*nu(k)*t));
    end

end
%{
for k = 1:1:4
    subplot(2,2,k)
    plot(nu,tf_Produit(k,:))
    title(largeur(k))
end
%}
TF_Inverse_Produit = zeros(length(largeur),length(t));
for k=1:length(t)
    for j= 1:1:4
        TF_Inverse_Produit(j,k) = abs(trapz(nu, tf_Produit(j,k) * exp(2*i*pi*nu*t(k))));
    end
end

 
for k = 1:1:4
    subplot(2,2,k)
    plot(t,TF_Inverse_Produit(k,:))
    title(largeur(k))
end
%}