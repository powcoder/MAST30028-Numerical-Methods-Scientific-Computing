  function L = CholScalar(A)
% L = CholScalar(A)
% Cholesky factorization of a symmetric and positive definite matrix A.
% L is lower triangular so A = L*L'.

[n,n] = size(A);
L = zeros(n,n);
for i=1:n
   % Compute L(i,1:i)
   for j=1:i
      s = A(j,i);
      for k=1:j-1
         s = s - L(j,k)*L(i,k);
      end
      if j<i
         L(i,j) = s/L(j,j);
      else
         L(i,i) = sqrt(s);
      end
   end
end