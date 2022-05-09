function result = gaussian_filter(img, sigma);
h = fspecial('gaussian', 5*sigma, sigma); %filter size is 5 std deviations should be at least 4 not to lose precision.
result = imfilter(img, h, 'symmetric');   %using imfilter to filter the image
end
