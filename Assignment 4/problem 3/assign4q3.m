%%  Nonlinear Conjugate Gradient methods (FR, PR, PRplus) Math 309, Problem 3, HW4 Fall 2014 SFU Surrey
% Author: Reynaldo J. Arteaga
% Minimize Rosenbrock function (see fun.m)

%Initializations
clear all
x = [0,1]';
k = 1;
alphamax = 1;
f = fun(x);
g = grad(x);

%Search direction
p = -g;

%Decide which method to run: FH, PR, PRplus methods
method = 'PR';

while (norm(g, inf) > 1e-4) 
    [retcode, x, af, ag, alpha] = linesearch(x, f, g, p, alphamax);
    
    if strcmp(method, 'FR')
        b = (ag'*ag)/(g'*g);
    elseif strcmp(method, 'PR')
        b = (ag')*(ag-g)/((norm(g,2))^2);
    elseif strcmp(method, 'PRplus')
        b = (ag')*(ag-g)/((norm(g,2))^2);
        b = max(b,0);
    end
    p = -ag + b*p;
    f = af;
    g = ag;

    sprintf('k=%d fval=%f err=%f alpha=%f\n',k,fun(x),norm(g, inf), alpha) 
    k = k + 1;
end
