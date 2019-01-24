%--------------------Tecnicas de continuacion----------------------------%

f = @(x)(x-3);
dfdx = @(x)(exp(x) + x*exp(x)); 

g = @(x)(x-tanh(x)+exp(x));
dgdx = @(x)(tanh(x)^2+exp(x));

x_0 = 3; %Semilla inicial de la funcion f conocida
n = 100;
l = linspace(0,1,n);

p = 100; %iteraciones para el Newton Raphson
for i = 1:n

H = @(x)((1-l(i))*f(x) + l(i)*g(x));
dHdx = @(x)((1-l(i))*dfdx(x) + l(i)*dgdx(x));

raiz = NewtonRaphson(H, dHdx, x_0, p);
x_0 = raiz;

end
