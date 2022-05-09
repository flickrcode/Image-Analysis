function [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train)


y=sum(sum(example_train.*w))+w0;
p=exp(y)/(1+exp(y));

if label_train==1
    wgrad= -example_train.*(1-p);
    w0grad= -(1-p);
    
else
    %om label är noll räkna ut gradient wgrad w0grad och för det fallet
    wgrad= example_train.*p;
    w0grad= p;


end
end


