function warped = align_images(source, target, threshold, upright)

[pts1, descs1] = extractSIFT(mean(source,3),upright);
[pts2, descs2] = extractSIFT(mean(target,3),upright);
corrs = matchFeatures(descs1', descs2', 'MaxRatio', 0.8, 'MatchThreshold', 100);

[A,t, number_outliers, inlierpos] = ransac_fit_affine(pts2(:,corrs(:,2)), pts1(:,corrs(:,1)), threshold);
target_size=size(target);

%new part
pts_new=pts1(:,corrs(inlierpos,1));
pts_tilde_new=pts2(:,corrs(inlierpos,2));

[A, t] = least_squares_affine(pts_tilde_new,pts_new)

warped = affine_warp(target_size, source, A, t);


end