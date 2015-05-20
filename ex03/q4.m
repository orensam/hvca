function [] = q4()
%% ex3 q4
    I = double(imread('simul_cont_squares.tif'));
    thres = 30;
    LaplacianThres(I, thres);     
     
end
