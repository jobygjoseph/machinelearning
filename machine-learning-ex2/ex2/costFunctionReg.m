function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

thetaTransposeX = X * theta;
sigmoidThetaX = sigmoid(thetaTransposeX);

% Calculate cost function:
J = (1/m) * (-y' * log(sigmoidThetaX) - (1 - y)' * log(1 - sigmoidThetaX)) + (lambda/(2*m)) * sum(theta(2:end) .^ 2);


% calculate grad:
grad = zeros(size(theta));
for ind = 1:length(theta)
  if (ind == 1)
    grad(ind) = (1/m) * sum((sigmoidThetaX - y)' * X(:,ind));
  else
    grad(ind) = ((1/m) * sum((sigmoidThetaX - y)' * X(:,ind))) - ((lambda / m) * theta(ind));
end;



% =============================================================

end
