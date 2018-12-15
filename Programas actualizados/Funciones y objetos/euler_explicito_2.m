function U = euler_explicito_2(U,dt,n)
for i = 1:n-1  
    U(:,i+1) = U(:,i) + dt*Oscillator(U(:,i)); 
end
end