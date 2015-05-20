function [] = q6()
%% ex3 q6
    I = double(imread('kofka_ring.tif'));
    thres = 16;
    LaplacianThres(I, thres);     
     
end
