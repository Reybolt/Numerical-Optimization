%% BFGS method Math 309, Problem 4, HW4 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize f(x) = x'*A*x/2 - b'*x

%Initializations
clear all
alphamax = 1;
n = 20;
b = ones(n,1);
for i=1:n
  for j=1:n
    A(i,j) = 1.0/(i+j-1);
  end
end
x = zeros(n,1);
k = 1;
h = eye(n); 

f = fun(x);
g = grad(x);

while (norm(g, inf) > 1e-4)

       %BFGS method
       p = -h * g;
       [retcode, ax, af, ag, alpha] = linesearch(x, f, g, p, alphamax);
       s = ax - x;
       y = ag - g;
       rho = 1/(y'*s);
       h = (eye(n)-rho*s*y')*h*(eye(n)-rho*y*s')+rho*(s*s');
       %h = h - (h*(s*s')*h)/(s'*h*s) + y*y'/(y'*s);
       x = ax;
       f = af;
       g = ag;

       sprintf('k=%d fval=%f err=%f alpha=%f\n',k,f,norm(g, inf), alpha) 
       k = k + 1;
end

