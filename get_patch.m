function patch = get_patch(image, x, y, patch_radius)
[rows, columns, nr_RGB] = size(image);
col = floor(x - patch_radius);
row = floor(y - patch_radius);
patch = imcrop(image, [col, row, patch_radius*2, patch_radius*2]);

if row < 0 | col < 0 | (x + patch_radius) > columns | (y + patch_radius) > rows
    error('Patch outside image borders')
end

end
