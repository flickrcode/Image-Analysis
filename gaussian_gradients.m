function [grad_x, grad_y] = gaussian_gradients(img, sigma)
result1 = gaussian_filter(img, sigma);
filt_x = [-0.5 0 0.5];
filt_y = [-0.5; 0; 0.5];
grad_x = imfilter(result1, filt_x);
grad_y = imfilter(result1, filt_y);
end
