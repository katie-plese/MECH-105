function [L, U, P] = luFactor_v04(A)

% ERROR CHECKING
if nargin < 1
    error('Not enough input arguments.');
end

[m,n] = size(A);
if m ~= n
    error('Must enter a SQUARE matrix.')
else   
    
for row = 1:m
    for col = 1:n
        if A(row,col)==0
            error('Matrix cannot contain zeros.');
        end
    end
end

% VARIABLE INITIATION
L = eye(m);
U = A;
P = eye(m);

% POSITIVE MATRIX, IN CASE THE LARGEST ABSOLUTE VALUE IS NEGATIVE
posU = abs(U);

count = 1;
for col = 1:n-1
    for row = count:m-1
        % PARTIAL PIVOTING
        loc = find(posU(:,col)==max(U(:,col)));
        if loc ~= 1
            % UPPER MATRIX
            pivot = U(loc,:);
            U(loc,:) = U(row,:);
            U(row,:) = pivot;
            
            % ABSOLUTE VALUE UPPER MATRIX
            pivot = posU(loc,:);
            posU(loc,:) = posU(row,:);
            posU(row,:) = pivot;
            
            % PERMUTATION MATRIX
            pivot = P(loc,:);
            P(loc,:) = P(row,:);
            P(row,:) = pivot;           
        end
        
        % FIND FRACTION AND ASSIGN VALUE TO LOWER MATRIX
        fraction = U(row + 1,col)/U(col,col);
        L(row + 1,col) = fraction;
        
        % ELIMINATE X VARIABLES FROM APPROPRIATE EQUATIONSxd 
        for x = 0:m-count
            U(row + 1, col + x) = U(col,col + x)*fraction - U(row + 1,col + x);
            
            % U(2,1) = U(1,1) - U(2,1)
            % U(2,2) = U(2,1) - U(2,2)
            % U(2,3) = U(3,1) - U(2,3)
            
            % U(3,2) = U(2,2) - U(3,2)
            % U(3,3) = U(3,2) - U(3,3)
        end
    end
    count = count + 1;
end

% CHECK WORK
% if P*A == L*U
    disp(U);
    disp(L);
    disp(P);
% else
    % error('Incorrect Matrices!');
% end

end