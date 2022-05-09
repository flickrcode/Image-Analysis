function [A, t] = estimate_affine(pts, pts_tilde)
k=1;
h=2;
for i=1:length(pts)
A_matrix(k:h,:)=[pts(1,i) pts(2 ,i) 0 0 1 0; 0 0  pts(1,i) pts(2,i) 0 1];
b(k:h, 1)=[pts_tilde(1,i) ;pts_tilde(2,i)];

k=k+2;
h=h+2;

end
x=A_matrix\b;
A=[x(1) x(2); x(3), x(4)];
t=[x(5); x(6)];
end