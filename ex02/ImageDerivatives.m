function [Ix, Iy, It] = ImageDerivatives(I1, I2)
%% ex2 q1
%  Returns the derivatives of the I1, I2 across the X dimension, 
%  the Y dimension, and time.

    if (nargin ~= 2)
        error('Please give 2 images as input');
    end

    % The Kernels
    Kx = .25 .* [1 -1 ; 1 -1];
    Ky = .25 .* [-1 -1 ; 1 1];
    Kt = .25 .* [1  1 ; 1  1];

    % Compute x derivation
    Ix = conv2(I1, Kx, 'same') + conv2(I2, Kx, 'same');

    % Compute y derivation
    Iy = conv2(I1, Ky, 'same') + conv2(I2, Ky, 'same');

    % Compute time derivation
    It = conv2(I2, Kt, 'same') - conv2(I1, Kt, 'same');

end