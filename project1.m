clear all
close all
clc
%
%% 1. Modified Affine_test_case
noise = 1;

for i = 10
outlier_rate = 0:i:90;
end
K = 1000;

[pts(1:2,:),pts_tilde(1:2,:), A_true(1:2,:), t_true(1:2,:)]=affine_test_case(K, noise);

idx = 1;
for j = 1:length(outlier_rate)
 pts_tilde(idx:idx+1,:) = outlier_addition(outlier_rate(j),pts_tilde(1:2,:),K);
 idx = idx + 2;
end
pts(1:20,:)= repmat(pts,10,1)

for i = 1:length(outlier_rate)
inlier_rate(i)= 1-(outlier_rate(i)/100);    
end
%%
%3. Extend the RANSAC without Local Optimization (LO) and Plot 

threshold = 1.96;

index = 1;
ind = 1;

for i = 1
dd = 0:i:3
end

%%
for i=1:10
 [s(1).number_inliers(i), s(1).RunTime(i), s(1).iteration_number(i),s(1).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(1:2,:), threshold, dd(1));
 s(1).averageTime_10 = mean(s(1).RunTime)
 s(1).average_num_iteration_10 = round(mean(s(1).iteration_number))
 s(1).outlierratio = 0
 s(1).average_inliers_ratio = mean(s(1).number_inliers)/1000
 s(1).average_residual_LO_10 = double(mean(s(1).residual_length));
end
for i=1:10
 [s(2).number_inliers(i), s(2).RunTime(i), s(2).iteration_number(i),s(2).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(3:4,:), threshold, dd(1));
 s(2).averageTime_10 = mean(s(2).RunTime)
 s(2).average_num_iteration_10 = round(mean(s(2).iteration_number))
 s(2).outlierratio = 0.1
 s(2).average_inliers_ratio = mean(s(2).number_inliers)/1000
 s(2).average_residual_LO_10 = double(mean(s(2).residual_length));
end

for i=1:10
 [s(3).number_inliers(i), s(3).RunTime(i), s(3).iteration_number(i),s(3).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(5:6,:), threshold, dd(1));
 s(3).averageTime_10 = mean(s(3).RunTime)
 s(3).average_num_iteration_10 = round(mean(s(3).iteration_number))
 s(3).outlierratio = 0.2
 s(3).average_inliers_ratio = mean(s(3).number_inliers)/1000
 s(3).average_residual_LO_10 = double(mean(s(3).residual_length));
end
for i=1:10
 [s(4).number_inliers(i), s(4).RunTime(i), s(4).iteration_number(i),s(4).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(7:8,:), threshold, dd(1));
 s(4).averageTime_10 = mean(s(4).RunTime)
 s(4).average_num_iteration_10 = round(mean(s(4).iteration_number))
 s(4).outlierratio = 0.3
 s(4).average_inliers_ratio = mean(s(4).number_inliers)/1000
 s(4).average_residual_LO_10 = double(mean(s(4).residual_length));
end
for i=1:10
 [s(5).number_inliers(i), s(5).RunTime(i), s(5).iteration_number(i),s(5).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(9:10,:), threshold, dd(1));
 s(5).averageTime_10 = mean(s(5).RunTime)
 s(5).average_num_iteration_10 = round(mean(s(5).iteration_number))
 s(5).outlierratio = 0.4
 s(5).average_inliers_ratio = mean(s(5).number_inliers)/1000
 s(5).average_residual_LO_10 = double(mean(s(5).residual_length));
end

for i=1:10
 [s(6).number_inliers(i), s(6).RunTime(i), s(6).iteration_number(i),s(6).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(11:12,:), threshold, dd(1));
 s(6).averageTime_10 = mean(s(6).RunTime)
 s(6).average_num_iteration_10 = round(mean(s(6).iteration_number))
 s(6).outlierratio = 0.5
 s(6).average_inliers_ratio = mean(s(6).number_inliers)/1000
 s(6).average_residual_LO_10 = double(mean(s(6).residual_length));
end

for i=1:10
 [s(7).number_inliers(i), s(7).RunTime(i), s(7).iteration_number(i),s(7).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(13:14,:), threshold, dd(1));
 s(7).averageTime_10 = mean(s(7).RunTime)
 s(7).average_num_iteration_10 = round(mean(s(7).iteration_number))
 s(7).outlierratio = 0.6
 s(7).average_inliers_ratio = mean(s(7).number_inliers)/1000
 s(7).average_residual_LO_10 = double(mean(s(7).residual_length));
end

for i=1:10
 [s(8).number_inliers(i), s(8).RunTime(i), s(8).iteration_number(i),s(8).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(15:16,:), threshold, dd(1));
 s(8).averageTime_10 = mean(s(8).RunTime)
 s(8).average_num_iteration_10 = round(mean(s(8).iteration_number))
 s(8).outlierratio = 0.7
 s(8).average_inliers_ratio = mean(s(8).number_inliers)/1000
 s(8).average_residual_LO_10 = double(mean(s(8).residual_length));
end

for i=1:10
 [s(9).number_inliers(i), s(9).RunTime(i), s(9).iteration_number(i),s(9).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(17:18,:), threshold, dd(1));
 s(9).averageTime_10 = mean(s(9).RunTime)
 s(9).average_num_iteration_10 = round(mean(s(9).iteration_number))
 s(9).outlierratio = 0.8
 s(9).average_inliers_ratio = mean(s(9).number_inliers)/1000
 s(9).average_residual_LO_10 = double(mean(s(9).residual_length));
