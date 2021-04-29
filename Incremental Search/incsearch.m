function [ xb ] = incsearch(func,xmin,xmax,ns )
% Description: Incremental Search Numerical Method Function

% ERROR CHECKING
if nargin < 3
    error('at least 3 arguments required');
elseif nargin < 4
    ns = 50;
end

x = linspace(xmin,xmax,ns);
f = func(x);
nb = 0;
% xb WILL REMAIN EMPTY UNLESS A SIGN CHANGE IS DETECTED
xb = [];

% CHECK FOR SIGN CHANGE OVER INTERVAL
for i = 1:length(x)-1
    if sign(f(i)) ~= sign(f(i+1))
        nb = nb + 1;
        xb(nb,1) = x(i);
        xb(nb,2) = x(i+1);
    end
end

if isempty(xb)
    disp('No brackets found')
    disp('check interval or decreas ns')
else
    fprintf('Number of brackets: %f',nb);
end
end
