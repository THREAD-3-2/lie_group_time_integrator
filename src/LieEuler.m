function sol = LieEuler(vector_field, action, expMap, initial_condition, h)
% Lie Forward Euler time integrator
%
% :param vector_field: right hand side of the ODE
% :param action: action on the Lie group
% :param expMap: exponential map from the Lie algebra to the Lie group
% :param initial_condition: initial condition
% :param h: time step size
%
% :returns: discrete trajectory

f = vector_field(initial_condition);

sol = action(expMap(h*f), initial_condition); 

end