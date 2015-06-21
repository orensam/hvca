function [Q] = findQ(M)
%% ex5 q1
% Given a 2Fx3 matrix M, finds the symmetric (3x3) matrix Q, 
% which satsifies M_k*Q*M_k=1 for every row k of M,
% and M_k*Q*M_(k+1) = 0 for every odd row k of M.
    
    F = size(M, 1) / 2;    
    
    H = zeros(3*F, 6);
    
    for k = 1:2*F
        H(k,:) = [M(k,1)^2, 2*M(k,1)*M(k,2), 2*M(k,1)*M(k,3), ...
                  M(k,2)^2, 2*M(k,2)*M(k,3), M(k,3)^2];
    end
    
    for k = 1:2:F
        Hrow = 2*F + (k+1)/2;
        H(Hrow, :) = [M(k,1)*M(k+1,1),                 ...
                      M(k,1)*M(k+1,2) + M(k,2)*M(k+1,1), ...
                      M(k,1)*M(k+1,3) + M(k,3)*M(k+1,1), ...
                      M(k,2)*M(k+1,2),                 ...
                      M(k,2)*M(k+1,3) + M(k,3)*M(k+1,2), ...
                      M(k,3)*M(k+1,3)];     
    end
    
    b = [ones(2*F, 1); zeros(F, 1)];
    Q = H\b;
    Q = [Q(1:3)'; Q(2), Q(4), Q(5); Q(3), Q(5), Q(6)];

end
