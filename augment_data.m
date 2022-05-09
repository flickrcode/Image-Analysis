function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)

angle=360/(M);
g=1;
h=0;
for i=1:length(examples_train)
ex_aug{1}=examples_train{i};
    for k=1:M-1
ex_aug{k+1}=imrotate(examples_train{i},angle*k);

    end
h=h+k+1;
examples_train_aug(g:h,1)=ex_aug;
label=labels_train(i);
labels_train_aug(g:h,1)=label*ones(k+1,1);
g=h+1;

end
labels_train_aug=labels_train_aug';
examples_train_aug=examples_train_aug';

end