%% Lab 2
load cell_data.mat

%% Ex.2 

cell_data.examples= [cell_data.fg_patches cell_data.bg_patches];
cell_data.labels= [ones(1,200) zeros(1,200)];


%% Ex.3
% 90 % used for training 10 % for valisation
cell_data.examples_train=[cell_data.examples(1:180) cell_data.examples(221:400)];
cell_data.labels_train=[cell_data.labels(1:180) cell_data.labels(221:400)];
% 
cell_data.examples_val=cell_data.examples(181:220);
cell_data.labels_val=cell_data.labels(181:220);

%% Ex. 6
s=0.01;
w0=0;
w=s*randn(35,35);
lrate=0.01;
[w1, w01] = process_epoch(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
figure(1)
imagesc(w1)

[w2, w02] = process_epoch(w1, w01, lrate, cell_data.examples_train, cell_data.labels_train);
figure(2)
imagesc(w2)

[w3, w03] = process_epoch(w2, w02, lrate, cell_data.examples_train, cell_data.labels_train);
figure(3)
imagesc(w3)

%% five epochs
s=0.01;
w0=0;
w=s*randn(35,35);
lrate=0.01;

for i=1:5
[w, w0] = process_epoch(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
end
figure(1)
imagesc(w)

%%

s=1;
w0=0;
w=s*randn(35,35);
lrate=0.1;

for i=1:5
[w, w0] = process_epoch(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
end
figure(2)
imagesc(w)

s=10;
w0=0;
w=s*randn(35,35);
lrate=0.5;

for i=1:5
[w, w0] = process_epoch(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
end
figure(3)
imagesc(w)

%% 2.7
%% five epochsm examples taken in order
s=0.01
w0=0;
w=s*randn(35,35);
lrate=0.01;

for i=1:5
[w, w0] = process_epoch2(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
end
figure(1)
imagesc(w)

%% 2.8 test
s=0.01;
w0=0;
w=s*randn(35,35);
lrate=0.01;

for i=1:17
[w, w0] = process_epoch(w, w0, lrate, cell_data.examples_train, cell_data.labels_train);
end

predicted_labels_val =classify(cell_data.examples_val, w, w0);
predicted_labels_train =classify(cell_data.examples_train, w, w0);
correct_val=sum(predicted_labels_val==cell_data.labels_val);
total_val=length(predicted_labels_val);
accuracy_val=correct_val/total_val*100 %percentage correct


total_train=length(predicted_labels_train);
correct_train=sum(predicted_labels_train==cell_data.labels_train);
accuracy_train=correct_train/total_train*100 %percentage correct

%% 2.9 
[examples_train_aug,labels_train_aug] = augment_data(cell_data.examples_train,cell_data.labels_train,4);

s=0.01;
w0=0;
w=s*randn(35,35);
lrate=0.01;

for i=1:17
[w, w0] = process_epoch(w, w0, lrate, examples_train_aug, labels_train_aug);
end

predicted_labels_val =classify(cell_data.examples_val, w, w0);
correct_val=sum(predicted_labels_val==cell_data.labels_val);
total=length(predicted_labels_val);
accuracy_val=correct_val/total*100 %percentage correct

predicted_labels_train =classify(examples_train_aug, w, w0);
correct_train=sum(predicted_labels_train==labels_train_aug);
total=length(predicted_labels_train);
accuracy_train=correct_train/total*100 %percentage correct


%% 2.10

[imgs, labels] = digitTrain4DArrayData;
imagesc(imgs(:,:,:,1000)), axis image, colormap gray
%% 2.11
layers = basic_cnn_classifier()


%% 2.12 

options = trainingOptions('sgdm');

net = trainNetwork(imgs, labels, layers, options)

%% 2.13
net.predict(imgs(:,:,:,1000))
net.classify(imgs(:,:,:,1000))
imagesc(imgs(:,:,:,1000)), axis image, colormap gray

%% 2.15
imgs_train=imgs(:,:,:,1:4500);
imgs_val=imgs(:,:,:,4501:5000);
labels_train=labels(1:4500);
labels_val=labels(4501:5000);
[net, accu] = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)

%% 2.18
layers2 = better_cnn_classifier()

[net2,accu2] = train_classifier(layers2, imgs_train, labels_train, imgs_val, labels_val)
%%

pred = net2.classify(imgs_val);
%%

pred0=find(pred =='0');
same=(labels_val(pred0) =='0');
tp0=sum(same);
total0=length(find(pred=='0'));
precision0=tp0/total0; 
recall0=tp0/sum(labels_val =='0');

pred1=find(pred =='1');
same=(labels_val(pred1) =='1');
tp1=sum(same);
total1=length(find(pred=='1'));
precision1=tp1/total1;
recall1=tp1/sum(labels_val =='1');

pred2=find(pred =='2');
same=(labels_val(pred2) =='2');
tp2=sum(same);
total2=length(find(pred=='2'));
precision2=tp2/total2;  
recall2=tp2/sum(labels_val =='2');

pred3=find(pred =='3');
same=(labels_val(pred3) =='3');
tp3=sum(same);
total3=length(find(pred=='3'));
precision3=tp3/total3;
recall3=tp3/sum(labels_val =='3');

pred4=find(pred =='4');
same=(labels_val(pred4) =='4');
tp4=sum(same);
total4=length(find(pred=='4'));
precision4=tp4/total4;   
recall4=tp4/sum(labels_val =='4');

pred5=find(pred =='5');
same=(labels_val(pred5) =='5');
tp5=sum(same);
total5=length(find(pred=='5'));
precision5=tp5/total5;
recall5=tp5/sum(labels_val =='5');

pred6=find(pred =='6');
same=(labels_val(pred6) =='6');
tp6=sum(same);
total6=length(find(pred=='6'));
precision6=tp6/total6;
recall6=tp6/sum(labels_val =='6');

pred7=find(pred =='7');
same=(labels_val(pred7) =='7');
tp7=sum(same);
total7=length(find(pred=='7'));
precision7=tp7/total7; 
recall7=tp7/sum(labels_val =='7');

pred8=find(pred =='8');
same=(labels_val(pred8) =='8');
tp8=sum(same);
total8=length(find(pred=='8'));
precision8=tp8/total8;
recall8=tp8/sum(labels_val =='8');

pred9=find(pred =='9');
same=(labels_val(pred9) =='9');
tp9=sum(same);
total9=length(find(pred=='9'));
precision9=tp9/total9;
recall9=tp9/sum(labels_val =='9');

%% 2.19
[imgs_test, labels_test] = digitTest4DArrayData;
pred = net2.classify(imgs_test);

tp0=sum(pred(1:500)=='0');
total0=length(find(pred=='0'));
precision0=tp0/total0; 
recall0=tp0/500;

tp1=sum(pred(501:1000)=='1');
total1=length(find(pred=='1'));
precision1=tp1/total1;
recall1=tp1/500;

tp2=sum(pred(1001:1500)=='2');
total2=length(find(pred=='2'));
precision2=tp2/total2;  
recall2=tp2/500;

tp3=sum(pred(1501:2000)=='3');
total3=length(find(pred=='3'));
precision3=tp3/total3;
recall3=tp3/500;

tp4=sum(pred(2001:2500)=='4');
total4=length(find(pred=='4'));
precision4=tp4/total4;   
recall4=tp4/500;

tp5=sum(pred(2501:3000)=='5');
total5=length(find(pred=='5'));
precision5=tp5/total5;
recall5=tp5/500;

tp6=sum(pred(3001:3500)=='6');
total6=length(find(pred=='6'));
precision6=tp6/total6;
recall6=tp6/500;

tp7=sum(pred(3501:4000)=='7');
total7=length(find(pred=='7'));
precision7=tp7/total7; 
recall7=tp7/500;

tp8=sum(pred(4001:4500)=='8');
total8=length(find(pred=='8'));
precision8=tp8/total8;
recall8=tp8/500;

tp9=sum(pred(4501:5000)=='9');
total9=length(find(pred=='9'));
precision9=tp9/total9;
recall9=tp9/500;

%% 2.20 
correct0=pred(1:500)=='0';
errorposition=find(correct0==0);

pred(errorposition(1))
imwrite(imgs_test(:,:,:,errorposition(1)), 'mistaken_as_9.png')

correct1=pred(501:1000)=='1';
errorposition=find(correct1==0);

pred(500+errorposition(7))

imwrite(imgs_test(:,:,:,500+errorposition(7)), 'mistaken_as_0.png')

correct2=pred(1001:1500)=='2';
errorposition=find(correct2==0);

pred(1000+errorposition(9))

imwrite(imgs_test(:,:,:,1000+errorposition(100)), 'mistaken_as_7.png')












