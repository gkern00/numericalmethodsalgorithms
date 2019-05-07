function [L,U,P] = luFactor(A)
%Performs LU decomposition/facorization when an A matrix is inputted.

%  This function performs LU decomposition and produces an lower triangular
%  matrix, and upper triangular matrix, and a pivot matrix through several
%  for loops. It contains some error checking. There is a known error
%  involving subtractive cancellation and roundoff error, leading to some
%  errors when L and U matrices are multiplied together and then check
%  against A.

%A = inputted matrix
%L = lower triangular matrix
%U = uppper triangular matrix
%P = pivot matrix



%% Housekeeping

if nargin > 1                                    %error when there are too many errors present
    error('There are too many inputs. Try again.')
elseif nargin < 1 
    error('There are no inputs. Try again.')
else
end

[m,n] = size(A);

if m~=n
    error('Your matrix is not square.');        %error when the matrix is not square
else
end

U = A;                                          %initially sets up the matrices in an attempt to prevent errors
L = eye(m,n);
P = eye(m,n);

%% Pivot 1

for h = 1:m
    if abs(A(h,1)) > abs(A(1,1))
        temp = A(1,:);                          %pivot 1 for the A/U matrix
        A(1,:) = A(h,:);
        A(h,:) = temp;
        
        temp2 = P(1,:);                         %pivot 1 for the P matrix
        P(1,:) = P(h,:);
        P(h,:) = temp2;
    end
end
%% LU Mess
U = A;              %clears up some errors from the beginning
for a = 1:n-1       %first step
    for b = a:n-1
        F = U(b+1,a)/U(a,a);
        U(b+1,:) = U(b+1,:)-(U(a,:).*F);
        L(b+1,a) = F;
    end
    for c = (a+2):n
        if abs(U(c,a+1)) > abs(U(a+1,a+1))      %pivot 2 for the U matrix
            temp3 = U(a+1,:);
            U(a+1,:) = U(c,:);
            U(c,:) = temp3;
            
            temp4 = P(a+1,:);                   %pivot 2 for the P matrix
            P(a+1,:) = P(c,:);
            P(c,:) = temp4;
            
            temp5 = L(a+1,1:a);                 %pivoting the L matrix
            L(a+1,1:a) = L(c,1:a);
            L(c,1:a) = temp5;
        end
    end
end

U(1,:) = A(1,:);                                %clearing up initial errors

end
            
            
        
               
