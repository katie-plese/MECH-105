function [I] = Simpson(x,y)
% Description: MATLAB function to integrate a set of equally spaced vectors using Simpson's 1/3 Rule.

% ERROR CHECKING
if length(x) ~= length(y)
    error('Array lengths must be equal.');
end

x2 = linspace(x(1), x(length(x)), length(x));
for index = 1:length(x)
    if x(index) ~= x2(index)
        error('Array must be equally spaced.');
    end
end

% EVEN NUMBER OF SEGMENTS?
trap = 0;
if rem((length(x) - 1),2) ~= 0
    warning('Final interval will use trapezoidal rule.');
    trap = 1;
end

% VARIABLE INITIATION
I = zeros(1);
j = 1;

% SIMPSON's 1/3 RULE
for index = 1:2:length(x)-2
    
    % SIMPSON's 1/3 FORMULA
    I = I + (x(index+2) - x(index))*(y(index+2) + 4*y(index+1) + y(index))/6;
    j = index;
end

% SINGLE APPLICATION OF COMPOSITE TRAPEZOIDAL RULE
if trap == 1
    I(1,1) = I(1,1) + (x(j+1)-x(j))*(y(j)+y(j+1))/2;
end

end