end

for i=1:10
 [s(10).number_inliers(i), s(10).RunTime(i), s(10).iteration_number(i),s(10).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(19:20,:), threshold, dd(1));
 s(10).averageTime_10 = mean(s(10).RunTime)
 s(10).average_num_iteration_10 = round(mean(s(10).iteration_number))
 s(10).outlierratio = 0.9
 s(10).average_inliers_ratio = mean(s(10).number_inliers)/1000
 s(10).average_residual_LO_10 = double(mean(s(10).residual_length));
end
%%% outlier ratio 0.0-0.6
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%% d=1%%%%%%%%%%%%%%%%%%
for i=1:10
 [s(11).number_inliers(i), s(11).RunTime(i), s(11).iteration_number(i),s(11).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(1:2,:), threshold, dd(2));
 s(11).averageTime_10 = round(mean(s(11).RunTime),2)
 s(11).average_num_iteration_10 = round(mean(s(11).iteration_number))
 s(11).outlierratio = 0
 s(11).average_inliers_ratio = mean(s(11).number_inliers)/1000
 s(11).average_residual_LO_10 = double(mean(s(11).residual_length));
end
for i=1:10
 [s(12).number_inliers(i), s(12).RunTime(i), s(12).iteration_number(i),s(12).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(3:4,:), threshold, dd(2));
 s(12).averageTime_10 = round(mean(s(12).RunTime),2)
 s(12).average_num_iteration_10 = round(mean(s(12).iteration_number))
 s(12).outlierratio = 0.1
 s(12).average_inliers_ratio = mean(s(12).number_inliers)/1000
 s(12).average_residual_LO_10 = double(mean(s(12).residual_length));
end

for i=1:10
 [s(13).number_inliers(i), s(13).RunTime(i), s(13).iteration_number(i),s(13).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(5:6,:), threshold, dd(2));
 s(13).averageTime_10 = round(mean(s(13).RunTime),2)
 s(13).average_num_iteration_10 = round(mean(s(13).iteration_number))
 s(13).outlierratio = 0.2
 s(13).average_inliers_ratio = mean(s(13).number_inliers)/1000
 s(13).average_residual_LO_10 = double(mean(s(13).residual_length));
end
for i=1:10
 [s(14).number_inliers(i), s(14).RunTime(i), s(14).iteration_number(i),s(14).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(7:8,:), threshold, dd(2));
 s(14).averageTime_10 = round(mean(s(14).RunTime),2)
 s(14).average_num_iteration_10 = round(mean(s(14).iteration_number))
 s(14).outlierratio = 0.3
 s(14).average_inliers_ratio = mean(s(14).number_inliers)/1000
 s(14).average_residual_LO_10 = double(mean(s(14).residual_length));
end
for i=1:10
 [s(15).number_inliers(i), s(15).RunTime(i), s(15).iteration_number(i),s(15).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(9:10,:), threshold, dd(2));
 s(15).averageTime_10 = round(mean(s(15).RunTime),2)
 s(15).average_num_iteration_10 = round(mean(s(15).iteration_number))
 s(15).outlierratio = 0.4
 s(15).average_inliers_ratio = mean(s(15).number_inliers)/1000
 s(15).average_residual_LO_10 = double(mean(s(15).residual_length));
end

for i=1:10
 [s(16).number_inliers(i), s(16).RunTime(i), s(16).iteration_number(i),s(16).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(11:12,:), threshold, dd(2));
 s(16).averageTime_10 = round(mean(s(16).RunTime),2)
 s(16).average_num_iteration_10 = round(mean(s(16).iteration_number))
 s(16).outlierratio = 0.5
 s(16).average_inliers_ratio = mean(s(16).number_inliers)/1000
 s(16).average_residual_LO_10 = double(mean(s(16).residual_length));
end

for i=1:10
 [s(17).number_inliers(i), s(17).RunTime(i), s(17).iteration_number(i),s(17).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(13:14,:), threshold, dd(2));
 s(17).averageTime_10 = mean(s(17).RunTime)
 s(17).average_num_iteration_10 = round(mean(s(17).iteration_number))
 s(17).outlierratio = 0.6
 s(17).average_inliers_ratio = mean(s(17).number_inliers)/1000
 s(17).average_residual_LO_10 = double(mean(s(17).residual_length));
end

for i=1:10
 [s(18).number_inliers(i), s(18).RunTime(i), s(18).iteration_number(i),s(18).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(15:16,:), threshold, dd(2));
 s(18).averageTime_10 = mean(s(18).RunTime)
 s(18).average_num_iteration_10 = round(mean(s(18).iteration_number))
 s(18).outlierratio = 0.7
 s(18).average_inliers_ratio = mean(s(18).number_inliers)/1000
 s(18).average_residual_LO_10 = double(mean(s(18).residual_length));
end

for i=1:10
 [s(19).number_inliers(i), s(19).RunTime(i), s(19).iteration_number(i),s(19).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(17:18,:), threshold, dd(2));
 s(19).averageTime_10 = mean(s(19).RunTime)
 s(19).average_num_iteration_10 = round(mean(s(19).iteration_number))
 s(19).outlierratio = 0.8
 s(19).average_inliers_ratio = mean(s(19).number_inliers)/1000
 s(19).average_residual_LO_10 = double(mean(s(19).residual_length));
end

