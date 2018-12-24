function [U,time] = Cauchy_Problem(U_0, F, temporal_scheme, time_domain, t, n)

U = U_0;
time = time_domain(t, n);

for i = 1:n

U_i = U(:,i);
dt = time(i+1)-time(i);
U(:,i+1) = temporal_scheme(U_i, F, dt, time(i)); 

end

end