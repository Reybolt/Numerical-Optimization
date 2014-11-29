%% Steepest descent with inexact line search for Math 309, Problem 2, HW2 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% We are using the function linesearch written by the course instructor/TA
% which requires redefining the matrix A and vector b in the call. This is
% not the most efficient code, but since we are using their code, we must
% abide by this. 
% 
% bracketing.m, interpolation.m, sectioning.m,linesearch.m are all from
% instructor/TA.
%
% Minimize f(x) = x'*A*x/2 - b'*x
% f'(x) = A*x -b

%Parameter needed for linesearch function
alphamax = 1.0;

%Initializations
n = 20;
x = zeros(n,1);
f = fun(x); 
g = grad(x);
k = 0;

%Search direction
d = -g;

while (norm(g, inf) > 1e-2) 
    
  %Solution is already updated from output of linesearch function  
  [retcode, x, f, g, alpha] = linesearch(x, f, g, d, alphamax);
  
  sprintf('k=%d fval=%f err=%f alpha=%f\n',k,f,norm(g, inf),alpha) 
  
  d = -g; 
  k = k + 1;
  
end
