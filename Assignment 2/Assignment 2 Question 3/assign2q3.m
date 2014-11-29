%% Steepest descent with backtrack line search for Math 309, Problem 3, HW2 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize Rosenbrock function (fun.m)

%Initializations
x = [-1.2, 1]';
k = 1;

%Backtrack line search constants
rho = 0.9;
c = 1e-4;
g = grad(x);

while (norm(g, inf) > 1e-4)  
  f = fun(x);
  g = grad(x);
  alpha = 1;
  %Search direction
  d = -g;
  
  %Backtrack line search 
  while fun(x + alpha*d) >f + c*alpha*(g')*g;
    alpha = rho*alpha; 
  end
  
  %Compute next solution by standard optimization step
  x = x + alpha * d;
  
  sprintf('Iteration =%d fval = %f error=%f,alpha = %f', k, f, norm(g,inf), alpha)
  k = k + 1;
end
