clear variables;
close all;
clc;
%% 1

figure(1);
hold on;
a=2;
b=-5;
c=1;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2));     % red
C(:,:,2)=0.8*ones(size(Z2));  % green
C(:,:,3)=0.8*ones(size(Z2));  % blue
mesh(X2,Y2,Z2,C);

%% 2

n=10;
x= -2 + 4*rand(1,n);
y= -2 + 4*rand(1,n);
z= -8 + 14*rand(1,n);

plot3(x,y,z,'.b');
view(-60,60); axis('equal')

%% 3

N = [a;b;c];  %vecteur (colonne) normal au plan
N = 1/norm(N) .* N; %normalisation
P = eye(3) - N * N'; % matrice de projection

U = [x;y;z]; %matrice 3xn contenant les coords des points Pi
V=zeros(3,n); %init de la matrice 3xn contenant les coord des points Qi

for k = 1:1:n
    V(:,k) = P * U(:,k);
end

plot3(V(1,:),V(2,:),V(3,:),'.r');

for k = 1:1:n
    plot3([x(k) V(1,k)], [y(k) V(2,k)], [z(k) V(3,k)], 'Color','k')
end

%% 4
delta = 0.1;
R = V + (-delta/2 + delta * rand(3,n));

plot3(R(1,:),R(2,:),R(3,:),'.m');

%Calcul du plan passant au plus près des points Ri
A = [R(1,:)', R(2,:)'];
v = R(3,:)';
u = inv(A' * A) * A' * v %et c = -1

%Affichage du plan
a3=u(1);
b3=u(2);
c3=-1;
x3=-3:0.1:3;
y3=-2.5:0.1:4;
z3=-8:1:8;
[X3,Y3]=meshgrid(x3,y3);
Z3=-(a3*X3+b3*Y3)/c3;
C(:,:,1)=0.5*ones(size(Z3));     % red
C(:,:,2)=0.1*ones(size(Z3));  % green
C(:,:,3)=0.8*ones(size(Z3));  % blue
mesh(X3,Y3,Z3, C);

%angle
N2 = [a3;b3;c3];  %vecteur (colonne) normal au plan 2
N2 = N2/norm(N2); %normalisation;
theta = acos(N'*N2);
if theta > pi/2
    theta = pi-theta;
end
theta = theta * 180/pi