
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%FALSEPOSITIONALGORITHM A function developed to estimate to root of a given function
%Inputs
%   func: the function being evaluated
%   xl: lower guess
%   xu: upper guess
%   es: desired relative errors
%   maxiter: maximum number of iterations

%Outputs
%   fx: function evaluated at the root location
%   root: the estimated root location
%   ea: the approximate relative error (%)
%   iter: number of iterations
%% housekeeping
    %preventing the errors and setting up the format
format long
xr = 0;
xrold = xl;
iter = 1;
ea = 100;
fx = func;
es = 0.0001;

%% Inputs
    %checking the input 
if nargin < 5                       %seeing if the user has inputted enough
    maxiter = 200;
    if nargin < 4
        es = 0.0001;
        if nargin < 3
            error('Not enough inputs')
        else
        end
    else
    end
else    
end

%% Checking brackets
    %Making sure the brackets contain a root
fl = func(xl);                  %variables for the if statement
fu = func(xu);

if (fl < 0 && fu > 0)           %seeing if there is a sign change
else
     error('No sign change present -OR- Your bounds need to be switched.')
end

%% Execution
    %Find the root using the false position method

while (iter < maxiter) || (ea >= es)
   
    if iter == maxiter          %failsafe
        break
    end 
    xrold = xr;
    xr = (xu*func(xl)-xl*func(xu))/(func(xl)-func(xu));     %calculating the root
    if xr < 0
        ea = abs(xr - xl)/xr*100;       %error calculation
        xl = xr;                        %setting the root
    elseif xr > 0                       
        ea = abs((xr - xl)/xr)*100;     %error calculation
        xu = xr;                        %setting the root
    else
        error('Try again. Your bounds are the same.')       %failsafe
    end

    iter = iter+1;                     %iteration counter
    
end
%% Outputs
    %displaying the outputs
iter = iter;
ea = ea;
root = xr;

words = 'The root of your function is %4.8f \n';
words2 = 'The number of iterations needed to reach the desired error is %5.f \n';
words3 = 'The relative approximate error is %4.7f \n';


fprintf(words, root)
fprintf(words2, iter)
fprintf(words3, ea)

end

