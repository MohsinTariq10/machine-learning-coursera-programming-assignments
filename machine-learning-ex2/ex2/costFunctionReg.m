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


% vectorized implmentation
%J = (1 / m) * sum( -y'*log(sigmoid(X*theta)) - (1-y)'*log( 1 - sigmoid(X*theta)) );

% non vectorized implmentation
h = sigmoid(X * theta);

for i = 1:m,

  left = -y(i) * log(h(i));

  right = (1 - y(i)) * log(1 - h(i));

  J = J + ( left - right );
end;

J = J/(m);

temp = lambda * sum(theta(2 : length(theta)) .^ 2) / (2 * m);
  
J = J + temp;


% derivative terms

%grad = (1 / m) * sum( X .* repmat((sigmoid(X*theta) - y), 1, size(X,2)) );

T = zeros(length(theta),1);

T(1) = (sum((h - y) .* X(:, 1)))/m;

for j = 2 : length(theta),

  for i = 1:m,

    T(j) = T(j) + (h(i) - y(i)) * X(i, j);

  end;

T(j) = T(j) / m;


end;

T(2 : length(T)) = T(2 : length(T)) + (lambda / m) * theta(2: length(theta));


grad = T;

% =============================================================

end
