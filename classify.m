function predicted_labels =classify(examples_val, w, w0)

for i=1:length(examples_val)
tau(i)=sum(sum(examples_val{i}.*w))+w0;      

end
predicted_labels=tau>0 ;%if tau >0 then label =1 
end
