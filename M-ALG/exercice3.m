clear variables;
close all;
clc

%Construction A
n = 6;
A1 = [[zeros(n-1,1),-diag(ones(1,n-1))];zeros(1,n)];
A = 2 * diag(ones(1,n)) + A1 + A1';

choice = input('1:première VP, 2 : toutes')

switch choice
    case 1 
        eps=1e-6; %précision
        %Initialisation
        lambda0 = 1; %val propre initial
        e0 = rand(n,1)    ; %vecteur propre initial
        delta = 1; %diff entre 2 val propres consécutives
        lambda_array = [lambda0]; %stockage des valeurs de la val propre
        while delta > eps
            e1 = A * e0;
            lambda = norm(e1)/norm(e0);
            delta = abs(lambda - lambda0);
            lambda_array = [lambda_array, lambda];
            lambda0 = lambda
            e0 = e1/norm(e1);
        end
        lambda_array(end)
        plot(1:1:length(lambda_array),lambda_array)
    case 2 
        D = zeros(n,n); %matrice diagonale
        P = zeros(n,n); %matrice passage
        B = A;
        for k=1:n
            if k>1
                B = B - (D(k-1,k-1)/(e0'*e0)) * (e0*e0');
            end
            
            eps=1e-6; %précision
            %Initialisation
            lambda0 = 1; %val propre initial
            e0 = rand(n,1)    ; %vecteur propre initial
            delta = 1; %diff entre 2 val propres consécutives
            while delta > eps
                e1 = B * e0;
                lambda = norm(e1)/norm(e0);
                delta = abs(lambda - lambda0);
                lambda0 = lambda;
                e0 = e1/norm(e1);
            end
            D(k,k) = lambda0;
            P(:,k) = e0;
        end
        P
        D
        A2 = P * D * inv(P)
        %Vérification
        NormA = norm(A)
        NormAMoinsA2 = norm(A-A2)
end


