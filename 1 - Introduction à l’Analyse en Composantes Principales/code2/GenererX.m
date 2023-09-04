function [t,X] = GenererX()

t=linspace(0,1000,100);
u1=com(t);
u2=com(t);


x1=u1+2*(1/4)*randn(size(u1));
x2=u1+2*(1/2)*randn(size(u1));
x3=u1+2*(1/8)*randn(size(u1));
x4=u2+2*(1/4)*randn(size(u2));
x5=u2+2*(1/2)*randn(size(u2));
x6=3*u1+2*u2+2*(2)*randn(size(u2));
x7=2*u1+u2+2*(1)*randn(size(u2));

X = [x1,x2,x3,x4,x5,x6,x7];


end