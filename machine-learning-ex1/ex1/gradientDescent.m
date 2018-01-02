function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    hThetaX = 0;
    summer = 0;
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    % theta(1 & 2) = theta(1& 2) - alpha * derivative (with respect to J) * costFunction(theta)
    
    hThetaX = X * theta;
    jTheta1 = sum((hThetaX - y)' * X(:,1));
    jTheta2 = sum((hThetaX - y)' * X(:,2));
    
    theta(1) = theta(1) - (alpha / m) * jTheta1;
    theta(2) = theta(2) - (alpha / m) * jTheta2;
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    
    % disp('J history and theta');
    % J_history(iter)
    % theta

end

end
