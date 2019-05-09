
function [root,fx,ea,iter] = bisection(func,xl,xu,es,maxit,varargin)
%This function calculates the center of a function based on the bisection
%method
%   Very simple code
%input:
    %func = name of function
    %xl, xu = upper and lower guess
    %es = maximum desired relative error
    %maxit = maximum number of iterations
%output
    %root = real root
    %fx = value at root
    %ea = apprx relative error
    %iter = number of iterations
    
%% Preliminary Housekeeping + an input
sym x;
format long
func = input('What is your function in terms of x? ','s');
none = 50; no = 0.0001;  %placeholders
equation = @(x)func ; 
func = equation(func);

%% Inputs
xu = input('What is your upper bound? ');
xl = input('What is your lower bound? ');
maxit = input('What are the maximum number of iterations? (If no limit, put none) ');
es = input('What is the desired relative error? (if none, put no) ');

func = equation(func);

%% Tests
test1 = func(xl);
test2 = func(xu);
if test1*test2 > 0
   error('No sign change present')
else
end

%% Executing Function
iter = 0; xr = xl; ea = 100;

while (1)
    xrold = xr;
    xr = (xl+xu)/2;
    iter = iter +1;
    if xr ~= 0
        ea = abs((xr-xrold/xr))*100;
    end
    test1 = func(xl)*func(xr);
    if test1 < 0
        xu = xr;
    elseif test1 > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break
    end
end

%% Outputs
root = xr;
fx = solve(func,xr);

disp(root);


end


