clear all
clc
close all
load sequence

%% Code to run the ransac triangulation with sequence.mat as input

threshold = 5;
idx = 1;

for i = 1:size(triangulation_examples,2)
    %%% Deactivate the comment for 1000 examples %%%%%
%      if i == 1000
%     break
%      end

    triangulation = triangulation_examples(i);
    us = triangulation.xs;
    Ps = triangulation.Ps;

% Call the RANSAC algorithm
 [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold);
  

 % Save the Unknown values if it has inlier more than 2
    if nbr_inliers > 2
        Us(:,idx) = U;
        idx = idx + 1;
    end
    

end

Uc = clean_for_plot(Us);
scatter3(Uc(1,:),Uc(2,:),Uc(3,:),1,'filled')
axis equal
