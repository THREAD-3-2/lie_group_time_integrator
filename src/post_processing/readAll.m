function [sols, params] = readAll(many, old)
% reading all solutions file
% 
% :param many: how many solution to read
%
% :returns: cells of solution and relative parameters
%

if nargin < 2
    old = 0;
end

% all txt files in the directory
if old == 1
    files = dir('out/*.txt');
else
    files = dir('out/*sol.mat');
end

if nargin == 0
    [n, ~] = size(files);
    many = n;
end

sols = cell(many, 1);
params = cell(many, 1);

for i = 1:many
    filename = files(i).name;
    if old == 1
        fileID = fopen(strcat('out/', filename), 'r');
    
        formatSpec = '%e';
        sizeSol = [6 Inf];
        sols{i} = fscanf(fileID, formatSpec, sizeSol);
        
        fclose(fileID);
    else
        sols{i} = load(strcat('out/', filename(1:end-7), 'sol.mat'));
        sols{i} = sols{i}.zSol;
    end

    params{i} = load(strcat('out/', filename(1:end-7), 'prm.mat'));
end

end