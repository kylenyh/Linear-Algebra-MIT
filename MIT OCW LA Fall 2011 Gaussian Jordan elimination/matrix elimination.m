% Gauss-Jordan elimination method on a typical matrix

A = [ 5 7 9 10;
      3 7 9 4;
      8 4 9 0;
      1 7 3 6];

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

% Display the RREF results
disp('Reduced Row-Echelon Form (RREF):');
disp(A);


