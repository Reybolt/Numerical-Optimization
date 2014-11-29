function [fval] = fun(x)
%% The function we wish to minimize.

    fval = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

end