%% 1.10
load digits.mat
%creating SIFT descriptors for each training image
for i=1:100
    img=digits_training(i).image;
    
    digits_training(i).descriptor = gradient_descriptor(img, [20,20], 14);   %pictures are 39x39
end


%% 1.11
%test of classify_digit
digit_image=digits_validation(2).image;
label = classify_digit(digit_image, digits_training);
disp(['The label is ' num2str(label)]);

%% 1.12  

for i=1:50
    digit_image=digits_validation(i).image;
    label(i) = classify_digit(digit_image, digits_training);
    
end

same = [digits_validation.label]==label;
percentage = 100*sum(same)/50 %Calculating percentage of correct answers

%% 1.14
[coords, descriptors] = extractSIFT(img)

%corrs = matchFeatures(descs_1, descs_2, 'MatchThreshold', 100, 'MaxRatio', 0.7);

%% 1.15

load church_data.mat
img= imread('church4.jpg');
img=mean(img,3);
[label, name] = classify_church(img, feature_collection) %image has to be grayscale

%% 1.16 
% picture 1, 4, 2, 5, 6, 7, 8, 9, 10 is correct, 3 is wrong 
%90 % correct!!!


    



    