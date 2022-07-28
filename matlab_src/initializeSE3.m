function [q0, w0, z0] = initializeSE3()

% Initialization in SE3
%
% :returns: normalized verctor in R3
% respective orthogonal vector (angular velocity)
% concatenation of the two

q0 = 2 .* rand(3, 1) - 1;
q0 = q0/norm(q0, 2); %dividiamo per la norma per make sure che siamo sulla sfera unitaria
v = rand(3, 1);
w0 = cross(q0, v);

z0 = [q0; w0];

end
