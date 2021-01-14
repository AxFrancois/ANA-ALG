function [p] = peigne(T0,t) 

% [p] = peigne(T0,t) 
% Genere un peigne de Dirac de periode T0 en fonction du vecteur temps 't'.
% 
% PG : 2017

dt = t(2)-t(1) ; 
N = length(t) ;
D = (max(t)-min(t) + dt)/2 ;
M = floor(D/T0) ;
p = zeros(1,N) ;
IndiceOne = ([-M:M-1]*T0)./dt + N/2 + 1; 
p(IndiceOne) = ones(size(IndiceOne)) ;
