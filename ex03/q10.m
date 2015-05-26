function [] = q10()
%% ex3 q10

    load('checkerShadow.mat');
    disp('Intensities at (y1,x1), (y2,x2):');
    [im1(y1, x1), im1(y2, x2)]
    T = [0.02, 0.07, 0.14];
    [R1, L1] = do_retinex(im1, T(1));
    [R2, L2] = do_retinex(im1, T(2));
    [R3, L3] = do_retinex(im1, T(3));
    
    disp('Reflectance at (y1,x1), (y2,x2) (T=0.07)');
    [R2(y1, x1), R2(y2, x2)]
    
    figure;
    subplot(2,2,1);
    imshow(im1, [0 1]);
    title('Original Image')
    subplot(2,2,2);
    imshow(R1, [0 1]);
    title('R, T=0.02');
    subplot(2,2,3);
    imshow(R2, [0 1]);
    title('R, T=0.07');
    subplot(2,2,4);
    imshow(R3, [0 1]);
    title('R, T=0.14');    
        
end
