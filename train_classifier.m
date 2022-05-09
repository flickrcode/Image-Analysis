function [net,accu] = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)

options = trainingOptions('sgdm','MaxEpochs', 10);

net = trainNetwork(imgs_train, labels_train, layers, options)


class=net.classify(imgs_val(:,:,:,1:length(imgs_val)))

correct=sum(class==labels_val);
total=length(imgs_val);
accu=correct/total*100 %percentage correct
X = sprintf(' Accuracy is %s percent .',accu);
disp(X)

end
