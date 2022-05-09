function U = refine_triangulation(Ps, us, Uhat)
    U = Uhat;   
    for i = 1:5
        % Compute the stacked vector of residuals
        r_bar = compute_residuals(Ps, us, U);
        
        % Compute the jacobian terms
        jacobian_terms = compute_jacobian(Ps, U);
        
        % Start the Gauss-Newton iteration
        delta_theta = jacobian_terms\(-r_bar)
        theta = U;
        theta = theta + delta_theta;
        
        U = theta;
        
        % Print the results
        print = 'The sum of squared residual after iteration %1.0f is %4.3f\n';
       fprintf(print, i, (norm(delta_theta)^2))
    end
end