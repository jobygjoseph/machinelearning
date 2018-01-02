function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% COST FUNCTION = 
% J(0) = (1/2m) * sum (i=1:m) of (hThetaX - y)^2

% theta looks like the following: (2 x 1)
% 0 
% 0

% And X looks like the following (m x 2)
% 1 123
% 1 456
% 1 789
% ....


% hThetaX = theta' * X
sum2 = 0;
hThetaX = X * theta;
summer = sum((hThetaX - y) .^ 2);
J = ( 1 / ( 2 * m )) * summer;

% =========================================================================

end
