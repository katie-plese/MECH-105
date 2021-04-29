function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% Description: MATLAB function to estimate the root of a function using the False Position Method.

% CHECK INPUTS
if nargin < 3
    error('At least 3 input arguments are required.');
elseif nargin < 4
    es = 0.0001;
    maxit = 200;
else nargin < 5
    maxit = 200;
end

% CHECK FOR SIGN CHANGE
value_l = func(xl, varargin{:});
value_u = func(xu, varargin{:});
if (value_l * value_u) > 0
    error('Please enter new boundaries. No sign change occurs.');
end

% CALCULATE XR
iter = 0;
ea = 100;
xold = 100;
while(1)

    % SOLVE FOR APPROXIMATE ROOT, FUNCTION VALUE, AND ERROR
    root = xu - (func(xu)*(xl-xu)/(func(xl)-func(xu)));
    fx = func(root,varargin{:});
    ea = abs(root - xold)/root*100;
    if ea <= es || iter >= maxit
        break
    else
    
        % INCREASE ITERATION AND CONTINUE LOOP IF STOPPING CRITERIA IS NOT MET
        iter = iter + 1;
        
        % REPLACE ROOT WITH XL OR XU AND ASSIGN NEW VALUE TO XOLD
        if (fx*xl)<1
            xu = root;
        else
            xl = root;
        end
        xold = root;
    end
end

% RETURN OUTPUT ARGUMENTS
fprintf('Estimated Root Location: %d\n',root);
fprintf('Function Evaluated at Root Location: %f\n',fx);
fprintf('Approximate Percent Relative Error: %f\n',ea);
fprintf('Number of Iterations: %d\n',iter);
end
