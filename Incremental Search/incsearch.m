function [ xb ] = incsearch(func,xmin,xmax,ns )
%incsearch Incremental Search Numerical Method Function
%   Detailed explanation goes here

if nargin < 3
    error('at least 3 arguments required');
elseif nargin < 4
    ns = 50;
end

x = linspace(xmin,xmax,ns);
f = func(x);
nb = 0;
xb = []; % xb will be empty unless a sign change is detected

for i = 1:length(x)-1
    if sign(f(i)) ~= sign(f(i+1)) % check for sign change over increment
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

