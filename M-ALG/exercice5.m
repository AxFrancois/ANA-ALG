clear variables;
close all;
clc

%% a

theta=0:0.1:2*pi;
x=cos(theta);
y=sin(theta);
subplot(121);hold on;
for k=1:length(theta)
    plot(x(k),y(k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end
title('cercle unité');
xlabel('x');
ylabel('y');
axis('equal');
axis([-1.5,1.5,-1.5,1.5]);

%% b
A = [3,-1;1,3;1,1];
[u,s,v] = svd(A); %SVD de A

plot([0,v(1,1)],[0,v(1,2)], 'color','r', 'linewidth',2)
plot([0,v(2,1)],[0,v(2,2)], 'color','r', 'linewidth',2)

%% c

subplot(122);hold on;
for k=1:length(theta)
    X = [x(k);y(k)];
    Y = A* X;
    plot3(Y(1),Y(2),Y(3),'marker','.','color',[k/length(theta),0,k/length(theta)]);
    grid on
    title('cercle unité');
    xlabel('x');
    ylabel('y');
    zlabel('z')
end
%% d
plot3([0,s(1,1) * u(1,1)],[0,s(1,1) * u(2,1)],[0,s(1,1) * u(3,1)], 'color','g', 'linewidth',2)
plot3([0,s(1,1) * u(1,2)],[0,s(1,1) * u(2,2)],[0,s(1,1) * u(3,2)], 'color','g', 'linewidth',2)
%permuté parce que plus beau
plot3([0,u(1,1)],[0,u(2,1)],[0,u(3,1)], 'color','b', 'linewidth',2)
plot3([0,u(1,2)],[0,u(2,2)],[0,u(3,2)], 'color','b', 'linewidth',2)