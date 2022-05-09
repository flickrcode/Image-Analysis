function [pts_tilde]=noise_addition(A_true,t_true,pts,noise,K,outlier_rate) %number of point correspondences

for i = 1:K
pts_tilde(1,i)=A_true(1,1)*pts(1,i) + A_true(1,2)*pts(2,i) + t_true(1) 
pts_tilde(2,i)=A_true(2,1)*pts(1,i)+ A_true(2,2)*pts(2,i) + t_true(2) 
end

pts_tilde = pts_tilde + noise.*randn(2,K);
outlier2=K*outlier_rate/100
outlier1=K-outlier2
pts_tilde(1:2,outlier1+1:end)= [480;640].*randn(2,outlier2)

end