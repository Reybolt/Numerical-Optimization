function [gval] = grad(A, b, x)
%% The gradient of the function we wish to minimize.

    gval = A*x - b;
    
end
