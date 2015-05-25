function [Ix, Iy] = ImageDerivatives(I)
%% ex3 q1
%  Returns the derivatives of I across the X and Y dimensions 

    if (nargin ~= 1)
        error('Please give 1 image as input');
    end

    % The Kernels
    Kx = [0.5 -0.5];
    Ky = [-0.5; 0.5];    

    % Compute x derivation
    Ix = conv2(I, Kx, 'full');
    Ix = putZeros(Ix(:, 1:(end-1)));    

    % Compute y derivation
    Iy = conv2(I, Ky, 'full');
    Iy = putZeros(Iy(1:end-1, :));

end

function [X] = putZeros(X)
% Puts zeros in the first and last rows and columns of the given matrix.
    X(1,:) = 0;
    X(end,:) = 0;
    X(:,1) = 0;
    X(:,end) = 0;
end
