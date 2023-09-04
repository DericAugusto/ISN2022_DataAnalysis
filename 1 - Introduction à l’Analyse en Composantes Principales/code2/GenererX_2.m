function [t,X] = GenererX_2()

t=linspace(0,1000,100);
u1=com(t);
u2=com(t);


x1 = u1 + 2*(1/4)*randn(size(u1));
x2=u2+2*(1/2)*randn(size(u1));
x3=u2.^2+2*(1/8)*randn(size(u1));
x4=u1+6*u2+2*(1/4)*randn(size(u2));
x5=5*u1.^2+2*(1/2)*randn(size(u2));
x6=2*u1+3*u2+2*(2)*randn(size(u2));
x7=u1.^2+u2+2*(1)*randn(size(u2));

X = [x1,x2,x3,x4,x5,x6,x7];


end