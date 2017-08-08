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

% distance = 0;
% for i=1:size(X,1),
%   id = 1;
%   for k=1:K-1,
%     distance = sqrt(sum ((centroids(k) - X(i, :)) .^ 2));
%     next_distance = sqrt(sum ((centroids(k+1) - X(i, :)) .^ 2));
%     if(next_distance < distance)
%       id = k+1;
%       distance = next_distance;
%   end
%   idx(i) = id;
% end

distances  = zeros(size(X,1), K);
for i = 1:size(X,1),
  for k = 1:K,
    distances(i, k) = sqrt(sum ((centroids(k,:) - X(i, :)) .^ 2));
  end
end
[x, ind] = min(distances');

idx = ind;



% =============================================================

end
