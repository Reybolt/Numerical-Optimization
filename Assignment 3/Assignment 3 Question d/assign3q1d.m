%% Line search Newton's method for Math 309, Problem 1d, HW3 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize the Rosenbrock function (see fun.m)
%
% bracketing.m, interpolation.m, sectioning.m,linesearch.m are all from
% instructor/TA.
%

%Initializations
alphamax = 1.0;
x = [0, 1]';
f = fun(x); 
g = grad(x);
h = hessian(x);
k = 1;

%The Hessian is modified by the modified Cholesky factorization
[D,L] = mcf(h,10^(-3),10^6);
A = L*D*L';

%Search direction
d = -A\g;


while (norm(g, inf) > 1e-4) 
  
  %Inexact line search satisfying the Strong Wolfe conditions
  [retcode, x, f, g, alpha] = linesearch(x, f, g, d, alphamax);
  
  sprintf('k=%d fval=%f err=%f alpha=%f\n',k,f,norm(g, inf),alpha) 
  
  % Update values
  [D,L] = mcf(h,10^(-3),10^6);
  A = L*D*L';
  d = -A\g;
  k = k + 1;
  
end
