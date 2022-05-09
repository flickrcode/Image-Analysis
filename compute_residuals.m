function all_residuals = compute_residuals(Ps, us, U)
    idx = 1;
    U_aug = [U;1];
    
    for i = 1:length(Ps)
        % Calculate lambda(depths)
        UU = Ps{i}*U_aug;
        lambda = UU(3);

        % Calculate the estimation of u
        u_hat = UU(1:2)./lambda;
        
        % Calculate the reprojection residuals as before
        r_theta = u_hat - us(:,i);
        
        % Stack the reprojection residuals
        stack(idx:idx+1) = r_theta;
        idx = idx + 2;
        
        all_residuals = stack.';
    end
end