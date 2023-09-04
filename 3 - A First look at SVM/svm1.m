% Génération de X1 et X2
carreXC = [0 1 1 0];
carreYC = [0 0 1 1];
patch(carreXC, carreYC, 'c')
carreXm = [0.5 1.5 1.5 0.5];
carreYm = [1 1 2 2];
patch(carreXm,carreYm,'m');
xlim([0, 1.5]);
ylim([0, 2]);
legend({' X1',' X2'}, 'Location', 'northwest', 'FontSize', 8, 'FontWeight', 'bold')
xlabel('x')
ylabel('y')


% initialisation des variables aléatoires de X1 et X2

X1 = rand(10,2);
X2 = rand(10,2);
X2(:,1) = X2(:,1) + 0.5;
X2(:,2) = X2(:,2) + 1;

% Matrice X qui regroupe X1 et X2
X = ones(10,2);
X(1:10,1)=X1(:,1);
X(11:20,1)=X2(:,1);
X(1:10,2)=X1(:,2);
X(11:20,2)=X2(:,2);

% points aléatoires de X

figure(2)
plot(X(1:10,1),X(1:10,2), '+m', X(11:20,1), X(11:20,2), 'ob');
xlim([0 1.5]);
ylim([0, 2]);
legend({'  X1', '  X2'}, 'Location', 'northwest', 'FontSize', 8, 'FontWeight', 'bold')
xlabel('x')
ylabel('y')


% Matrices d'optimisation

N = 20; 
p=2; 
l = ones(20,1);
l(11:20, 1) = -1;
e = - (ones(1, N))';
A = - [diag(l)*X l];
H = [1 0 0 ; 0 1 0 ; 0 0 0];
f = (zeros(1, p+1))';

% Optimisation 
[z,fval,exitflag,output,lambda] = quadprog(H, f, A, e);
w = z(1:2,1);
b0 = z(3,1);


% séparatrice 
a = (w(1,1)/(-w(2,1)));
b=b0/(-w(2,1));
y0 = a*0 + b;
y1_5 = a*1.5 + b;
droiteX = [0 1.5];
droiteY = [y0 y1_5];

figure(3) 
plot(X(1:10,1), X(1:10,2), '+m', X(11:20,1), X(11:20,2), 'ob', droiteX, droiteY, 'k');
xlim([0, 1.5]);
ylim([0,2]);
legend({'  X1', '  X2', '  séparatrice'}, 'Location', 'northwest', 'FontSize', 8, 'FontWeight', 'bold')
xlabel('x')
ylabel('y')

%Vecteurs supports
vecteurSupport = find(lambda.ineqlin > 1e-3);
pointsSupports = X(vecteurSupport(:), :);

figure(4)
p1 = plot(X(1:10,1), X(1:10,2), '+m',  X(11:20,1), X(11:20,2), 'ob', droiteX, droiteY, 'k', pointsSupports(:,1), pointsSupports(:,2), 'or');
xlim([0, 1.5]);
ylim([0,2]);
p1(4).MarkerSize = 9;
legend({'  X1', '  X2', '  séparatrice', '  Vecteurs supports'}, 'Location', 'northwest', 'FontSize', 8, 'FontWeight', 'bold')
xlabel('x')
ylabel('y')

% Marges géométriques
distance = 1/abs(w(2));
droiteYsup = droiteY + 1/abs(w(2));
droiteYinf = droiteY - 1/abs(w(2));

figure(5)
p2 = plot(X(1:10,1), X(1:10,2), '+m',  X(11:20,1), X(11:20,2), 'ob', droiteX, droiteY, 'k', pointsSupports(:,1), pointsSupports(:,2), 'or', droiteX, droiteYsup, '--k', droiteX, droiteYinf, '--k');
xlim([0, 1.5]);
ylim([0,2]);
p2(6).MarkerSize = 9;
legend({'  X1', '  X2', '  séparatrice', '  Vecteurs supports', '  marge géometrique'}, 'Location', 'northwest', 'FontSize', 8, 'FontWeight', 'bold')
xlabel('x')
ylabel('y')
