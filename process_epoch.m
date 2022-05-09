function [w, w0] = process_epoch(w, w0, lrate, example_train, label_train)
order=randperm(length(example_train));
for i=1:length(example_train)

[wgrad, w0grad] = partial_gradient(w, w0, example_train{order(i)}, label_train(order(i)));


w=w-lrate*wgrad;
w0=w0-lrate*w0grad;


end
