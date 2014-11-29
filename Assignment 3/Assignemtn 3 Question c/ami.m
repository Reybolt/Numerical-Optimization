function L = ami(A,beta)
%% Adding a multiple of the Identity matrix to the Hessian
      n = size(A,1);
      if min(diag(A)) > beta
          t(1) = 0;
      else
          t(1)= -min(diag(A)) + beta;
      end
      k = 0;
      while 1 == 1
          k = k +1;
         [L,p] = chol(A + t(k)*eye(n)); 
         if p == 0
            break; 
         else 
             t(k+1) = max(2*t(k), beta);
         end
      end
        
  end
    