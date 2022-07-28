function sol = NewtonRaphson(residual, jacobian, initial_condition, h, max_it, atol, rtol)

% Newton-Raphson scheme to solve the dEL equations
%
% :param residual: function to evaluate the RHS of the system
% :param jacobian: iteration matrix
% :param initial_condition: initial condition
% :param h: time step size
% :param max_it: maximum number of iterations
% :param atol: absolute tolerance
% :param rtol: relative tolerance
%
% :returns: discrete trajectory

pNew = initial_condition;
dx = zeros(size(initial_condition));
for i = 1:max_it
    sol = residual(initial_condition, pNew, h);

    res = -pNew + sol;
    if norm(res) < rtol*norm(dx) + atol
%             disp(i)
        break
    end

    S_t = jacobian(pNew, initial_condition, h);
    dx = -S_t\res;

    pNew = pNew + dx;
end

if i == max_it
    disp('not converged!')
end

end