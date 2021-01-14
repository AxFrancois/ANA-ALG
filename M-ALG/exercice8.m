clear variables;
close all;
clc;

% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5;  % abscisses
    0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées  
[m,n]=size(F0);

% dimension du cadre d'affichage
L=200; 
cadre=[-L,L,-L,L];

% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

question=3;
switch question
    case 1
        %translation
        u = [-80; 60];
        F1 = [F0(1,:) + u(1) ; F0(2,:) + u(2)];
        color = [1,0,0];
        fill(F1(1,:),F1(2,:),color);
        
        %symetrie
        N = [sqrt(2)/2, sqrt(2)/2]';
        S = 2 * N * N' - eye(2);
        F2 = S* F1;
        color = [0,1,0]; %vert
        fill(F2(1,:), F2(2,:),color);
        x = [-L, L];
        y = x; %équ de la droite
        plot(x,y,'g--')
        
        %Rotation
        theta = -2*pi/3;
        R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
        F3 = R * F2;
        color = [0,0,1]; %bleu
        fill(F3(1,:), F3(2,:),color)
        
        t=0:0.01:2*pi;
        G2 = [mean(F2(1,:)), mean(F2(2,:))]; %centre de la feuille
        r = norm([0-G2(1), 0 - G2(2)]);
        plot(r*cos(t), r*sin(t),'b--')
        
    case 2
        %translation
        u = [-80; 60];
        F1 = [F0(1,:) + u(1) ; F0(2,:) + u(2)];
        color = [1,0,0];
        fill(F1(1,:),F1(2,:),color);
        
    	N = 30;
        for i = 1:1:N
            u = rand(2,1);
            u = u/norm(u);
            S = 2 * u * u' - eye(2)
            F2 = S* F1;
            color = rand(1,3); 
            fill(F2(1,:), F2(2,:),color);
        end
        
    case 3
        %translation
        u = [-80; 60];
        F1 = [F0(1,:) + u(1) ; F0(2,:) + u(2)];
        color = [1,0,0];
        fill(F1(1,:),F1(2,:),color);
        
        %Tapis
        N=300;
        for i = 1:1:N
            %Rotation
            angle = 2*pi*rand(1);
            R = [cos(angle), -sin(angle); sin(angle), cos(angle)];
            F2 = R * F1;
            %translation
            u = 2*L *([-0.5, -0.5] + rand(1,2));
            F3 = [F2(1,:) + u(1) ; F2(2,:) + u(2)];
            color = [rand(1),rand(1),0];
            fill(F3(1,:),F3(2,:),color);
        end
end