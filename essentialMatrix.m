function E = essentialMatrix(P1,P2)
% Calculate R and t for camera 1    
    R_camera_1 = P1(:,1:3);
    t_camera_1 = P1(:,end);
    
    % Calculate R and t for camera 2
    R_camera_2 = P2(:,1:3);
    t_camera_2 = P2(:,end);
    
    % Collect the R for both cameras R = R2*R1^(-1)
    R = R_camera_2*(R_camera_1^(-1));
    
    % Construct the t matrix in 3x3 cross product form
    t = t_camera_2 - R*t_camera_1;
    t = [0,-t(3),t(2);t(3),0,-t(1);-t(2),t(1),0];
    
    % Get the Essential Matrix
    E = t*R;
end