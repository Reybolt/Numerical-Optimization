function [fval] = fun(A, b, x)
%% The function we wish to minimize

    fval = 0.5*x'*A*x- b'*x;
    
end
