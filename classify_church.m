function [label, name] = classify_church(image, feature_collection) %image has to be grayscale
[coords, descriptors] = extractSIFT(image);
corrs = matchFeatures(descriptors', feature_collection.descriptors', 'MatchThreshold', 100, 'MaxRatio', 0.7);

for i=1:length(corrs)
    labels(i)=feature_collection.labels(corrs(i,2));
end
label=mode(labels)           %finding most common label

if label==1
    name='goteborg'
elseif label==2
    name='kalmar'
elseif label==3
    name='stockholm'
elseif label==4
    name='kalmar'
elseif label==5
    name='uppsala'
elseif label==6
    name='uppsala'
elseif label==7
    name='goteborg'
elseif label==8
    name='lund'
elseif label==9
    name='lund'
elseif label==10
    name='stockholm'
end
    


end
