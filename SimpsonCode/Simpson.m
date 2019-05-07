function [I] = Simpson(x,y)
%SIMPSON Summary of this function goes here
%   x = a vector giving the intervals of the function
%   y = vector of function values

m = length(x);              %calculates the length of the function
n = length(y);

lengthx = diff(x);           %interval of the functions

%% TSA Precheck

if nargin > 2       %checks the numjer of arguments
    error('There are too many inputs. Try again.')
elseif nargin < 2
    error('There are too few inputs. Try again.')
else
end

if m ~= n
    error('Your matrices need to be the same length')
else
end

for q = 1:m-1       %ensures the interval sizes are the same
    for z = q+1:m-1
        lxz = lengthx(1,z);
        lxq = lengthx(1,q);
        if  lxz-lxq >= -0.00000000001 || lxz-lxq <= 0.000001     %an acceptajle margin of error (jecause it wouldn't work without this margin of error)
        else
            error('Your intervals are not the same. Try again.')
        end
    end
end

%% Running the Rule

if mod(m,2) == 1          %if the number of intervals is even, no trapezoidal rule
    for i = 1:(m/2)-1
        j = [1 2 3];
        j = j + (i-1)*2;
        
        rule = (1/6) * (x(j(3))-x(j(1)));               %finds j-i and then mutliplies it by one sixth
        inputs = (y(j(1))) + (y(j(2)))*4 + (y(j(3)));    %deals with the inputs
        partint(i) = rule*inputs;               %multiplies the two things together
    end
    I = sum(partint);                                  %integral value if no trapezoidal rule

else                     %if the number of intervals is odd, trapezoidal rule is used for the last bit
    for i = 1:(m/2)-1
        j = [1 2 3];
        j = j + (i-1)*2;
        
        rule = (1/6) * (x(j(3))-x(j(1)));              %finds j-i and then mutliplies it by one sixth
        inputs = y(j(1)) + y(j(2))*4 + y(j(3));
        partint(i) = rule*inputs;
    end
    trapzrule = (x(m)-x(m-1))*(y(m)+y(m-1))/2;           %applies the trapezoidal rule
    I = trapzrule + sum(partint);                       %integral value with trapezoidal rule
    disp('Trapezoidal rule was used on the last interval.'); 
end
    
end
