function [ number_inliers_best, RunTime, k, inlier_ratio_best,residual_output_best] = LO_RANSAC_all_2(pts, pts_tilde, threshold,dd)

% Define the initial conditions and inputs
k = 0;
if dd == 0
k_max=4000;
elseif dd == 1
k_max=12000;
elseif dd == 2
k_max=60000;  
elseif dd == 3
k_max=2000000;    
end
m = length(pts);

% Confidence number percentage definition
eta = 0.90;

% Start the while loop
I_old=0;
I_3_num = 0;
I_old_idx = 0;
residual_final = 0;
I_LO = 0;
A_best = 0;
t_best = 0;
A_new_best = 0;
t_new_best = 0;

% Define the runtime calculation conditions
minTime = Inf;
tic;  % TIC, pair 1

while k < k_max
    tStart = tic;  % TIC, pair 2  
    
%%%%Find the initial model and evaluate on all correspondences only %%%%%%
%%%%%%%%%%%if Td,d test is passed (e.g. if all d are inliers)%%%%%%%%%%%%%

S_min=randperm(length(pts),3); % Select a random sample of minimum size 3 from the set of data points
[A2, t2] = estimate_affine(pts(:,S_min), pts_tilde(:,S_min)) % Estimate model parameters fitting the sample.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Td,d test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if dd > 0

% Draw a random sample d from correspondences
S_d = randsample(length(pts),dd);

% Find the d correspondence from Tdd test random sample index S_d
pts_dd = pts(:,S_d);
pts_tilde_dd = pts_tilde(:,S_d);

% Check if the d correspondences are inliers 
residual = residual_lgths(A2, t2, pts_dd, pts_tilde_dd); % Calculate the residual length
inliers= residual<threshold% Define as inlier if the residual is less than threshold
I_2_idx = find(inliers==1);
I_2_num = length(I_2_idx)

size_B = size(S_d,1);      %define number of element in array B
C = intersect(I_2_idx,S_d);%find intersection between array list of inliers & array d samples and save as C
size_C = size(C,1);        %define number of element in array C


% Check if the individual random samples d are all inliers to M, if it is,
 % then use the evaluated model on all correspondences inliers.
 % otherwise increment k iteration $
if size_C==size_B
residual = residual_lgths(A2, t2, pts, pts_tilde); % Calculate the residual length
inliers= residual<threshold% Define as inlier if the residual is less than threshold
I_2_idx= find(inliers==1); % 
I_2_num = length(I_2_idx);
I_3_num = I_2_num;
I_3_idx = I_2_idx;
else
    k=k+1;
   continue
end

% d = 0, the number of inliers is equal to the result of normal RANSAC by
% evaluating on all corresponodences
elseif dd==0
residual = residual_lgths(A2, t2, pts, pts_tilde); % Calculate the residual length at all correspondences
inliers= residual<threshold% Define as inlier if the residual is less than threshold
I_2_idx= find(inliers==1); % 
I_2_num = length(I_2_idx);
I_3_num = I_2_num;
I_3_idx = I_2_idx;
end
    
   
%%% If more inlier than previous best model and Td,d passed..update it%% 
%%%%%%%%%%%%%%%%% If not passed, move to next iteration %%%%%%%%%%%%%%%%

if  I_3_num > I_old 
I_old_idx = I_3_idx;
I_old= I_3_num;
A_best=A2;
t_best = t2;

if dd == 0
k_max=ceil(log(eta)/log(1-epsilon^3));
elseif dd == 1
k_max=ceil(log(eta)/log(1-epsilon^4));
elseif dd == 2
k_max=ceil(log(eta)/log(1-epsilon^5));  
elseif dd == 3
k_max=ceil(log(eta)/log(1-epsilon^6));    
end

else
k=k+1;
continue
end

A_new_best=A_best;
t_new_best = t_best;

  % Start the Local Optimization process 
  reps = 10;
[ I_LO, r_LO ] = LO_RANSAC_2( reps,pts, pts_tilde, I_old_idx, threshold)


% Update the residual length if inliers number of LO is more than Td,d %
 if I_LO >  I_old
         residual_final = r_LO;
          I_old = I_LO;
           epsilon =  I_old/m;
 else
        I_old  =  I_3_num;
        residual_final = mean(residual(residual<threshold));
        epsilon =  I_old/m;
 end
  k=k+1;
  

 
end
tElapsed = toc(tStart);  % TOC, pair 2  
minTime = min(tElapsed, minTime);

 % Fetch the estimated U and its corresponding number of inliers
 residual_output_best = residual_final;
 number_outliers_best=length(pts)- I_old;
 number_inliers_best = 100-round(number_outliers_best);
 inlier_ratio_best = number_inliers_best/m;
 RunTime = toc*1000;  % TOC, pair 1 