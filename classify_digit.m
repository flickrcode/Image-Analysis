function label = classify_digit(digit_image, digits_training)
desc = gradient_descriptor(digit_image, [20,20], 14); %getting sift descriptor

diff=zeros(100,1);
for i=1:length(digits_training)
diff(i)=norm(digits_training(i).descriptor-desc);    %Finding difference between training descriptors and descriptor of image
end

[mins, pos]=min(diff);                               %locating the training descriptor that is the most similar (smallest diff)
label=digits_training(pos).label;                    %labeling with same label as of the descriptor
%disp(['The label is ' num2str(label)]);
