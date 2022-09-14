function [sols, params] = readAll(many)
% reading all solution files
% 
% :param many: how many solutions to read
%
% :returns: cells of solution and relative parameters
%

% all txt files in the directory
files = dir('../out/*sol.mat');

if nargin == 0
    [n, ~] = size(files);
    many = n;
end

sols = cell(many, 1);
params = cell(many, 1);

for i = 1:many
    filename = files(i).name;
    sols{i} = load(strcat('../out/', filename(1:end-7), 'sol.mat'));
    sols{i} = sols{i}.zSol;
    params{i} = load(strcat('../out/', filename(1:end-7), 'prm.mat'));
end

end