for i=1:10
 [s(20).number_inliers(i), s(20).RunTime(i), s(20).iteration_number(i),s(20).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(19:20,:), threshold, dd(2));
 s(20).averageTime_10 = mean(s(20).RunTime)
 s(20).average_num_iteration_10 = round(mean(s(20).iteration_number))
 s(20).outlierratio = 0.9
 s(20).average_inliers_ratio = mean(s(20).number_inliers)/1000
 s(20).average_residual_LO_10 = double(mean(s(20).residual_length));
end
%%
%%%%%%%%%%%%%%%%%%%  d=2 %%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
for i=1:10
 [s(21).number_inliers(i), s(21).RunTime(i), s(21).iteration_number(i),s(21).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(1:2,:), threshold, dd(3));
 s(21).averageTime_10 = mean(s(21).RunTime)
 s(21).average_num_iteration_10 = round(mean(s(21).iteration_number))
 s(21).outlierratio = 0
 s(21).average_inliers_ratio = mean(s(21).number_inliers)/1000
 s(21).average_residual_LO_10 = double(mean(s(21).residual_length));
end
for i=1:10
 [s(22).number_inliers(i), s(22).RunTime(i), s(22).iteration_number(i),s(22).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(3:4,:), threshold, dd(3));
 s(22).averageTime_10 = mean(s(22).RunTime)
 s(22).average_num_iteration_10 = round(mean(s(22).iteration_number))
 s(22).outlierratio = 0.1
 s(22).average_inliers_ratio = mean(s(22).number_inliers)/1000
 s(22).average_residual_LO_10 = double(mean(s(22).residual_length));
end

for i=1:10
 [s(23).number_inliers(i), s(23).RunTime(i), s(23).iteration_number(i),s(23).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(5:6,:), threshold, dd(3));
 s(23).averageTime_10 = mean(s(23).RunTime)
 s(23).average_num_iteration_10 = round(mean(s(23).iteration_number))
 s(23).outlierratio = 0.2
 s(23).average_inliers_ratio = mean(s(23).number_inliers)/1000
 s(23).average_residual_LO_10 = double(mean(s(23).residual_length));
end
for i=1:10
 [s(24).number_inliers(i), s(24).RunTime(i), s(24).iteration_number(i),s(24).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(7:8,:), threshold, dd(3));
 s(24).averageTime_10 = mean(s(24).RunTime)
 s(24).average_num_iteration_10 = round(mean(s(24).iteration_number))
 s(24).outlierratio = 0.3
 s(24).average_inliers_ratio = mean(s(24).number_inliers)/1000
 s(24).average_residual_LO_10 = double(mean(s(24).residual_length));
end
for i=1:10
 [s(25).number_inliers(i), s(25).RunTime(i), s(25).iteration_number(i),s(25).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(9:10,:), threshold, dd(3));
 s(25).averageTime_10 = mean(s(25).RunTime)
 s(25).average_num_iteration_10 = round(mean(s(25).iteration_number))
 s(25).outlierratio = 0.4
 s(25).average_inliers_ratio = mean(s(25).number_inliers)/1000
 s(25).average_residual_LO_10 = double(mean(s(25).residual_length));
end

for i=1:10
 [s(26).number_inliers(i), s(26).RunTime(i), s(26).iteration_number(i),s(26).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(11:12,:), threshold, dd(3));
 s(26).averageTime_10 = mean(s(26).RunTime)
 s(26).average_num_iteration_10 = round(mean(s(26).iteration_number))
 s(26).outlierratio = 0.5
 s(26).average_inliers_ratio = mean(s(26).number_inliers)/1000
 s(26).average_residual_LO_10 = double(mean(s(26).residual_length));
end

for i=1:10
 [s(27).number_inliers(i), s(27).RunTime(i), s(27).iteration_number(i),s(27).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(13:14,:), threshold, dd(3));
 s(27).averageTime_10 = mean(s(27).RunTime)
 s(27).average_num_iteration_10 = round(mean(s(27).iteration_number))
 s(27).outlierratio = 0.6
 s(27).average_inliers_ratio = mean(s(27).number_inliers)/1000
 s(27).average_residual_LO_10 = double(mean(s(27).residual_length));
end

for i=1:10
 [s(28).number_inliers(i), s(28).RunTime(i), s(28).iteration_number(i),s(28).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(15:16,:), threshold, dd(3));
 s(28).averageTime_10 = mean(s(28).RunTime)
 s(28).average_num_iteration_10 = round(mean(s(28).iteration_number))
 s(28).outlierratio = 0.7
 s(28).average_inliers_ratio = mean(s(28).number_inliers)/1000
 s(28).average_residual_LO_10 = double(mean(s(28).residual_length));
end

for i=1:10
 [s(29).number_inliers(i), s(29).RunTime(i), s(29).iteration_number(i),s(29).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(17:18,:), threshold, dd(3));
 s(29).averageTime_10 = mean(s(29).RunTime)
 s(29).average_num_iteration_10 = round(mean(s(29).iteration_number))
 s(29).outlierratio = 0.8
 s(29).average_inliers_ratio = mean(s(29).number_inliers)/1000
 s(29).average_residual_LO_10 = double(mean(s(29).residual_length));
end

for i=1:10
 [s(30).number_inliers(i), s(30).RunTime(i), s(30).iteration_number(i),s(30).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(19:20,:), threshold, dd(3));
 s(30).averageTime_10 = mean(s(30).RunTime)
 s(30).average_num_iteration_10 = round(mean(s(30).iteration_number))
 s(30).outlierratio = 0.9
 s(30).average_inliers_ratio = mean(s(30).number_inliers)/1000
 s(30).average_residual_LO_10 = double(mean(s(30).residual_length));
