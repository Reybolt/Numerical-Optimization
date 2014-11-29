%% Steepest descent with exact line search for Math 309, Problem 1, HW2 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize f(x) = x'*A*x/2 - b'*x
% f'(x) = A*x -b

%Initializations
n = 20;
A = zeros(n,n);
for i=1:n
  for j=1:n
    A(i,j) = 1.0/(i+j-1);
  end
end
b = ones(n,1);
x = zeros(n,1);
f = fun(A,b,x);
g = grad(A,b,x);
k=0;

%% Steepest descent direction
d=-g;

while(norm(g,inf) > 1e-2) 
    %Exact line search
    alpha = -(g'*d)/(d'*A*d); 
    sprintf('Iteration =%d fval = %f error=%f,alpha = %f', k, f, norm(g,inf), alpha)
    
    %Compute next iteration
    x = x + alpha * d;
    
    %Update values 
    f = fun(A, b, x);
    g = grad(A, b, x);
    d = -g;
    k = k+1;   

end

    