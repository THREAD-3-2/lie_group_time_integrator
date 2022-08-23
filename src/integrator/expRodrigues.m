function [ExpSO3_] = expRodrigues(x)
% Exponantial map for SO3

a  = norm(x,2);

if a == 0
    ExpSO3_ = eye(3);
elseif a > 1e-20
        alpha = sin(a)/a;
        beta = (1-cos(a))/a^2;
        ExpSO3_ = eye(3) + alpha*skw(x) + beta*skw(x)^2;
    else
        ExpSO3_ = zeros(3);
        powi = eye(3);
        for i=0:15
            ExpSO3_ = ExpSO3_...
                +(1/factorial(i))*powi;
            powi = powi * skw(x);
        end     
end

end
