function [] = ex5q3to6()
%% ex5 q3-q6
% Create projections of cylinder and sphere.
    
    %% q3: create Wcyl and Wsphere
    cylN = 50-1; % Matlab's cylinder(k) creates a cylinder with 2k+2 points
    sphereN = 10-1; % Matlab's sphere(k) creates a sphere with (k+1)^2 points
    framesN = 30;
    Wcyl = zeros(60, 100);
    Wsphere = zeros(60, 100);
    
    [Xcyl, Ycyl, Zcyl] = cylinder(1, cylN);
    Pcyl = [Xcyl(:)'; Ycyl(:)'; Zcyl(:)'];
    [Xsphere, Ysphere, Zsphere] = sphere(sphereN);
    Psphere = [Xsphere(:)'; Ysphere(:)'; Zsphere(:)'];
    
    for frame = 0:(framesN-1)
        rotCyl = axisRotate(Pcyl, 'y', (frame+1)*3);
        Wcyl(2*frame+1:2*frame+2, :) = rotCyl(1:2,:);
        rotSphere = axisRotate(Psphere, 'y', frame*3);
        Wsphere(2*frame+1:2*frame+2, :) = rotSphere(1:2,:);
    end
    
    %% q4: rank of Wcyl, Wsphere
    disp('Rank of Wcylinder:')
    rank(Wcyl)
    disp('Rank of Wsphere:')
    rank(Wsphere)
    
    %% q5: animate the 2d projections of the 3d points
    figure;
    for frame = 1:framesN
        plot(Wsphere(2*frame-1,:), Wsphere(2*frame,:), '.', 'markersize', 20);
        pause(0.05);
    end
    
    figure;
    for frame = 1:framesN
        plot(Wcyl(2*frame-1,:), Wcyl(2*frame,:), '.', 'markersize', 10);
        pause(0.05);
    end
    
    %% q6: run Tomasi-Kanade on the 2d frames to recover structure from motion
    [~, Scyl] = TomasiKanade(Wcyl);
    [~, Ssphere] = TomasiKanade(Wsphere);
    
    figure; plot3(Ssphere(1, :), Ssphere(2, :), Ssphere(3, :));    
    title('Structure from motion: Sphere'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on;    
    
    figure; plot3(Scyl(1, :), Scyl(2, :), Scyl(3, :));
    title('Structure from motion: Cylinder'); xlabel('X'); ylabel('Y'); zlabel('Z'); grid on;
        
end
