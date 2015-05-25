function [] = q4()
%% ex3 q4
    I = double(imread('simul_cont_squares.tif'));
    thres = 10;
    LaplacianThres(I, thres);     
     
end
