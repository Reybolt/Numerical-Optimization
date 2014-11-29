%% Preconditioned Conjugate Gradient method for Math 309, Problem 2, HW4 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize f(x) = x'*A*x/2 - b'*x

%Initializations
n = 20;
b = ones(n,1);
A = zeros(n,n);
x = zeros(n,1);
k =0;
for i=1:n
  for j=1:n
    A(i,j) = 1.0/(i+j-1);
  end
end

L = ichol(sparse(A));
L = full(L); 
M = L*L';

%% Preconditioned Conjugate Gradient method
r = A*x-b;
y = M\r;
p = -y;

while (norm(r,inf) > 1e-4)
    alpha = (r'*y)/(p*A*p); 
    x = x + alpha*p;
    r1 = r + alpha*A*p;
    y1 = M\r';
    b = (r1'*y1)/(r'*y);
    p = -y1 + b*p;
    y = y1;
    r = r1;
    
    k = k+1;
    f = 0.5 * x' * A * x - b'* x;
    g = A * x - b;
    sprintf('Iteration =%d fval = %f error=%f', k, f, norm(g,inf))
end

