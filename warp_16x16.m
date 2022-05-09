function warped = warp_16x16(source)

[row,col]=size(source);
for i=1:row
    for k=1:col
        pos=[k i];
pos_tilde=transform_coordinates(pos)
value = sample_image_at(source, pos_tilde);
warped(pos(2),pos(1))=value;
    end
end
end
 
