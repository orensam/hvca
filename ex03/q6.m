function [] = q6()
%% ex3 q6

    I = double(imread('kofka_ring.tif'));
    thres = [10, 15, 20];
    %LaplacianThres1(I, thres);     
    
    [Ix, Iy] = ImageDerivatives(I);
    L = abs(Deriv2Laplace(Ix, Iy));
    Lbin1 = L >= thres(1);
    Lbin2 = L >= thres(2);
    Lbin3 = L >= thres(3);

     figure;
     subplot(2, 2, 1);     
     imshow(L);
     title('Image Laplacian');
     
     subplot(2,2,2);     
     imshow(Lbin1);
     title('Image Laplacian after thresholding at T=10');
     
     
     subplot(2,2,3);     
     imshow(Lbin2);
     title('Image Laplacian after thresholding at T=15');
     
     
     subplot(2,2,4);     
     imshow(Lbin3);
     title('Image Laplacian after thresholding at T=20');
     
end
