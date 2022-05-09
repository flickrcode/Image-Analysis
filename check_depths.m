function positive = check_depths(Ps, U)
% 
% positive = zeros(1,length(Ps));
% U_aug = [U;1]
% 
% for i = 1:length(Ps)
% lambda_1(i) = Ps{1,i}(3,:)*U_aug
% lambda(i) = lambda_1(i)
% 
% for j = 1:length(lambda)
% if lambda(j) > 0 
%     positive(j) = 1;
% else
%     positive(j) = 0;
% end
% positive(1:end) = positive(j)
% positive = reshape(positive,j,[])
% end
% 
% end
   positive = 0;
   % Augment U with extra one
   U_aug = [U;1];
   
    for i = 1:length(Ps)
        % Lambda x u = P x U
       lambda_u = Ps{i}*U_aug
       
       % Calculate Lambda
       check = lambda_u(3)
       
       % Check if it is non-negative
       lambda_non_negative = check > 0
       
       % Collect the value of positive Lambda
       positive = [positive;lambda_non_negative];


    end
    positive = positive(2:end);


end
