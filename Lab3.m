%% Ex.2
img = read_image('examples/mona.png');
% A = [0.88 -0.48; 0.48 0.88];
A =[2 0;0 2];
t = [0;0];
target_size = size(img);
warped = affine_warp(target_size, img, A, t);
imagesc(warped);
axis image;
%% Ex3 
[pts,pts_tilde, A_true, t_true]=affine_test_case(3,20);

[A, t] = estimate_affine(pts, pts_tilde);
%%

residual_lgths = residual_lgths(A, t, pts, pts_tilde)
%% 3.6
[pts,pts_tilde, A_true, t_true]=affine_test_case(100, 20)

%% 3.7

[A,t,number_outliers] = ransac_fit_affine(pts, pts_tilde, 2)

%% 3.9

source = read_image('examples/vermeer_source.png');
target = read_image('examples/vermeer_target.png');
warped = align_images(source, target,10,false);
%%
switch_plot(warped,target)
imwrite(warped, 'vermeer_warped.png')


%% 3.10
source = read_image('examples/CT_1.jpg');
target = read_image('examples/CT_2.jpg');
warped = align_images(source, target, 10,true);
switch_plot(warped,target)
imwrite(warped, 'CT_warped.png')
imwrite(target, 'CT_target.png')

%% 3.11

source = read_image('examples/tissue_brightfield.tif');
source=mean(source,3);
inverted_img = 1- source;
target = read_image('examples/tissue_fluorescent.tif');
warped = align_images(inverted_img, target, 10,true);
switch_plot(warped,target)
imwrite(target, 'tissue_target.png')
imwrite(warped, 'tissue_warped.png')

%% 3.12
img = read_image('examples/tissue_fluorescent.tif');
img=mean(img,3);
pos=[1, 2]
value = sample_image_at(img, pos)

%% 3.13 test
img = read_image('examples/source_16x16.tif');
source16_16=mean(img,3);

warped = warp_16x16(source16_16)
figure(1)
imagesc(warped)
figure(2)
imagesc(source16_16)

%% 3.14
source = read_image('examples/vermeer_source.png');
target = read_image('examples/vermeer_target.png');
warped = align_images(source, target, 10, false);
%%

switch_plot(warped,target)
