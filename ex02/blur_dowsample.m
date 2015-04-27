function [returnIm] = blur_dowsample(I)
%% ex2 q3
%  Returns a blurred and downsampled version of I.

    if (nargin ~= 1)
        error('Please give an image as input');
    end

    load('GaussKernel.mat');                % Using GaussKernel.mat
    tmpIm = conv2(I, GaussKernel, 'same');  % Blur
    returnIm = tmpIm(1:2:end, 1:2:end);     % Downsample

end