function [M, S] = TomasiKanade(W)
%% ex5 q1
% Given a matrix W, and returns the decomposition matrices M, S

    [U, Sigma, V] = svd(W);
    
    Mh = U(:,1:3); % Take Mh only up to rank of W (3)
    Sh = Sigma(1:3, 1:3) * V(:,1:3)'; % Same for Sigma and V
    
    Q = findQ(Mh);
    A = findA(Q);
    
    M = Mh * A;
    S = inv(A) * Sh;
    
end
