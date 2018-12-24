function F = N_Bodies(U,m,G)

N = length(U)/6;
r = reshape(U(1:3*N),[3 N]);
v = reshape(U(3*N+1:6*N),[3 N]);
dvdt = zeros(size(r));

for i = 1:N
    ai = zeros(3,1);
    for j = 1:N
        if i ~= j
        dij = r(:,j)-r(:,i);
        ai = ai + G*m(j)*dij/norm(dij)^3;
        end
    end
    dvdt(:,i) = ai;
end

F = [v(:); dvdt(:)];
end 


