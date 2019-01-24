function x = NewtonRaphson(f,dfdx,x_0,n)
x = x_0;
for i = 1:n
   xPrev = x;
   x = xPrev - f(xPrev)/dfdx(xPrev);
end