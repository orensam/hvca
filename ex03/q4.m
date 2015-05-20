function [] = q4()
%% ex3 q4
    I = double(imread('simul_cont_squares.tif'));
    [Ix, Iy] = ImageDerivatives(I);
    L = Deriv2Laplace(Ix, Iy);
    thres = 16;
    Lbin = L >= thres;

     figure;
     subplot(1, 2, 1);     
     imshow(L);
     title('Image Laplacian');
     
     subplot(1,2,2);     
     imshow(Lbin);
     title('Image Laplacian after thresholding');
     
     
end
