clear variables;
close all;
clc;

A=[1,-2,3,1;2,5,-1,3;4,1,0,2;0,-2,3,1];

disp(A(:,3));
disp(A(4,:));

A(:,3)=[1,1,1,1];
disp(A);

d=det(A);
t=trace(A);
disp(d);
disp(t);

b=[1;2;-1;3];
X = linsolve(A,b);
disp(X)

B=[A(:,2),A(:,3)];
disp(B)
C=[A(1,:);A(3,:)];
disp(C)
D=[A(:,2),A(:,3),A(:,4)];
D=[D(2,:);D(3,:);D(4,:)];
disp(D)

M=C*C';
[Passage,Diago]=eig(M);
disp(Passage);
disp(Diago);
if dot(Passage(:,1),Passage(:,2)) == 0
    disp("La matrice de passage est orthgonale")
end