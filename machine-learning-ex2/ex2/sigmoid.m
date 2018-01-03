function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

if rows(z) == 1 && columns(z) == 1  % scalar
  g = (1 / (1 + expm(-z)));
else
  g = zeros(size(z));
  for i = 1:rows(z)
    for j = 1:columns(z)
      g(i,j) = (1 / (1 + expm(-z(i,j))));
    endfor
  endfor
end;


% =============================================================

end
