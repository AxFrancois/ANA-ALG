clear variables;
close all;
clc
%% question 1
%{
x=-5:1:5;
y=x;
figure(1);
a=4;b=9;c=0;d=0;e=0;f=-36;
h=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h,'color','k');
%}
%% question 2
choice = input('Numéro Astéroïde')

switch choice
    case 1 
        xi = [-1.2500, -1.1000, -0.9320, -0.7460, -0.5420, -0.3200, -0.0740, 0.1940, 0.4900, 0.7860];    
        yi = [3.1780, 3.0460, 2.9300, 2.8340, 2.7540, 2.6960, 2.6580, 2.6420, 2.6540, 2.6980];
    case 2 
        xi = [-2.5815, -2.0762, -1.3565, -0.5279, 1.0265, 2.7484, 3.5944, 4.6929]   
        yi = [0.0847, 0.3172, 0.6058, 0.9590, 1.2828, 0.8756, 0.5226, 0.1792]
end
n = length(xi)
A = [xi'.^2,xi'.*yi',xi',yi',ones(n,1)]
B = yi'.^2
z = inv(A'*A)* A'*B
h=ezplot(@(x,y)myfun(x,y,z(1),-1,z(2),z(3),z(4),z(5)));
hold on
set(h,'color','k');
for i = 1:1:n
    plot(xi(i),yi(i),'r*')
end