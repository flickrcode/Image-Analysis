function [pts,pts_tilde, A_true, t_true]=affine_test_case
pts=rand(2,5)*10;
A_true =[2 0;0 2];
t_true = [2;0];
target_size=size(pts);
pts_tilde=affine_warp(target_size, pts, A_true, t_true);

end