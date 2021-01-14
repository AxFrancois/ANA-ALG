clear variables;
close all;
clc

A=[1,-1,2,5;1,1,4,5;2,0,6,10]

[m,n] = size(A)
[u,s,v] = svd(A)%SVD de A
r = rank(A); %rang de A
Im_A = u(:,1:r)
Ker_A = v(:,r+1:n)

%Resultats en trouvés en TD
Im_A_TD = [[1;1;2],[-1;1;0]];
Ker_A_TD = [[5;0;0;-1],[3;1;-1;0]];

%Verification
rank([Im_A,Im_A_TD])-r
rank([Ker_A,Ker_A_TD])-(n-r)