clear variables;
close all;
clc;


%Question 1
format long
ValFinale = (pi^4)/90
Somme = 0;
n = 0;
while abs(ValFinale-Somme) > 0.000001;
  n += 1;
  Somme += 1/(n^4);
endwhile

disp(n)


%Question 2
NombreAlea03 = 3 * rand(1,1)

NombreAlea26 = 2 + (4 * rand(1,1))

a = 5
b = 10
MatAleaab = min(a,b) + ((max(a,b) - min(a,b)) * rand(5,7))
Max = max(max(MatAleaab))
Min = min(min(MatAleaab))

NombreEntierAlea010 = round(10 * rand(1,1))

m = 5
n = 10
VectEntierAeamn = min(m,n) + round((max(m,n) - min(m,n)) * rand(10,1))