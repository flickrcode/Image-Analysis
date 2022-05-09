function jacobian = compute_jacobian(Ps, U) 
    idx = 1;
    U_aug  = [U;1];
    
    for i = 1:length(Ps)
        P_temp = Ps{i};
       lambda_u = Ps{i}*U_aug
        
       % Find the 3 row elements of PUhat 
        a_transpose_Uhat =lambda_u(1);
        b_transpose_Uhat = lambda_u(2);
        lambda = lambda_u(3);
        
        % Find the 3 row elements of P
        a_transpose = P_temp(1,1:3);
        b_transpose = P_temp(2,1:3);
        c_transpose = P_temp(3,1:3);
        
        % Compute the Jacobian
        jacobian(idx,:) = a_transpose./lambda - a_transpose_Uhat*c_transpose/(lambda^2);
        jacobian(idx+1,:) = b_transpose./lambda -    b_transpose_Uhat*c_transpose/(lambda^2);
        
 
        idx = idx + 2;
    end


end