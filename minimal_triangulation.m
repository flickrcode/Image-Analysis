function [U,theta] = minimal_triangulation(Ps, us)
% Add ones to each us matrix
    u_a = [us(:,1);1];
    u_b = [us(:,2);1];
    
   % Construct the quadratic system
    A_a = Ps{1}(:,1:3);
    t_a = Ps{1}(:,end);
    
    A_b = Ps{2}(:,1:3);
    t_b = Ps{2}(:,end);
    
    t = [t_a;t_b];
    
    z = zeros(3,1);
  
    % Construct the M matrix
    M_1 = [A_a -u_a z];
    M_2 = [A_b z -u_b];
    
    
    % Solve as M*theta = b
    M = [M_1;M_2];
    b = -1*t;
    
    theta = M\b
    
    % Fetch U
    U = theta(1:3);





end