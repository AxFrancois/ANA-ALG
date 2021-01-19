clear variables;
close all;
clc;

%Ex 1
%a)
n=5;
ligne = 1:1:n;
M = ligne;
for i = 1:1:(n-1);
  ligne = ligne + n;
  M = [M;ligne];
endfor

M

%b)
n=5;
colonne = (1:n:n*n)';
N=colonne;
for i = 1:1:n-1;
  colonne = colonne + 1;
  N = [N,colonne];
endfor

N

%Ex 2
%Valeur des ?, de haut en bas : 
%2(n-2)-1
%2(n-1)
%2n
n=5;
A1 = diag(2:2:2*n);
A2 = [[linspace(0,0,n-2);linspace(0,0,n-2);diag(linspace(-2,-2,n-2))],linspace(0,0,n)',linspace(0,0,n)'];
A3 = [linspace(0,0,n)',linspace(0,0,n)',[diag(linspace(1,2*n-5,n-2));linspace(0,0,n-2);linspace(0,0,n-2)]];

A = A1 + A2 + A3