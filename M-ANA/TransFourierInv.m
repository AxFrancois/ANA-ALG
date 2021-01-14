function [s,t] = TransFourierInv(S,f)

% [S,f] = TransFourierInv(s,t)
% Transformee de Fourier inverse d'un signal S. 
% Input: 
% - S : vecteur de taille N contenant les coefficients de la transform?e de
% Fourier S
% - f : vecteur de taille N contenant les fr?quences correspondant aux
% coefficients de S : S[n] = S(f[n]). Le vecteur ''f'' doit etre symetrique
% autour de f=0: f = [-fmax -fmax+df ... 0 ... fmax-df] 
% Outputs:
% - s: vecteur de taille N contenant les N ?chantillons s[n] de la
% transformee de Fourier inverse de S
% - t: vecteur de taille N contenant les instants d'echantillonnage de s.
% s[n] = s(t[n]).

% PG: 2017

M = length(S) ;

switch nargin
    case 1
        f  = -M/2:M/2-1 ; 
end

if M ~= length(f)
    error('Les vecteurs "S" et "f" doivent etre de meme longueur');
end
if std(diff(f)) > 1000*eps
    error('Le vecteur ''f'' doit etre lineairement croissant et a pas constant');
end

df = f(2)-f(1) ; 
Fe = 2*abs(min(f)) ;

if f(1) + (f(end)+df) > 1000*eps 
    error('Le vecteur ''f'' doit etre symetrique autour de f=0');
end


Sshift = [S(f>=0) S(f<0)] ;
Sshift = Sshift.*Fe ;

N = M ;
s = ifft(Sshift,N) ; 
s = fftshift(s) ;
t = (-N/2:N/2-1)./Fe ; 

