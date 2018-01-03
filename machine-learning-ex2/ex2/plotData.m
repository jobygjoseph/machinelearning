function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

c = '';
yind = 1;
for ind = 1:columns(X) * rows(X)
  if ind > rows(X)
    yind = 1;
  else
    yind = ind;
  end;
  
  if y(yind) == 0
    c = 'ko';
  else
    c = 'k+';
  end
  plot(X(ind), y(yind), c); % Plot the data
  hold on
end;




% =========================================================================



hold off;

end
