%% 1.1
clear all
clc
clf

raw_image = imread('paper_with_digits.png');
size(raw_image)

test = get_patch(raw_image, 612, 816, 300);
imagesc(test)

%% 1.2 Testing of get patch function
test_image = reshape((11:100), 10, 9);
figure(1)
imagesc(test_image)


test_image_2 = get_patch(test_image, 5, 4, 2);
figure(2)
imagesc(test_image_2)

%% 1.3

test3= get_patch(raw_image, 60, 816, 300);  %error message should show up, patch outside of image borders
imagesc(test3)

%% 1.4 Test of gaussian filter

test4 = gaussian_filter(raw_image, 10);
imagesc(test4)

%% 1.5 
clf
img = mean(test, 3);
[grad_x, grad_y] = gaussian_gradients(img, 2); %function which estimates gaussian derivatives for each pixel, greyscale pic


% 1.6
%plot gradients in photo, zoom in to see arrows pointing from dark to
%lighter
imagesc(img)
axis image
hold on
quiver(grad_x, grad_y)
colorbar

%% 1.7 (use grayscale picture for histogram)
%test of gradient histogram using plot_bouguet
clc
clear all
img = reshape((11:100), 10, 9);
img = mean(img, 3);
plot_bouquet(img,2)

%[grad_x, grad_y] = gaussian_gradients(img, 2);




%% 1.8 Test of region centres
raw_image = imread('paper_with_digits.png');
region_centres = place_regions([550,550],220);

plot_squares(raw_image, region_centres, 250/3)


%% 1.9 Test of gradient descriptor

img = mean(raw_image,3);
desc = gradient_descriptor(img, [300,300], 50);








