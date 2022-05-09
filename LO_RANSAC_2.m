function [I_LO,r_LO] = LO_RANSAC_2( reps,pts, pts_tilde, I_old_idx, threshold)
 
I_LO = zeros(10,1);
store = [];
% S_LO = zeros(10,); 
for r = 1:reps
    size_2 = min([length(I_old_idx) 12]);
    S_LO(r,1:size_2) = randsample( I_old_idx,size_2,true);     % Non-Minimal Sample S from Inliers
   
    
end
 S_LO_fin = reshape(S_LO,1,[]);
 [ A_best_LO_2, t_best_LO_2] = least_squares_affine(pts(:,S_LO_fin), pts_tilde(:,S_LO_fin)); % Find a new transformation estimate
    
    residual_4 = residual_lgths(A_best_LO_2,t_best_LO_2, pts, pts_tilde)
    I_best_LO_2 =residual_4 < threshold;
    I_best_LO_2_pos=find(I_best_LO_2==1);
    size_I_best_LO_2 = length(I_best_LO_2_pos);
   
    store.I_LO =  size_I_best_LO_2;
     
    residual_L = residual_4(residual_4 < threshold);
     
    store.residual = residual_L;
    store.mean_residual = mean(residual_L);

    I_LO = store.I_LO
    r_LO =store.mean_residual

end