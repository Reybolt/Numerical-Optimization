%% Conjugate Gradient method for Math 309, Problem 1, HW4 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize f(x) = x'*A*x/2 - b'*x

%Initializations
n = 20;
b = ones(n,1);
x = zeros(n,1);
k = 0;
A = zeros(n,n);

for i=1:n
  for j=1:n
    A(i,j) = 1.0/(i+j-1);
  end
end

%% Conjugate Gradient method
r = A*x - b;
p = -r;
while (norm(r,inf) > 1e-4)

    alpha = (r'*r)/(p'* A * p); 
    x = x + alpha*p;
    r1 = r + alpha*A*p;
    beta = (r1'*r1)/(r'*r);
    p = -r1 + beta*p;
    r = r1;
    
    k = k + 1;
    f = 0.5 * x' * A * x - b'* x;
    g = A * x - b;
    sprintf('Iteration =%d fval = %f error=%f', k, f, norm(g,inf))
end
