function [Wcyl, Wsphere] = ex5q3to6()
%% ex5 q3-q6
% Create projections of cylinder and sphere.

    cylN = 50-1;
    sphereN = 10-1;
    framesN = 30;
    Wcyl = zeros(60, 100);
    Wsphere = zeros(60, 100);
    
    [Xcyl,Ycyl,Zcyl] = cylinder(1, cylN);
    [Xsphere,Ysphere,Zsphere] = sphere(sphereN);
    
    for frame = 0:(framesN-1)
        rotCyl = axisRotate([Xcyl(:)'; Ycyl(:)'; Zcyl(:)'], 'y', (frame-1)*3);
        Wcyl(2*frame+1:2*frame+2, :) = rotCyl(1:2,:);
        rotSphere = axisRotate([Xsphere(:)'; Ysphere(:)'; Zsphere(:)'], 'y', (frame-1)*3);
        Wsphere(2*frame+1:2*frame+2, :) = rotSphere(1:2,:);
    end
    
    disp('Rank of Wcylinder:')
    rank(Wcyl)
    disp('Rank of Wsphere:')
    rank(Wsphere)
    
    figure;
    for frame = 0:(framesN-1)
        scatter(Wsphere(2*frame+1,:), Wsphere(2*frame+2,:));
        pause(0.02);
    end
    
    figure;
    for frame = 0:(framesN-1)
        scatter(Wcyl(2*frame+1,:), Wcyl(2*frame+2,:));
        pause(0.1);
    end
    
    [Mcyl, Scyl] = TomasiKanade(Wcyl);
    [Msphere, Ssphere] = TomasiKanade(Wsphere);
    figure;
    plot3(Ssphere(1, :), Ssphere(2, :), Ssphere(3, :));
end
