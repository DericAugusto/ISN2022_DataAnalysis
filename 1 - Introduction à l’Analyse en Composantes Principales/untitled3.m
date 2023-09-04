t = (0:499)';          % vecteur du temp

u1 = com(t);           % creant une variable avec la function crée
u2 = com(t);

e1 = randn(size(t));   % bruit numéro 1 
e2 = randn(size(t));   % bruit numéro 2 
e3 = randn(size(t));   % bruit numéro 3
e4 = randn(size(t));   % bruit numéro 4 
e5 = randn(size(t));   % bruit numéro 5
e6 = randn(size(t));   % bruit numéro 6 
e7 = randn(size(t));   % bruit numéro 7 

x1 = u1 + e1;          % sinal avec bruit 
x2 = u1 + e2;
x3 = u1 + e3;
x4 = u1 + e4;
x5 = u2 + e5;
x6 = 3*u1 + 2*u2 + e6;
x7 = 2*u1 + u2 + e7;

subplot(3,3,1); plot(t,u1); title(u1)
subplot(3,3,2); plot(t,u2); title(u2)
subplot(3,3,3); plot(t,x1); title(x1)
subplot(3,3,4); plot(t,x2); title(x2)
subplot(3,3,5); plot(t,x3); title(x3)
subplot(3,3,6); plot(t,x4); title(x4)
subplot(3,3,7); plot(t,x5); title(x5)
subplot(3,3,8); plot(t,x6); title(x6)
subplot(3,3,9); plot(t,x7); title(x7)