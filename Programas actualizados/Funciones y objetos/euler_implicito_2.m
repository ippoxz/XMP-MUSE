function U = euler_implicito_2(U,dt,n,A)
for i = 1:n-1
    U(:,i+1) = Oscillator_simplified(dt,A)\U(:,i);
end
end