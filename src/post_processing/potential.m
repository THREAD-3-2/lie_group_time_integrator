function val = potential(q, L, m)
% Potential energy of a pendulum
% subject to Earth gravity [g = 9.81 m/s^2]
% with fix end in [0, 0, 0]
%
% :param q: position vector
% :param L: lenght of the pendulum
% :param m: mass of the pendulum
%
% :results: potential energy
%

g = 9.81;
e3 = [0; 0; 1];

val = g * m * e3' * q + L * g * m;

end