function [pts,pts_tilde, A_true, t_true]=affine_test_case(K, outlier_rate) %number of point correspondences

pts=rand(2,K)*10;
%A_true=rand(2);
%t_true = rand(2,1);
A_true = [2 0; 0 2];
t_true = [0 ; 0];
target_size=size(pts);
for i = 1:K
pts_tilde(1,i)=A_true(1,1)*pts(1,i) + A_true(1,2)*pts(2,i) + t_true(1);
pts_tilde(2,i)=A_true(2,1)*pts(1,i)+ A_true(2,2)*pts(2,i) + t_true(2);
end


outlier2=K*outlier_rate/100;
outlier1=K-outlier2;
pts_tilde(1:2,outlier1+1:end)=rand(2,outlier2)*10;

% figure(1)
% imagesc(pts_tilde);
% figure(2)
% imagesc(pts);
% axis image;

end