end
%%
% %%%%%%%%%%%%%%%%%%%%%%%%% d = 3 %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:10
 [s(31).number_inliers(i), s(31).RunTime(i), s(31).iteration_number(i),s(31).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(1:2,:), threshold, dd(4));
 s(31).averageTime_10 = mean(s(31).RunTime)
 s(31).average_num_iteration_10 = round(mean(s(31).iteration_number))
 s(31).outlierratio = 0
 s(31).average_inliers_ratio = mean(s(31).number_inliers)/1000
 s(31).average_residual_LO_10 = double(mean(s(31).residual_length));
end
for i=1:10
 [s(32).number_inliers(i), s(32).RunTime(i), s(32).iteration_number(i),s(32).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(3:4,:), threshold, dd(4));
 s(32).averageTime_10 = mean(s(32).RunTime)
 s(32).average_num_iteration_10 = round(mean(s(32).iteration_number))
 s(32).outlierratio = 0.1
 s(32).average_inliers_ratio = mean(s(32).number_inliers)/1000
 s(32).average_residual_LO_10 = double(mean(s(32).residual_length));
end

for i=1:10
 [s(33).number_inliers(i), s(33).RunTime(i), s(33).iteration_number(i),s(33).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(5:6,:), threshold, dd(4));
 s(33).averageTime_10 = mean(s(33).RunTime)
 s(33).average_num_iteration_10 = round(mean(s(33).iteration_number))
 s(33).outlierratio = 0.2
 s(33).average_inliers_ratio = mean(s(33).number_inliers)/1000
 s(33).average_residual_LO_10 = double(mean(s(33).residual_length));
end
for i=1:10
 [s(34).number_inliers(i), s(34).RunTime(i), s(34).iteration_number(i),s(34).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(7:8,:), threshold, dd(4));
 s(34).averageTime_10 = mean(s(34).RunTime)
 s(34).average_num_iteration_10 = round(mean(s(34).iteration_number))
 s(34).outlierratio = 0.3
 s(34).average_inliers_ratio = mean(s(34).number_inliers)/1000
 s(34).average_residual_LO_10 = double(mean(s(34).residual_length));
end

for i=1:10
 [s(35).number_inliers(i), s(35).RunTime(i), s(35).iteration_number(i),s(35).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(9:10,:), threshold, dd(4));
 s(35).averageTime_10 = mean(s(35).RunTime)
 s(35).average_num_iteration_10 = round(mean(s(35).iteration_number))
 s(35).outlierratio = 0.4
 s(35).average_inliers_ratio = mean(s(35).number_inliers)/1000
 s(35).average_residual_LO_10 = double(mean(s(35).residual_length));
end


for i=1:10
 [s(36).number_inliers(i), s(36).RunTime(i), s(36).iteration_number(i),s(36).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(11:12,:), threshold, dd(4));
 s(36).averageTime_10 = mean(s(36).RunTime)
 s(36).average_num_iteration_10 = round(mean(s(36).iteration_number))
 s(36).outlierratio = 0.5
 s(36).average_inliers_ratio = mean(s(36).number_inliers)/1000
 s(36).average_residual_LO_10 = double(mean(s(36).residual_length));
end

for i=1:10
 [s(37).number_inliers(i), s(37).RunTime(i), s(37).iteration_number(i),s(37).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(13:14,:), threshold, dd(4));
 s(37).averageTime_10 = mean(s(37).RunTime)
 s(37).average_num_iteration_10 = round(mean(s(37).iteration_number))
 s(37).outlierratio = 0.6
 s(37).average_inliers_ratio = mean(s(37).number_inliers)/1000
 s(37).average_residual_LO_10 = double(mean(s(37).residual_length));
end

for i=1:10
 [s(38).number_inliers(i), s(38).RunTime(i), s(38).iteration_number(i),s(38).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(15:16,:), threshold, dd(4));
 s(38).averageTime_10 = mean(s(38).RunTime)
 s(38).average_num_iteration_10 = round(mean(s(38).iteration_number))
 s(38).outlierratio = 0.7
 s(38).average_inliers_ratio = mean(s(38).number_inliers)/1000
 s(38).average_residual_LO_10 = double(mean(s(38).residual_length));
end

for i=1:10
 [s(39).number_inliers(i), s(39).RunTime(i), s(39).iteration_number(i),s(39).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(17:18,:), threshold, dd(4));
 s(39).averageTime_10 = mean(s(39).RunTime)
 s(39).average_num_iteration_10 = round(mean(s(39).iteration_number))
 s(39).outlierratio = 0.8
 s(39).average_inliers_ratio = mean(s(39).number_inliers)/1000
 s(39).average_residual_LO_10 = double(mean(s(39).residual_length));
end

for i=1:10
 [s(40).number_inliers(i), s(40).RunTime(i), s(40).iteration_number(i),s(40).residual_length(i)] = R_RANSAC(pts(1:2,:), pts_tilde(19:20,:), threshold, dd(4));
 s(40).averageTime_10 = mean(s(40).RunTime)
 s(40).average_num_iteration_10 = round(mean(s(40).iteration_number))
 s(40).outlierratio = 0.9
 s(40).average_inliers_ratio = mean(s(40).number_inliers)/1000
 s(40).average_residual_LO_10 = double(mean(s(40).residual_length));
end

for j = 1:40
outlierratio(j) = s(j).outlierratio
average_num_iteration_10(j) = s(j).average_num_iteration_10
averageTime_10(j) =  (s(j).averageTime_10)
end

