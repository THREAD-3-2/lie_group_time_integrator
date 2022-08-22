function plotErr(error)
% plotting error
%
% :params error: absolute and relative error
% over position and angular velocity
%

absErrq = error.q_abserr;
absErrw = error.w_abserr;
relErrq = error.q_relerr;
relErrw = error.w_relerr;

steps = error.steps;

figure()
subplot(2, 1, 1)
loglog(steps, absErrq, '-or', 'LineWidth', 3)
hold on
loglog(steps, absErrw, '-ob', 'LineWidth', 3)
loglog(steps, steps, ':k', 'LineWidth', 3)
loglog(steps, steps.^2, '--k', 'LineWidth', 3)
legend('error on q', 'error on w', 'first order', 'second order')
xlabel('time step size', 'FontSize', 16)
ylabel('absolute error', 'FontSize', 16)
title('Absolute error over time step size', 'FontSize', 16)
grid('on')

subplot(2, 1, 2)
loglog(steps, relErrq, '-or', 'LineWidth', 3)
hold on
loglog(steps, relErrw, '-ob', 'LineWidth', 3)
loglog(steps, steps, ':k', 'LineWidth', 3)
loglog(steps, steps.^2, '--k', 'LineWidth', 3)
legend('error on q', 'error on w', 'first order', 'second order')
xlabel('time step size', 'FontSize', 16)
ylabel('relative error', 'FontSize', 16)
title('Relative error over time step size', 'FontSize', 16)
grid('on')

end