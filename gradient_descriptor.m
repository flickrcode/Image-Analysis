function desc = gradient_descriptor(image, position, radius)
region_centres = place_regions(position, radius);

k=1;
t=8;
for i=1:9
patch = get_patch(image, region_centres(1,i), region_centres(1,i), 2*radius/3); 

[grad_x, grad_y] = gaussian_gradients(patch, radius/10); %std=1/10 here, std proprtional to radius

histogram=gradient_histogram(grad_x, grad_y);            %creating a histogram for each region (3x3)
histo(k:t)=histogram;                                    %saving into histo
k=k+8;
t=t+8;
end
desc=histo/norm(histo);   %normaliserar med unit length
end



