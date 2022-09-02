function rslt = riemannianDistance(sols, params)
% Evaluates the distance using the norm of the
% Sasaki Logarithmic map
%
% :param sols: solutions given in a cell struct
% :param params: parameters of each solution given in a cell struct
%
% :returns: Riemannian distance between the first two given solutions
%

sol1 = sols{1};
sol2 = sols{2};

n1 = params{1}.nSteps;
n2 = params{2}.nSteps;

n = min([n1, n2]);

% nSteps = 5;
% maxIt = 1000;
% delta = 0.001;
% tol = 1e-6;

rslt = zeros(n, 1);

for time = 1:n
%     [v, w] = logMapS(sol1(1:3, time), sol1(4:6, time), ...
%                      sol2(1:3, time), sol2(4:6, time), ...
%                      nSteps, maxIt, tol, delta);
%     rslt(time) = norm([v; w]);

v = logMap(sol1(1:3, time), sol2(1:3, time));
w = parallelTranslationAtoB(sol2(1:3, time), sol1(1:3, time), sol2(4:6, time)) - sol1(4:6, time);

rslt(time) = norm([v; w]);
end

end