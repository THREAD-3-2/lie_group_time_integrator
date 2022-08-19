function res = actionSE3(A, v)
% action on the SE3 group
%
% :param A: element of the Lie group SE3
% :param v: element of the Lie algebra se3
%
% :returns: element of the Lie algebra se3

res = [A(1:3,1:3)*v(1:3); A(1:3,1:3)*v(4:6) + cross(A(:,end), (A(1:3,1:3)*v(1:3)))];

end