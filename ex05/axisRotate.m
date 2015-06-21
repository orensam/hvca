function [newLoc] = axisRotate(loc, axis, theta)
%% ex5 q2
% Given a 3D location, an axis (x/y/z) and an angle,
% return a new location after rotation about the axis
% by the determined angle.

    ct = cosd(theta);
    st = sind(theta);
    
    rotMat = eye(3);
    if axis == 'x'
        rotMat(2:3,2:3) = [ct, -st; st, ct];
    elseif axis == 'y'
        rotMat(1,1) = ct;
        rotMat(1,3) = st;
        rotMat(3,1) = -st;
        rotMat(3,3) = ct;        
    else
        rotMat(1:2,1:2) = [ct, -st; st, ct];
    end
    
    
    
    newLoc = rotMat * loc;
    
end

function R=bla(x, y, z, teta)
norm=sqrt(x.^2 + y.^2 + z.^2);
x=x/norm;
y=y/norm;
z=z/norm;
R(1,1) = (x.^2+(1-x.^2).*cos(teta));
R(1,2) = (x.*y.*(1-cos(teta)) -z.*sin(teta));
R(1,3) = (x.*z.*(1-cos(teta)) +y.*sin(teta));
R(2,1) = (x.*y.*(1-cos(teta)) +z.*sin(teta));
R(2,2) = (y.^2+(1-y.^2).*cos(teta));
R(2,3) = (y.*z.*(1-cos(teta)) -x.*sin(teta));
R(3,1) = (x.*z.*(1-cos(teta)) -y.*sin(teta));
R(3,2) = (y.*z.*(1-cos(teta)) +x.*sin(teta));
R(3,3) = (z.^2+(1-z.^2).*cos(teta));
end