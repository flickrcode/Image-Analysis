function errors = reprojection_errors(Ps, us, U)
 
  errors = zeros(length(Ps),1);
  U_aug = [U;1];
  
    for i = 1:length(Ps)
        UU = Ps{i}*U_aug;
        lambda = UU(3);
        
        if lambda < 0
            errors(i) = Inf;
        else
            u_hat = UU(1:2)./lambda;
            
            % Calculate the reporjection residuals
            r_theta = u_hat - us(1:2,i);
            
            % Calculate the reprojection errors
            errors(i) = norm(r_theta);
        
        end
    end

end


