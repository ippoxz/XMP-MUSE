function U = euler_implicito_solo_oscillator(U,dt,n,A)
for i = 1:n
    U(:,i+1) = Oscillator_simplified(dt,A)\U(:,i);
end
function phi = Oscillator_simplified(dt,A)
phi = eye(2) - dt*A;
end 
end