%%
% load('struct2.mat')

%%% Plot Figures
% load('struct1.mat')
% for j = 1:40
% outlierratio(j) = s(j).outlierratio
% average_num_iteration_10(j) = s(j).average_num_iteration_10
% averageTime_10(j) =  (s(j).averageTime_10)
% end
for j = 1:40
outlierratio(j) = s(j).outlierratio
average_num_iteration_10(j) = s(j).average_num_iteration_10
averageTime_10(j) =  (s(j).averageTime_10)./1000
end
figure(1)
    semilogy(outlierratio(1:10), average_num_iteration_10(1:10));
    hold on
    semilogy(outlierratio(11:20), average_num_iteration_10(11:20));
    hold on
    semilogy(outlierratio(21:30), average_num_iteration_10(21:30));
    hold on
    semilogy(outlierratio(31:40), average_num_iteration_10(31:40));
    hold on
    xlabel('Outlier ratio [-]')
    ylabel('RANSAC iterations number [-]')
    legend('d = 0','d = 1','d = 2','d = 3','Location','southeast')
    grid on
    title('RANSAC iterations vs Outlier ratio')

figure(2)
    semilogy(outlierratio(1:10), averageTime_10(1:10));
    hold on
    semilogy(outlierratio(11:20), averageTime_10(11:20));
    hold on
    semilogy(outlierratio(21:30), averageTime_10(21:30));
    hold on
   semilogy(outlierratio(31:40), averageTime_10(31:40));
    hold on
    xlabel('Outlier ratio [-]')
    ylabel('Runtime [s]')
    legend('d = 0','d = 1','d = 2','d = 3','Location','southeast')
    grid on
    title('RANSAC runtime vs Outlier ratio')
  %%
% 
% 3. Extend the RANSAC with Local Optimization (LO) and Create Table %%%%%%%%%%%%% 
% % % %%%%%%%%%%%%%%%%%%%%%%%%%% Start Loop for With LO %%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dd_lo = 1;
threshold_lo = 10;


%%%%%%%%%%%% Outlier ratio = 0 %%%%%%%%%%%

for i = 1:10
    [ s_LO(1).number_inliers(i), s_LO(1).RunTime(i), s_LO(1).iteration_number(i), s_LO(1).inlier_ratio(i),s_LO(1).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(1:2,:), threshold_lo,dd_lo)

 s_LO(1).averageTime_10 = double(mean(s_LO(1).RunTime));
s_LO(1).average_num_iteration_10 = round(double(mean(s_LO(1).iteration_number)));
 s_LO(1).outlierratio = 0;
  s_LO(1).noise = 1;
 s_LO(1).average_inlier_ratio_10 = double(mean(s_LO(1).inlier_ratio));
 s_LO(1).average_number_of_inlier_10 = round(double(mean(s_LO(1).number_inliers)));
 s_LO(1).average_residual_LO_10 = double(mean(s_LO(1).residual_length));
  
  
end

% % % %%%%%%%%%%%% Outlier ratio = 0.1 %%%%%%%%%%%
for i = 1:10
    [ s_LO(2).number_inliers(i), s_LO(2).RunTime(i), s_LO(2).iteration_number(i), s_LO(2).inlier_ratio(i),s_LO(2).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(3:4,:), threshold_lo,dd_lo)

 s_LO(2).averageTime_10 = double(mean(s_LO(2).RunTime));
s_LO(2).average_num_iteration_10 = round(double(mean(s_LO(2).iteration_number)));
 s_LO(2).outlierratio = 0.1;
  s_LO(2).noise = 1;
 s_LO(2).average_inlier_ratio_10 = double(mean(s_LO(2).inlier_ratio));
 s_LO(2).average_number_of_inlier_10 = round(double(mean(s_LO(2).number_inliers)));
 s_LO(2).average_residual_LO_10 = double(mean(s_LO(2).residual_length));
  
  
end


 % % %%%%%%%%%%%% Outlier ratio = 0.2 %%%%%%%%%%%
% % 
for i = 1:10
    [ s_LO(3).number_inliers(i), s_LO(3).RunTime(i), s_LO(3).iteration_number(i), s_LO(3).inlier_ratio(i),s_LO(3).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(5:6,:), threshold_lo,dd_lo)

 s_LO(3).averageTime_10 = double(mean(s_LO(3).RunTime));
s_LO(3).average_num_iteration_10 = round(double(mean(s_LO(3).iteration_number)));
 s_LO(3).outlierratio = 0.2;
  s_LO(3).noise = 1;
 s_LO(3).average_inlier_ratio_10 = double(mean(s_LO(3).inlier_ratio));
 s_LO(3).average_number_of_inlier_10 = round(double(mean(s_LO(3).number_inliers)));
 s_LO(3).average_residual_LO_10 = double(mean(s_LO(3).residual_length));
  
  
end

 % %%%%%%%%%%%% Outlier ratio = 0.3 %%%%%%%%%%%
for i = 1:10
    [ s_LO(4).number_inliers(i), s_LO(4).RunTime(i), s_LO(4).iteration_number(i), s_LO(4).inlier_ratio(i),s_LO(4).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(7:8,:), threshold_lo,dd_lo)

 s_LO(4).averageTime_10 = double(mean(s_LO(4).RunTime));
s_LO(4).average_num_iteration_10 = round(double(mean(s_LO(4).iteration_number)));
 s_LO(4).outlierratio = 0.3;
  s_LO(4).noise = 1;
 s_LO(4).average_inlier_ratio_10 = double(mean(s_LO(4).inlier_ratio));
 s_LO(4).average_number_of_inlier_10 = round(double(mean(s_LO(4).number_inliers)));
 s_LO(4).average_residual_LO_10 = double(mean(s_LO(4).residual_length));
  
  
