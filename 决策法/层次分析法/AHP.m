%% read data

clc;
cm = [
    4/4 5/4 2/4 9/4 6/4 7/4;
    4/5 5/5 2/5 9/5 6/5 7/5;
    4/2 5/2 2/2 9/2 6/2 7/2;
    4/9 5/9 2/9 9/9 6/9 7/9;
    4/6 5/6 2/6 9/6 6/6 7/6;
    4/7 5/7 2/7 9/7 6/7 7/7;
]

%% AHP
% using the AHP to get the weight of each part

[n, n] = size(cm);
[X, Y] = eig(cm);
MAX_eig = max(max(Y));
[r, c] = find(Y == MAX_eig, 1);
disp('The result of eigenvalue method: ');
disp(X(:, c) ./ sum(X(:, c)))

%% The following is the procedure for calculating the consistency ratio(CR)

CI = (MAX_eig - n) / (n-1);
RI = [0 0.0001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
CR=CI / RI(n);
disp('THE consistency index(CI) is'); disp(CI);
disp('THE consistency ratio(CR) is'); disp(CR);
if CR<0.10
    disp('Because CR<0.10, the consistency of the judgment matrix K is acceptable');
    xlswrite('AHPWeight.xlsx', X(:, c) ./ sum(X(:, c)));
else
    disp('CR >= 0.10£¬the judgment matrix K needs to be modified');
end
