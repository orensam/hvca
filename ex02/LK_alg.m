function [v] = LK_alg(I1, I2, lambda, mask, v_initial, num_iterations)
%% ex2 q2
%  Lucas Kanade iterative algorithm.
%  Returns the velocity vector of the difference between I1 and I2

    if (nargin ~= 6)
        error('Please give 6 arguments');
    end

    v_prev = v_initial; % Initial guess

    for i = 1:num_iterations

        % Compute I2w (a warpped version of I2)
        [I2w, warpMask] = warp(I2, v_prev);

        % Get derivatives of I1 and I2w in the boundries of the mask (after
        % taking the warpping into acount)
        curr_mask = warpMask .* mask;
        [Ix, Iy, It] = ImageDerivatives(I1, I2w);
        Ix = Ix .* curr_mask;
        Iy = Iy .* curr_mask;
        It = It .* curr_mask;

        % Calculate A
        A11 = sum(sum(Ix.^2));
        A22 = sum(sum(Iy.^2));
        IxIy = sum(sum( Ix .* Iy ));    % A12 A21
        A = [A11+lambda IxIy ;
             IxIy       A22+lambda];

        % Calculate B
        B = -( [ sum(sum(Ix .* It)) ; sum(sum(Iy .* It)) ] );

        % Calculage v_prev
        v_prev = v_prev + ( (inv(A) * B)' );
    end

    % Upon finishing all iterations, return the last computed v
    v = v_prev;
    
end