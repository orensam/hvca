function [] = q7()
%% ex2 q7: Create veclocity vs contrast vs # iterations graph for thin and fat rhombi.
    drawRombusPlot(1);
    drawRombusPlot(0);
end

function [] = drawRombusPlot(fatFlag)
%% Creates the graph of veclocity vs contrast vs # iterations for specified rhombus.

    lambda = 0.01;
    conts = 0:0.02:1;

    figure;

    for num_iterations = [1, 3, 10, 100]    

        res_x = [];
        res_y = [];

        for cont = conts
            [rhomb1, rhomb2] = rhombusMovie(fatFlag, cont);        
            v = Full_LK_alg(rhomb1, rhomb2, lambda, ones(size(rhomb1)), num_iterations);
            res_x = [res_x v(1)];
            res_y = [res_y v(2)];        
        end

        if num_iterations == 1
            color = 'r';
        elseif num_iterations == 3
            color = 'g';
        elseif num_iterations == 10
            color = 'b';
        elseif num_iterations == 100
            color = 'k';
        end

        plot(conts, res_x, color, 'Marker', 's', 'MarkerSize', 2);
        hold on;
        plot(conts, res_y, color, 'Marker', 's', 'MarkerSize', 2);    
        
        % Label axis
        if fatFlag
            title('Velocity per Contrast per # Iterations: Fat Rhombus');
        else
            title('Velocity per Contrast per # Iterations: Thin Rhombus');
        end
        
        xlabel('Contrast');
        ylabel('Estimated Velocity');
         legend('v_x, 1 iteration', 'v_y, 1 iteration', ...
                'v_x, 3 iterations', 'v_y, 3 iterations', ...
                'v_x, 10 iterations', 'v_y, 10 iterations', ...
                'v_x, 100 iterations', 'v_y, 100 iterations');
    end
    
end
