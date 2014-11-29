%% Steepest descent with inexact line search for Math 309, Problem 4, HW2 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize the Rosenbrock function (see fun.m)
%
% bracketing.m, interpolation.m, sectioning.m,linesearch.m are all from
% instructor/TA.
%

%Initializations
alphamax = 1.0;
x = [-1.2, 1]';
f = fun(x); 
g = grad(x);
k = 1;

%Search direction
d = -g;

while (norm(g, inf) > 1e-4) 
  
  %Inexact line search satisfying Strong Wolfe conditions
  [retcode, x, f, g, alpha] = linesearch(x, f, g, d, alphamax);
  
  sprintf('k=%d fval=%f err=%f alpha=%f\n', k, f, norm(g, inf), alpha) 
  d = -g; 
  k = k + 1;
  
end
