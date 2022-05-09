function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold)
% Define the initial conditions and inputs
% oldnumb=0;
k = 0;
k_max = 1000;
% epsilon_0 = 0;
% epsilon = epsilon_0;
% n=2;
m = length(Ps);
U_update = NaN(1,3);
nbr_inlier = 0;


sign = 0.90;

% Start the while loop

 while k < k_max
     
ind=randperm(m,3);
Ps_ransac = Ps(ind);
us_ransac= us(:,ind);

% Calculate the result of triangulation
U_ransac = minimal_triangulation(Ps_ransac, us_ransac)

% Check if Depth is positive
positive_ransac = check_depths(Ps, U_ransac);

% Find the reprojection error
errors_ransac = reprojection_errors(Ps,us,U_ransac)


% Define as inliers if the depth is positive and 
% if the reprojection error is larger than threshold
support_model = 0;
for j = 1:length(positive_ransac)
 if  errors_ransac(j)<threshold && positive_ransac(j)== 1
                support_model = support_model+1;
 
end
end


% If more inlier than previous best model..update it    
if support_model>nbr_inlier
    
U_update=U_ransac;
nbr_inlier=support_model;
epsilon = support_model/m;
k_max=ceil(log(sign)/log(1-epsilon^2));

end
k = k+1;
 end
 
 % Fetch the estimated U and its corresponding number of inliers
 U = U_update;
 nbr_inliers = nbr_inlier;
end