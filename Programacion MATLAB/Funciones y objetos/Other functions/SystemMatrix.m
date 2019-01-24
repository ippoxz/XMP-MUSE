function A = SystemMatrix(Cauchy_Problem, F, U_0, eps, temporal_scheme, time_domain, t, n)

U = Cauchy_Problem(U_0, F, temporal_scheme, time_domain, t, n);
N = length(U_0);

F_0 = zeros(N, length(U));
for i = 1:length(U)
F_0(:,i) = F(U(:,i));
end

F_pert = zeros(N,length(F_0),N);
U_pert = zeros(N,length(F_0),N);

for i = 1:N
    U_i = U_0;
    U_i(i) = U_i(i) + eps;
    [U_pert(:,:,i),time] = Cauchy_Problem(U_i, F, temporal_scheme, time_domain, t, n);
    
    for j = 1:length(U_pert)
        F_pert(:,j,i) = F(U_pert(:,j,i),time);
    end
end

A_1 = (F_pert(:,:,1)-F_0)/eps;
A_2 = (F_pert(:,:,2)-F_0)/eps;

A = zeros(length(U_0),length(U_0),n+1);
for i = 1:n+1
    A(:,:,i) = [A_1(:,i) A_2(:,i)];
end
end