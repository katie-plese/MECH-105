function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary

% Prefill variables
base2 = [];
num = 1;

% Find largest base 2 exponent
exponent = 0;
while (2^exponent <= base10)
    exponent = exponent + 1;
end

% Solve for base 2 array
if base10 == 0
    base2 = [0];
else
    for index = exponent:-1:0
        if 2^index <= base10;
            base2(1,num) = 1;
            base10 = base10 - 2^index;
        else
            base2(1,num) = 0;
        end
        num = num + 1;
    end
        base2 = base2(2:length(base2));
end