function plotEnergy(sols, params)
% plotting energy
%
% :param sols: solutions given in a cell struct
% :param params: parameters of each solution given in a cell struct
%

% ENERGY EVALUATION
Energy_kinetic = @(q, w, damp, M) 0.5 * M * cross(w, q)' * cross(w, q);
Energy_potential = @(q, w, L, M) potential(q, L, M);

[m, ~] = size(sols);

for i = 1:m
    qSol = sols{i}(1:3, :);
    wSol = sols{i}(4:6, :);
    damp = params{i}.damp;
    M = params{i}.m;
    L = params{i}.L;

    n = params{i}.N_TIME;
    timeVec = linspace(params{i}.t0, params{i}.T, params{i}.N_TIME);
    K = zeros(n, 1);
    P = zeros(n, 1);

    for j = 1:n
        K(j) = Energy_kinetic(qSol(:, j), wSol(:, j), damp, M);
        P(j) = Energy_potential(qSol(:, j), wSol(:, j), L, M);
    end

    figure()
    ax(1) = subplot(2, 1, 1);
    plot(timeVec, (K+P), timeVec, P, timeVec, K, 'LineWidth', 3)
    ylabel('Energy', 'FontSize', 16)
    legend('Total Energy', 'Potential Energy', 'Kinetic Energy')
    grid()
    ax(2) = subplot(2, 1, 2);
    plot(timeVec, (K+P), 'LineWidth', 3)
    ylabel('Total Energy', 'FontSize', 16)
    grid()
    linkaxes(ax,'x');
    xlabel('Time', 'FontSize', 16)
    sgtitle("Energy of the system "+num2str(i), 'FontSize', 18)

    figure()
    plot(timeVec(2:end), diff(K+P)./diff(timeVec), 'r-', 'LineWidth', 3)
    xlabel('Time', 'FontSize', 16)
    ylabel('Energy', 'FontSize', 16)
    legend('D(Total Energy)/D(time)')
    grid()
    title("Time Derivative of the Energy of the system "+num2str(i), 'FontSize', 18)

end

end