function [newLoc] = axisRotate(loc, axis, theta)
%% ex5 q2
% Given a 3D location, an axis (x/y/z) and an angle,
% return a new location after rotation about the axis
% by the determined angle.

    ct = cosd(theta);
    st = sind(theta);
    
    rotMat = eye(3);
    if axis == 'x'
        rotMat(2:3,2:3) = [ct, st; -st, cost];
    elseif axis == 'y'
        rotMat(1,1) = ct;
        rotMat(1,3) = -st;
        rotMat(3,1) = st;
        rotMat(3,3) = ct;
    else
        rotMat(1:2,1:2) = [ct, st; -st, cost];
    end
    
    newLoc = rotMat * loc;
    
end
