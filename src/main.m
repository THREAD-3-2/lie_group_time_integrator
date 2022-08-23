% Damped Spherical Pendulum solved with Lie groups time integrator
%

clearvars
clc

addpath('integrator')

%% DEFINITION OF NUMERICAL PARAMETERS AND TIME INTEGRATION
% CHOOSE a method
%
% DEFINE
% initial and final time
% number of time steps
% time vector
% time step size
% maximal iteration steps for implicit methods
% tolerance (relative and absolute) for Netwon iteration

method = 1;
switch method
    case 1
        my_method = "explicit Lie Euler method";
    case 2
        my_method = "implicit Lie Euler method";
    case 3
        my_method = "implicit midpoint rule";
    case 4
        clearvars
        return
    otherwise
        error('Method Not Implemented yet');
end

t0 = 0;
te = 1;
nSteps = 1e5;
timeVec = linspace(t0, te, nSteps); 
dt = timeVec(2) - timeVec(1);

max_it = 10;
atol = 1e-10;
rtol = 1e-10;

%% PHYSICAL PARAMETERS

% LENGTH, MASS, DAMPING, AND k OF THE PENDULUM
L = 1; 
m = 1;
d = 0.1;
k = 0;

%% SAVE PARAMETERS TO FILE
% save the time stamp as a string.
% format: 'yyyyMMddTHHmmss'
timestamp = datestr(now,30);
filename = strcat('out/', timestamp, 'prm', '.mat');
save(filename)

%% DEFINITION OF USEFUL FUNCTIONS

% RHS OF THE SYSTEM
% ACTION AND EXPONENTIAL (OF THE LIE GROUP)
% RESIDUAL AND JACOBIAN (FOR IMPLICIT METHODS)
f = @(v) fManiToAlgebra(v, d, k); 
action = @(B, input) actionSE3(B, input);
expMap = @(v) expSE3(v);
myRes = @(v0, v, h) residualSE3(v0, v, h, f, action, my_method);
myJac = @(v0, v, h) jacobianSE3(v0, v, h, f, action, my_method);

%% INITIALIZATION OF THE PROBLEM

[q0, w0, z0] = initializeSE3();
qSol = zeros(3, nSteps);
wSol = zeros(3, nSteps);
zSol = zeros(6, nSteps);

qSol(:, 1) = q0;
wSol(:, 1) = w0;
zSol(:, 1) = z0;

%% SOLUTION OF THE SYSTEM

for i = 2:nSteps
    if method == 1
        zSol(:, i) = LieEuler(f, action, expMap, zSol(:, i-1), dt);
    else
        zSol(:, i) = NewtonRaphson(myRes, myJac, zSol(:, i-1), dt, max_it, atol, rtol);
    end
    qSol(:, i) = zSol(1:3, i);
    wSol(:, i) = zSol(3+(1:3), i);
end

%% SAVE SOLUTION ON TXT FILE
% save the time stamp as a string.
% format: 'yyyyMMddTHHmmss'
filename = strcat('out/', timestamp, 'sol', '.mat');
save(filename, 'zSol')
