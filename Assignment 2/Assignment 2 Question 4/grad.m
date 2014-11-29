function [g] = grad(x)
%% The gradient of the function we wish to minimize.

    g = [200*(x(2)-x(1)^2)*(-2*x(1)) - 2*(1-x(1)); 200*((x(2)-x(1)^2))];

end