end

%%%%%%%%%%%% Outlier ratio = 0.4 %%%%%%%%%%%
for i = 1:10
    [ s_LO(5).number_inliers(i), s_LO(5).RunTime(i), s_LO(5).iteration_number(i), s_LO(5).inlier_ratio(i),s_LO(5).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(9:10,:), threshold_lo,dd_lo)

 s_LO(5).averageTime_10 = double(mean(s_LO(5).RunTime));
s_LO(5).average_num_iteration_10 = round(double(mean(s_LO(5).iteration_number)));
 s_LO(5).outlierratio = 0.4;
  s_LO(5).noise = 1;
 s_LO(5).average_inlier_ratio_10 = double(mean(s_LO(5).inlier_ratio));
 s_LO(5).average_number_of_inlier_10 = round(double(mean(s_LO(5).number_inliers)));
 s_LO(5).average_residual_LO_10 = double(mean(s_LO(5).residual_length));
  
  
end
% % % % 
% 
% % % %%%%%%%%%%%% Outlier ratio = 0.5 %%%%%%%%%%%

for i = 1:10
    [ s_LO(6).number_inliers(i), s_LO(6).RunTime(i), s_LO(6).iteration_number(i), s_LO(6).inlier_ratio(i),s_LO(6).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(11:12,:), threshold_lo,dd_lo)

 s_LO(6).averageTime_10 = double(mean(s_LO(6).RunTime));
s_LO(6).average_num_iteration_10 = round(double(mean(s_LO(6).iteration_number)));
 s_LO(6).outlierratio = 0.5;
  s_LO(6).noise = 1;
 s_LO(6).average_inlier_ratio_10 = double(mean(s_LO(6).inlier_ratio));
 s_LO(6).average_number_of_inlier_10 = double(mean(s_LO(6).number_inliers));
 s_LO(6).average_residual_LO_10 = double(mean(s_LO(6).residual_length));
  
  
end
% % % 
% % % 
% %%%%%%%%%%%% Outlier ratio = 0.6 %%%%%%%%%%%

for i = 1:10
    [ s_LO(7).number_inliers(i), s_LO(7).RunTime(i), s_LO(7).iteration_number(i), s_LO(7).inlier_ratio(i),s_LO(7).residual_length(i)] ...
    = LO_RANSAC_all_2(pts(1:2,:), pts_tilde(13:14,:), threshold_lo,dd_lo)

 s_LO(7).averageTime_10 = double(mean(s_LO(7).RunTime));
s_LO(7).average_num_iteration_10 = round(double(mean(s_LO(7).iteration_number)));
 s_LO(7).outlierratio = 0.6;
  s_LO(7).noise = 1;
 s_LO(7).average_inlier_ratio_10 = double(mean(s_LO(7).inlier_ratio));
 s_LO(7).average_number_of_inlier_10 = round(double(mean(s_LO(7).number_inliers)));
 s_LO(7).average_residual_LO_10 = double(mean(s_LO(7).residual_length));
  
  
end

%%
% 
% 3. Extend the RANSAC with Local Optimization (LO) with modification and Create Table %%%%%%%%%%%%% 
% % % %%%%%%%%%%%%%%%%%%%%%%%%%% Start Loop for With LO %%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%% Outlier ratio = 0 %%%%%%%%%%%
outlier_ratio_1 = 0;
for i = 1:10
    [ s_LO(8).number_inliers(i), s_LO(8).RunTime(i), s_LO(8).iteration_number(i), s_LO(8).inlier_ratio(i),s_LO(8).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(1:2,:), threshold_lo,dd_lo,outlier_ratio_1)

 s_LO(8).averageTime_10 = double(mean(s_LO(8).RunTime));
s_LO(8).average_num_iteration_10 = round(double(mean(s_LO(8).iteration_number)));
 s_LO(8).outlierratio = 0;
  s_LO(8).noise = 1;
 s_LO(8).average_inlier_ratio_10 = double(mean(s_LO(8).inlier_ratio));
 s_LO(8).average_number_of_inlier_10 = round(double(mean(s_LO(8).number_inliers)));
 s_LO(8).average_residual_LO_10 = double(mean(s_LO(8).residual_length));
  
  
end
outlier_ratio_2 = 0.1;
% % % %%%%%%%%%%%% Outlier ratio = 0.1 %%%%%%%%%%%
for i = 1:10
    [ s_LO(9).number_inliers(i), s_LO(9).RunTime(i), s_LO(9).iteration_number(i), s_LO(9).inlier_ratio(i),s_LO(9).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(3:4,:), threshold_lo,dd_lo, outlier_ratio_2)

 s_LO(9).averageTime_10 = double(mean(s_LO(9).RunTime));
s_LO(9).average_num_iteration_10 = round(double(mean(s_LO(9).iteration_number)));
 s_LO(9).outlierratio = 0.1;
  s_LO(9).noise = 1;
 s_LO(9).average_inlier_ratio_10 = double(mean(s_LO(9).inlier_ratio));
 s_LO(9).average_number_of_inlier_10 = round(double(mean(s_LO(9).number_inliers)));
 s_LO(9).average_residual_LO_10 = double(mean(s_LO(9).residual_length));
  
  
end

