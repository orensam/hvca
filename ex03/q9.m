function [] = q9()
%% ex3 q9

    I1 = twoSquares(1);
    I2 = twoSquares(2);    
    T = 0.07;
    [R1, L1] = do_retinex(I1, T);
    [R2, L2] = do_retinex(I2, T);
    d1 = diag(R1);
    d2 = diag(R2);
    
    figure;
    subplot(2,4,1);
    imshow(I1, [0 2]);
    title('twoSquares(1)');
    subplot(2,4,2);
    imshow(R1, [0 2]);
    title('R1');
    subplot(2,4,3);
    imshow(L1, [0 2]);
    title('L1');
    subplot(2,4,4);
    plot(d1);
    title('R1 diagonal values')
    
    
    subplot(2,4,5);
    imshow(I2, [0 2]);
    title('twoSquares(2)');
    subplot(2,4,6);
    imshow(R2, [0 2]);
    title('R2');
    subplot(2,4,7);
    imshow(L2, [0 2]);
    title('L2');
    subplot(2,4,8);
    plot(d2);
    title('R2 diagonal values');

end
