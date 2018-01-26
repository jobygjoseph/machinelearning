function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% idx size is 300x1
% X size is 300x2 (test uses 15x11)
% centroids size is 3x2 (test uses 5x11)
% centroids =
%   3   3
%   6   2
%   8   5
%

xSize = size(X, 1);
cSize = size(centroids, 1);
distance = zeros(xSize, cSize);

for i = 1:cSize
  distance(:,i) = sum(bsxfun(@minus, X, centroids(i, :)) .^ 2, 2);
end;

[w, idx] = min(distance, [], 2);

% =============================================================

end

