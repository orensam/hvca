%% ex2 q5: Test flowers vs tree velocity

clc;
num_iterations = 100;
im1 = double(imread('flower-i1.tif'));
im2 = double(imread('flower-i2.tif'));
flowers1 = im1(101:120, 1:60);
flowers2 = im2(101:120, 1:60);
tree1 = im1(101:120, 60:120);
tree2 = im2(101:120, 60:120);

disp('Full LK on whole images:')
Full_LK_alg(f1, f2, 0, ones(size(f1)), num_iterations)
disp('Full LK on flowers:')
flowers_v = Full_LK_alg(flowers1, flowers2, 0, ones(size(flowers1)), num_iterations)
disp('Full LK on tree:')
tree_v = Full_LK_alg(tree1, tree2, 0, ones(size(tree1)), num_iterations)
disp('Flowers to tree velocity ratio:')
flowers_v ./ tree_v
