function [A] = mfn(A, delta)
%% Minimum frobenius norm is added to the Hessian so all eigenvalues are at
% least delta

    [v,l] = eig(A);

    n = size(A,1);
    t = zeros(n,n);
    for i=1:n
        if l(i) >= delta
            t(i,i) = 0;
        else
            t(i,i) = delta - l(i);
        end
    end
     A = v * (t + l) * v';


end

