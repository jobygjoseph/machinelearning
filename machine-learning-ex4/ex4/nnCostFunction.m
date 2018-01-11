function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


% keyboard

% m = 5000
% X has a size of 5000x400 (will be 5000x401 after adding a column of ones)
% y has a size of 5000x1
% nn_params has a size of 10285x1
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

% a1 is probably going to be a 1x401;
% a2 is probably going to be a 26x1
% a3 is probably going to be a 10x1

% input_layer_size = 400
% hidden_layer_size = 25
% num_labels = 10
% lambda = 0

delta3 = 0;
capitalDelta1 = 0;
capitalDelta2 = 0;

% For the purpose of training a neural network, 
% we need to recode the labels as vectors containing only values 0 or 1
% In other words
I = eye(num_labels);
Y = zeros(m, num_labels);
for i = 1:m
  Y(i, :) = I(y(i), :);
end

% 1) Randomly initialize the weights


% 2) Implement forward propagation to get h theta of X for any x(i)
a1 = X;
a1 = [ones(m, 1) a1];
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ones(size(a2, 1), 1) a2];
z3 = a2 * Theta2';
hThetaX = a3 = sigmoid(z3);

% 3) Implement the cost function
J = ((1/m) * sum(sum(-Y .* log(hThetaX) - (1 - Y) .* log(1 - hThetaX))));  

% 3a) with regularization
regTerm = (lambda/(2*m))*(sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));
J = J + regTerm;

% 4) Implment backpropagation to compute the partial derivatives.
for t = 1:m
  A1 = X(t,:);
  A1 = [1 A1];
  Z2 = A1 * Theta1';
  A2 = sigmoid(Z2);
  A2 = [1 A2];
  Z3 = A2 * Theta2';
  A3 = sigmoid(Z3);
  delta3 = delta3 + (A3 - Y(t,:));
  delta2 = (delta3 * Theta2) .* (A2 .* (1 - A2));
  delta2 = delta2(2:end);
  capitalDelta1 = capitalDelta1 + delta2' * A1;
  capitalDelta2 = capitalDelta2 + delta3' * A2;
  %keyboard
end;

%disp('Are the aONes the same?');
%a1 == A1

%disp('Are the aTwos the same?');
%a2 == A2

%disp('Are the aThrees the same?');
%a3 == A3

% =========================== [START] NO LOOP =======================%
%delta2 = (delta3 * Theta2) .* (a2 .* (1 - a2));
%delta2 = delta2(:,2:end);

%capitalDelta1 = delta2' * a1;
%capitalDelta2 = delta3' * a2;
% =========================== [END] NO LOOP =======================%


Theta1_grad = (1/m) * capitalDelta1;
Theta2_grad = (1/m) * capitalDelta2;


% 5) Use gradient checking to confirm that your backpropagation works.  Then disable graident checking.

% 6) Use gradient descent or a built-in optimization function to minimize the cost function with the weights in theta.

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
%keyboard
end
