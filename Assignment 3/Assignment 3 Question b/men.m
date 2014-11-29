function A = men(A,delta)
%% Minimum Euclidean norm is added to the Hessian so all eigenvalues are at
% least delta

    t = max(0, delta - min(eig(A)));
    A = A + t* eye(size(A));
    
end
    