function x = NewtonRaphson_tol(f,dfdx,x_0,tol)
error = Inf;
x = x_0;
while abs(error) > tol
   xPrev = x;
   x = xPrev - f(xPrev)/dfdx(xPrev);
   error = f(x);
end