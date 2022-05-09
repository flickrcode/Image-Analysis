function [A,t, number_outliers, inlierpos] = ransac_fit_affine(pts, pts_tilde, threshold)
oldnumb=0;
for i=1:1000
ind=randperm(length(pts),3);
[A2, t2] = estimate_affine(pts(:,ind), pts_tilde(:,ind));

residual = residual_lgths(A2, t2, pts, pts_tilde);
inliers=residual<threshold;
inlierspos2=[];
inlierpos2=find(inliers==1);
number_inliers=sum(inliers);

if number_inliers>oldnumb
inlierpos=[];
A=A2;
t=t2;
oldnumb=number_inliers;
inlierpos=inlierpos2;
end

end
number_outliers=length(pts)-oldnumb;
end