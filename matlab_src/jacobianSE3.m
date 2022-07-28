function sol = jacobianSE3(v0, v, h, f, action, method)
% Jacobian of the system
%
% :param v0: initial condition
% :param v: current configuration
% :param h: time step size
% :param f: vector field
% :param action: action on the Lie group
% :param method: numerical method in use
%
% :returns: Jacobian of the system

sol = zeros(6);
sol0 = action(expSE3(h*f(v0)), v0);

switch method
    
    % Implicit Lie Euler
    case "implicit Lie Euler method"
        for i = 1:6
            dx = v(i)-v0(i);
            if dx ~= 0
                newV = v0;
                newV(i) = v(i);
                k1 = f(newV);
                partialSol = action(expSE3(h*k1), v0);
                sol(:,i) = (partialSol-sol0)/dx;
            end
        end
        
        sol = sol-eye(6);

    % Implicit Midpoint Rule
    case "implicit midpoint rule"
        for i = 1:6
            dx = v(i)-v0(i);
            if dx ~= 0
                newV = v0;
                newV(i) = v(i);
                k1 = f((newV+v0)/2);
                partialSol = action(expSE3(h*k1), v0);
                sol(:,i) = (partialSol-sol0)/(2*dx);
            end
        end
        
        sol = sol-eye(6);

    otherwise
        error('Method not implemented!')

end

end