function [I] = Simpson(x,y)
% MATLAB function for interating experimental data using Simpson's 1/3 Rule

% INPUTS
% x = the vector of equally spaced independent variable
% y = the vector of function values with respect to x

% OUTPUTS
% I = the numerical integral calculated

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
    
% if linspace(x(1), x(length(x)), length(x)) ~= x
    % error('Array must be equally spaced.');
% end

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
    
    % VARIABLE REDEFINITION
    % a = x(index);
    % b = x(index + 2);
    % mid = (b+a)/2;
    % h = b - a;
    
    % CREATE PARABOLIC ARC -- NO!!!
    % func = fit([x(a) x(mid) x(b)],[y(a) y(mid) y(b)],'poly2');
    
    % SIMPSON's 1/3 FORMULA
    I = I + (x(index+2) - x(index))*(y(index+2) + 4*y(index+1) + y(index))/6;
    
    j = index;
end

% SINGLE APPLICATION OF COMPOSITE TRAPEZOIDAL RULE
if trap == 1
    I(1,1) = I(1,1) + (x(j+1)-x(j))*(y(j)+y(j+1))/2;
end

end