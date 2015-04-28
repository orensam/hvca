%% ex2 q6
% TestGausSpot plots the estimation error between the true velocity and the
% velocities calcuated by our algorithm of pairs of Gaussian spots.

x_axis = -100:0.5:100;

for g_size = [1, 10]     % For each sigma: 1, 10
    err = [];

    % Set "base" Gaussian
    g_base = GausSpot(128, g_size, [0 0]);

    for x = x_axis    % For each velocity

        % Set Gaussian after movement and calculate its velocity and error
        g_moved = GausSpot(128, g_size, [x 0]);
        v = Full_LK_alg(g_base, g_moved, 0, ones(128), 1);
        err = [err abs(v(1) - x)];
    end

    % Draw plots (sigma 1 in blue and sigma 10 in red)
    if g_size == 1
        plot(x_axis , err , 'b');
    else
        hold on
        plot(x_axis , err , 'r');
    end
end

% Label axis
xlabel('True Velocity');
ylabel('Estimation Error');
legend('sigma = 1','sigma = 10');
