function value = sample_image_at(img, position)
[xmax,ymax]=size(img);
position = round(position)
po1=position(1)
po2=position(2)

if position(1) >xmax | position(2) >ymax | position(2) <=0 | position(1) <=0
    value=1;
else
    
    value=img(po2, po1);
end
end
