function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% X is 5x3 matrix : a matrix of movie features (0 to 5): Dimensions are (movies x features)
% Theta is a 4x3 matrix : a matrix of feature weights: Dimensions are (users x features)
% R is a 5x4 matrix : a matrix of observations (binary values). Dimensions are (movies x users)
% Y is a 5 x 4 : a matrix of movie ratings: Dimensions are (movies x users)



%%J = (1/2) * sum((Theta(R(:)==1) * X(R(:)==1)' - Y(R==1)) ^ 2);

predictedMovieRatings = X * Theta'; % Dimensions of the result should be (movies x users):5x4.
movieRatingError = predictedMovieRatings - Y; % 5x4
errorFactor = movieRatingError .* R; % Dimensions of the result should be (movies x users):5x5.

%for i = 1:rows(R)
%  for j = 1:columns(R)
%    if (R(i,j) == 1)
%      J = J + (ThetaX - Y(i,j)) .^ 2;
%    end;
%  end;
%end;

J = (1/2) * sum(sum(errorFactor .^ 2));

% J = J / 2;

X_grad = errorFactor * Theta;
Theta_grad = errorFactor' * X;

ThetaRegularized = (lambda/2) * sum(sum(Theta.^2));

XRegularized = (lambda/2) * sum(sum(X.^2));

J = J + ThetaRegularized + XRegularized;


X_grad = X_grad + lambda*X;
Theta_grad = Theta_grad + lambda*Theta;

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
