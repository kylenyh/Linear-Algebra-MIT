% Gauss-Jordan elimination method on system of linear equations

% Define the augmented matrix A with coefficients and constants
A = [5 -2 7 8 -10 15;
     8 -12 10 4 -15 20;
     3 -6 7 -9 -13 11;
     2 19 10 11 -17 10];

disp('Original A matrix:');
disp(A);

% n = number of rows
% m = number of columns 

% Get the number of rows and columns
[n, m] = size(A);

% Elimination method for rows
for i = 1:n
    % Find the pivot row
    pivot_row = i;
    while A(pivot_row, i) == 0
        pivot_row = pivot_row + 1;
        if pivot_row > n
            error('Matrix is singular or nearly singular. Unable to proceed.');
        end
    end
    
    % Swap the current row with the pivot row
    A([i, pivot_row], :) = A([pivot_row, i], :);
    
    % Make the pivot element equal to 1
    A(i, :) = A(i, :) / A(i, i);
    
    % Eliminate other entries in the current column
    for j = 1:n
        if i ~= j
            A(j, :) = A(j, :) - A(j, i) * A(i, :);
        end
    end
end

% Display the results in fraction format
disp('Reduced Row-Echelon Form (RREF) in Fraction Format:');
disp(rats(sym(A)));

% Display the solution in fraction format
disp('Solution in Fraction Format:');
for i = 1:n
    fprintf('x^%d = %s\n', i, char(rats(sym(A(i, m)))));
end





