function residual_lgths = residual_lgths(A, t, pts, pts_tilde)
pts_prime=A*pts+t;
e=abs(pts_prime-pts_tilde);
residual_lgths=sum(e.^2, 1);
end