outlier_ratio_3 = 0.2;
 % % %%%%%%%%%%%% Outlier ratio = 0.2 %%%%%%%%%%%
% % 
for i = 1:10
    [ s_LO(10).number_inliers(i), s_LO(10).RunTime(i), s_LO(10).iteration_number(i), s_LO(10).inlier_ratio(i),s_LO(10).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(5:6,:), threshold_lo,dd_lo,outlier_ratio_3)

 s_LO(10).averageTime_10 = double(mean(s_LO(10).RunTime));
s_LO(10).average_num_iteration_10 = round(double(mean(s_LO(10).iteration_number)));
 s_LO(10).outlierratio = 0.2;
  s_LO(10).noise = 1;
 s_LO(10).average_inlier_ratio_10 = double(mean(s_LO(10).inlier_ratio));
 s_LO(10).average_number_of_inlier_10 = round(double(mean(s_LO(10).number_inliers)));
 s_LO(10).average_residual_LO_10 = double(mean(s_LO(10).residual_length));
  
  
end

outlier_ratio_4 = 0.3;
 % %%%%%%%%%%%% Outlier ratio = 0.3 %%%%%%%%%%%
for i = 1:10
    [ s_LO(11).number_inliers(i), s_LO(11).RunTime(i), s_LO(11).iteration_number(i), s_LO(11).inlier_ratio(i),s_LO(11).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(7:8,:), threshold_lo,dd_lo,outlier_ratio_4)

 s_LO(11).averageTime_10 = double(mean(s_LO(11).RunTime));
s_LO(11).average_num_iteration_10 = round(double(mean(s_LO(11).iteration_number)));
 s_LO(11).outlierratio = 0.3;
  s_LO(11).noise = 1;
 s_LO(11).average_inlier_ratio_10 = double(mean(s_LO(11).inlier_ratio));
 s_LO(11).average_number_of_inlier_10 = round(double(mean(s_LO(11).number_inliers)));
 s_LO(11).average_residual_LO_10 = double(mean(s_LO(11).residual_length));
  
  
end

outlier_ratio_5 = 0.4;
%%%%%%%%%%%% Outlier ratio = 0.4 %%%%%%%%%%%
for i = 1:10
    [ s_LO(12).number_inliers(i), s_LO(12).RunTime(i), s_LO(12).iteration_number(i), s_LO(12).inlier_ratio(i),s_LO(12).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(9:10,:), threshold_lo,dd_lo,outlier_ratio_5)

 s_LO(12).averageTime_10 = double(mean(s_LO(12).RunTime));
s_LO(12).average_num_iteration_10 = round(double(mean(s_LO(12).iteration_number)));
 s_LO(12).outlierratio = 0.4;
  s_LO(12).noise = 1;
 s_LO(12).average_inlier_ratio_10 = double(mean(s_LO(12).inlier_ratio));
 s_LO(12).average_number_of_inlier_10 = round(double(mean(s_LO(12).number_inliers)));
 s_LO(12).average_residual_LO_10 = double(mean(s_LO(12).residual_length));
  
  
end
% % % % 
% 
% % % %%%%%%%%%%%% Outlier ratio = 0.5 %%%%%%%%%%%
outlier_ratio_6 = 0.5;
for i = 1:10
    [ s_LO(13).number_inliers(i), s_LO(13).RunTime(i), s_LO(13).iteration_number(i), s_LO(13).inlier_ratio(i),s_LO(13).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(11:12,:), threshold_lo,dd_lo,outlier_ratio_6)

 s_LO(13).averageTime_10 = double(mean(s_LO(13).RunTime));
s_LO(13).average_num_iteration_10 = round(double(mean(s_LO(13).iteration_number)));
 s_LO(13).outlierratio = 0.5;
  s_LO(13).noise = 1;
 s_LO(13).average_inlier_ratio_10 = double(mean(s_LO(13).inlier_ratio));
 s_LO(13).average_number_of_inlier_10 = double(mean(s_LO(13).number_inliers));
 s_LO(13).average_residual_LO_10 = double(mean(s_LO(13).residual_length));
  
  
end
% % % 
% % % 
% %%%%%%%%%%%% Outlier ratio = 0.6 %%%%%%%%%%%
outlier_ratio_7 = 0.6;
for i = 1:10
    [ s_LO(14).number_inliers(i), s_LO(14).RunTime(i), s_LO(14).iteration_number(i), s_LO(14).inlier_ratio(i),s_LO(14).residual_length(i)] ...
    = LO_RANSAC_all_mod_2(pts(1:2,:), pts_tilde(13:14,:), threshold_lo,dd_lo,outlier_ratio_7 )

 s_LO(14).averageTime_10 = double(mean(s_LO(14).RunTime));
s_LO(14).average_num_iteration_10 = round(double(mean(s_LO(14).iteration_number)));
 s_LO(14).outlierratio = 0.6;
  s_LO(14).noise = 1;
 s_LO(14).average_inlier_ratio_10 = double(mean(s_LO(14).inlier_ratio));
 s_LO(14).average_number_of_inlier_10 = round(double(mean(s_LO(14).number_inliers)));
 s_LO(14).average_residual_LO_10 = double(mean(s_LO(14).residual_length));
  
  
end
%%
% % % 
% % % % % % % % 
% % % % % % % % %%% 4. For a Fixed Outlier ratio of 0.4, vary the amount of noises sigma%%%
% % % % % % % %%%%%%%%%%%%%%%%%%%%%% added to correspondences.%%%%%%%%%%%%%%%%%%%%%%%
% % % 
outlier_rate_2 = 40;
noise2 = 0;
noise3 = [0.5 1 2 4 8 16];
dd_lo = 1;

