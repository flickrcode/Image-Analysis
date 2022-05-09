%% Exercise 4.1
clc
close all
clear all

% Assume the STD is equal to 3 sigma
sigma = 3;

[Ps, us, U_true] = triangulation_test_case(sigma)


U= minimal_triangulation(Ps,us)

%% Exercise 4.2

positive = check_depths(Ps, U)


%% Exercise 4.3
errors = reprojection_errors(Ps, us, U)

%% Exercise 4.4
 triangulate_sequence;
               

%% Exercise 4.5

%% Exercise 4.6
% please consult with report %

%% Exercise 4.7
%%%%%%% Uncomment the function below to run %%%%%%

all_residuals = compute_residuals(Ps, us, U)

%% Exercise 4.8
% please consult with report %

%% Exercise 4.9
%%%%%%% Uncomment the function below to run %%%%%%

jacobian = compute_jacobian(Ps, U)


%% Exercise 4.10
%%%%%%% Uncomment the function below to run %%%%%%

% U = refine_triangulation(Ps, us, Uhat)

%% Exercise 4.11
clc
clear all
load gauss_newton.mat

% Initial Plot of Uhat
figure(2)
scatter3(Uhat(1,:),Uhat(2,:),Uhat(3,:),'.')


% Start the iteration
N = length(Uhat);
for i = 1:N
    % Collect P and P_tilde together
   Pss = [{P},{P_tilde}]; 
   Uhatt = Uhat(:,i);
   
   % Collect u and u_tilde together
   uss = [u(:,i),u_tilde(:,i)];
   
   % Call the refine_triangulation
   U(:,i) = refine_triangulation(Pss, uss, Uhatt);
end

% Plot after refinement
figure(3)
scatter3(U(1,:),U(2,:),U(3,:),'.')



%% Exercise 4.14
clear all;
close all;
clc;

load P.mat

E = essentialMatrix(P1,P2);
