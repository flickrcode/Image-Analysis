function [pts,pts_tilde, A_true, t_true]=affine_test_case(K,noise) %number of point correspondences

pts=[480;640].*rand(2,K);

A_true = randn(2);
t_true = randn(2,1);


for i = 1:K
pts_tilde(1,i)=A_true(1,1)*pts(1,i) + A_true(1,2)*pts(2,i) + t_true(1) 
pts_tilde(2,i)=A_true(2,1)*pts(1,i)+ A_true(2,2)*pts(2,i) + t_true(2) 
end

pts_tilde = pts_tilde + noise.*randn(2,K)
end