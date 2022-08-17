function sol = residualSE3(v0, v, h, f, action, method)
% RHS of the system
%
% :param v0: initial condition
% :param v: current configuration
% :param h: time step size
% :param f: vector field
% :param action: action on the Lie group
% :param method: numerical method in use
%
% :returns: RHS of the system

switch method
    case "implicit Lie Euler method"
        % Implicit Lie Euler
        sol = action(expSE3(h*f(v)), v0);
    case "implicit midpoint rule"
        % Implicit Midpoint Rule
        sol = action(expSE3(h*f((v+v0)/2)), v0);
    case "trapezoidal rule"
        % Trapezoidal Rule
        sol = action(expSE3(h/2*(f(v)+f(v0))), v0);
    otherwise
        error('Method not implemented!')
end

end

