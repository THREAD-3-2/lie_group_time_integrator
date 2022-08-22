function rslt = expSE3(input)
% exponential map on the SE3 group
%
% :param input: element of the Lie algebra se3
%
% :returns: element of the Lie group SE3
%
    
u = input(1:3);
v = input(4:6);
theta = norm(u,2);

tol = 1e-16;  

if theta>tol
    rslt = sin(theta)/theta;
    B = (1-cos(theta))/(theta^2);
    C = (1-rslt)/(theta^2);
    V = eye(3) + B*hat(u) + C * hat(u) * hat(u);
    rslt = [expRodrigues(u), V*v];
elseif theta==0
    rslt = [expRodrigues(u), v];
else
    Blow = 0.5-theta^2/24 + theta^4/720 - theta^6/40320;
    Clow = (1/6-theta^2/120+theta^4/5040-theta^6/362880);
    Vlow = eye(3) + Blow*hat(u) + Clow * hat(u) * hat(u);
    rslt = [expRodrigues(u), Vlow*v];
end
    
end