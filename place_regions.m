function region_centres = place_regions(centre, radius)
%patch = get_patch(image, x, y, patch_radius)

x= centre(1,1);
y=centre(1,2);
l=2*radius/3;
region_centres(1,1) = [x-l];
region_centres(2,1) = [y+l];
region_centres(1,2) = [x];
region_centres(2,2) = [y+l];
region_centres(1,3) = [x+l];
region_centres(2,3) = [y+l];
region_centres(1,4) = [x-l];
region_centres(2,4) = [y];
region_centres(1,5) = [x];
region_centres(2,5) = [y];
region_centres(1,6) = [x+l];
region_centres(2,6) = [y];
region_centres(1,7) = [x-l];
region_centres(2,7) = [y-l];
region_centres(1,8) = [x];
region_centres(2,8) = [y-l];
region_centres(1,9) = [x+l];
region_centres(2,9) = [y-l];



end
