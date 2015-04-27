function [v] = Full_LK_alg(I1, I2, lambda, mask, num_iterations)
%% ex2 q4
%  Returns the estimated velocity.

    if (nargin ~= 5)
        error('Please give 5 arguments');
    end

    % Blur and dowssample
    tmpI1 = blur_dowsample(I1);
    tmpI2 = blur_dowsample(I2);

    % Get v_blurred (single iteration, [0 0] as initial guess and 
    %  corresponding mask size).
    tmpMask = mask(1:2:end,1:2:end);
    v_blurred = LK_alg(tmpI1, tmpI2, lambda, tmpMask, [0 0], 1);

    % Run LK
    v = LK_alg(I1, I2, lambda, mask, 2*v_blurred, num_iterations);

end