function [] = LaplacianThres(I, thres)
%% ex3 q4-5 helper

    [Ix, Iy] = ImageDerivatives(I);
    L = abs(Deriv2Laplace(Ix, Iy));
    Lbin = L >= thres;

     figure;
     subplot(1, 2, 1);     
     imshow(L);
     title('Image Laplacian');
     
     subplot(1,2,2);     
     imshow(Lbin);
     title('Image Laplacian after thresholding');

end
