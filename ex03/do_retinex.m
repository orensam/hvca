function [R, L] = do_retinex(I, T)
%% ex3 q8
% Performs retinex on given image I with threshold T.
% Returns the reflectance R and illumination L.

    % a
    logI = log(I);
    % b
    [logIx, logIy] = ImageDerivatives(logI);
    % c
    normDev = sqrt(logIx.^2 + logIy.^2);
    % d
    logIx(normDev < T) = 0;
    logIy(normDev < T) = 0;    
    % e-i
    lap = Deriv2Laplace(logIx, logIy);
    % e-ii
    invK = invDel2(size(I));    
    % e-iii
    logRef = conv2(lap, invK, 'same');    
    % f
    R = exp(logRef);
    L = I./R;
    
end
