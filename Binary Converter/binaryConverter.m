function [base2] = binaryConverter(base10)
% Description: MATLAB function to convert a number from base 10 to base 2.

% PREASSIGN VARIABLES
base2 = [];
num = 1;

% FIND LOCATION OF LARGEST BASE 2 EXPONENT
exponent = 0;
while (2^exponent <= base10)
    exponent = exponent + 1;
end

% SOLVE FOR BASE 2 ARRAY
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