K = 100;

[pts_2(1:2,:),pts_tildee(1:2,:), A_true_2(1:2,:), t_true_2(1:2,:)]=affine_test_case(K, noise2);
idx = 1;

for i = 1:length(noise3)
 pts_tilde_2(idx:idx+1,:) = noise_addition(A_true_2(1:2,:), t_true_2(1:2,:),pts_2(1:2,:),noise3(i),K,outlier_rate_2);
 idx = idx + 2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%% With Local Optimization %%%%%%%%%%%%%%%%%%%%%%%
 
% % %%%%%%%%%%%%% Sigma = 0.5 %%%%%%%%%%%%%%%
threshold_lo_half = 1.39*3;
j = 1;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(1:2,:), threshold_lo_half,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 0.5;
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));

 
end

% % %%%%%%%%%%%%%%% Sigma = 1 %%%%%%%%%%%%%%%%%
threshold_lo_1 = 1.96*3;
j = 2;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(3:4,:), threshold_lo_1,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 1;
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
 s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  
  
end



% 
% %%%%%%%%%%%%%%% Sigma = 2 %%%%%%%%%%%%%%%%%
threshold_lo_2 = 2.77*3;
j = 3;


for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(5:6,:), threshold_lo_2,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 2;
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  
end

% 
% %%%%%%%%%%%%%%% Sigma = 4 %%%%%%%%%%%%%%%%%
threshold_lo_3 = 3.92*3;
j = 4;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(7:8,:), threshold_lo_3,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 4;
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  
end

% 
% %%%%%%%%%%%%%%% Sigma = 8 %%%%%%%%%%%%%%%%%.
threshold_lo_4 = 5.54*3;
j = 5;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(9:10,:), threshold_lo_4,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 8;
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));

end

% 
% %%%%%%%%%%%%%%% Sigma = 16 %%%%%%%%%%%%%%%%%
threshold_lo_5 = 7.84*3;
j = 6;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).inlier_ratio(i),s_noise(j).residual_length(i)] = LO_RANSAC_all_2(pts_2(1:2,:), pts_tilde_2(11:12,:), threshold_lo_5,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 16;
  
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
 s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
 
end


% field = {'residual_length_LO','number_inliers','RunTime','iteration_number','inlier_ratio'};
% RANSAC_metrics_2 = rmfield(s_LO,field);
% % % 
% T2 = struct2table(RANSAC_metrics_2)
% T2.Properties.VariableNames{1} = 'Average RunTime';
% T2.Properties.VariableNames{2} = 'Average Number of Iterations';
% T2.Properties.VariableNames{3} = 'Outlier ratios';
% 
% T2.Properties.VariableNames{4} = 'Noise (Sigma)';
% T2.Properties.VariableNames{5} = 'Average Inlier ratios';
% T2.Properties.VariableNames{6} = 'Average Number of Inliers';
% T2.Properties.VariableNames{7} = 'Average Residual Length';
% save('Table2.mat','T2');



%%%%%%%%%%%%%%%%%%%%%%%%%%% Without Local Optimization %%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%% Sigma = 0.5 %%%%%%%%%%%%%%%
threshold_lo_half = 3*1.39;
j = 7;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i), s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(1:2,:), threshold_lo_half,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 0.5;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
 
end

% % %%%%%%%%%%%%%%% Sigma = 1 %%%%%%%%%%%%%%%%%
threshold_lo_1 = 3*1.96;
j = 8;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i),s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(3:4,:), threshold_lo_1,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 1;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
 s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
  
end



% 
% %%%%%%%%%%%%%%% Sigma = 2 %%%%%%%%%%%%%%%%%
threshold_lo_2 = 3*2.77;
j = 9;


for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i),s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(5:6,:), threshold_lo_2,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 2;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
end

% 
% %%%%%%%%%%%%%%% Sigma = 4 %%%%%%%%%%%%%%%%%
threshold_lo_3 = 3*3.92;
j = 10;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i),s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(7:8,:), threshold_lo_3,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 4;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
  s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
end

% 
% %%%%%%%%%%%%%%% Sigma = 8 %%%%%%%%%%%%%%%%%.
threshold_lo_4 = 3*5.54;
j = 11;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i),s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(9:10,:), threshold_lo_4,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 8;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
end

% 
% %%%%%%%%%%%%%%% Sigma = 16 %%%%%%%%%%%%%%%%%
threshold_lo_5 = 3*7.84;
j = 12;

for i = 1:10
[ s_noise(j).number_inliers(i), s_noise(j).RunTime(i), s_noise(j).iteration_number(i),s_noise(j).residual_length(i), s_noise(j).inlier_ratio(i)] = R_RANSAC(pts_2(1:2,:), pts_tilde_2(11:12,:), threshold_lo_5,dd_lo)
 s_noise(j).averageTime_10 = double(mean(s_noise(j).RunTime));
s_noise(j).average_num_iteration_10 = double(mean(s_noise(j).iteration_number));
 s_noise(j).outlierratio = 0.4;
  s_noise(j).noise = 16;
 s_noise(j).average_number_of_inlier_10 = double(mean(s_noise(j).number_inliers));
  s_noise(j).average_residual_LO_10 = double(mean(s_noise(j).residual_length));
 s_noise(j).average_inlier_ratio_10 = double(mean(s_noise(j).inlier_ratio));
end
%%
load('struct1.mat')
load('struct2.mat')
load('struct3.mat')