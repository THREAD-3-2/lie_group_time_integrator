function F = fManiToAlgebra(y, damp, k)
% Right hand side of the mathematical pendulum
%
% :param y: generalized coordinates
% :param damp: damping parameter
% :param k: parameter
%
% :returns: vector field
%

q = y(1:3);
w = y(3 + (1:3));

g = 9.81;
e3 = [0; 0; 1];
V = g * cross(e3, q) - damp * w + k * (w'*q) * q;

F = zeros(6, 1);
F(1:3) = w;
F(4:6) = skw(q) * V;

end