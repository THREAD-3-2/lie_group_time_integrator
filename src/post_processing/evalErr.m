function error = evalErr(sols, params)
% Evaluates the absolute and relative error w.r.t. a reference solution
%
% :param sols: solutions given in a cell struct
% :param params: parameters of each solution given in a cell struct
%
% :results: absolute and relative error at the end point
%

%% Error functions
norm2 = @(x) sqrt(sum(x.^2, 1)/size(x, 1));
abserr = @(x, xref) max(norm2(x(:, end) - xref(:, end)));
relerr = @(x, xref) max(norm2(x(:, end) - xref(:, end)) ./ norm2(xref(:, end)));

%% Looking for the solution with the smallest time step size
[m, ~] = size(params);
oldStep = params{1}.dt;
ind = 1;
for i = 2:m
    newStep = params{i}.dt;
    if newStep < oldStep
        ind = i;
    end
end
% saving the reference solution
ref = sols{ind};

%% evaluate the error
error = struct('q_abserr', [], 'q_relerr', [], 'w_abserr', [], ...
               'w_relerr', [], 'steps', [], 'info', []);
error.info(1) = m;
error.info(2) = ind;
count = 1;
for k = 1:m
    if k ==  ind
        continue
    end
    crrSol = sols{k};
    error.steps(count) = (params{k}.T - params{k}.t0)/params{k}.N_TIME;
    % absolute error (q and w)
    error.q_abserr(count) = abserr(crrSol(1:3, :), ref(1:3, :));
    error.w_abserr(count) = abserr(crrSol(4:6, :), ref(4:6, :));
    % relative error (q and w)
    error.q_relerr(count) = relerr(crrSol(1:3, :), ref(1:3, :));
    error.w_relerr(count) = relerr(crrSol(4:6, :), ref(4:6, :));
    count = count + 1;
end
end