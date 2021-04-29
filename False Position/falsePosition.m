function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

% FALSE POSITION ALGORITHM
% MATLAB function which estimates the root of a given function using the
% false position method.
%   Inputs:
%       func - the function being evaluated
%       xl - the lower guess
%       xu - the upper guess
%       es - the desired relative error (default 0.0001%)
%       maxit - the maximum number of iterations (default 200)
%       varargin - any additional parameters used by the function
%   Outputs:
%       root - the estimated root location
%       fx - the function evaluated at the root location
%       ea - the approximate relative error (%)
%       iter - how many iterations were performed

% CHECK INPUTS
if nargin < 3
    error('At least 3 input arguments are required.');
elseif nargin < 4
    es = 0.0001;
    maxit = 200;
else nargin < 5
    maxit = 200;
% else
    % error('Too many input arguments.');
end

% CHECK FOR SIGN CHANGE
value_l = func(xl, varargin{:}); % WHAT IS VARARGIN??
value_u = func(xu, varargin{:});
if (value_l * value_u) > 0
    error('Please enter new boundaries. No sign change occurs.');
end

% CALCULATE XR
iter = 0;
ea = 100;
xold = 100; % SIMPLIEST CASE NEEDS WORK
while(1)
    % SOLVE FOR THE APPROXIMATE ROOT, ITS FUNCTION VALUE, AND THE ERROR
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