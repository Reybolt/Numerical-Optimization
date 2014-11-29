function [fval] = fun(x)

    n = size(x,1);
    b = ones(n,1);
    for i=1:n
      for j=1:n
        A(i,j) = 1.0/(i+j-1);
      end
    end

    fval = 0.5 * x' * A * x - b'* x;

