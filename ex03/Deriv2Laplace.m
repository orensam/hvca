function [L] = Deriv2Laplace(Ix, Iy)
%% ex3 q2
% Receives the X and Y derivatives of and image, and returns its laplacian.
    Kx = .5 .* [1 -1];
    Ky = .5 .* [-1; 1];
    L = conv2(Ix, Kx, 'same') + conv2(Iy, Ky, 'same');

end
