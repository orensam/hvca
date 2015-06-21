function [A] = findA(Q)
%% ex5 q1
% Given a symmetric matrix Q, returns a matrix A
% which satisfies A^k = Q.

    [U, Sigma, V] = svd(Q);
    Sigma(Sigma<0) = 0;
    A = U * sqrt(Sigma) * V';

end
