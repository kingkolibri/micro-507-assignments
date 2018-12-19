% Demo skript for project

close all;
clc;

set_path();

save_results = 0;

% Initial values
q0=[0;0;0]; 
dq0=[0;0;0]; %inital q0 and dq0 value
num_steps=15; %inital num_steps value
desired_velocity = 0.5;

% Set control parameters (global visibility only necessary for optimization)
global gKd1
global gKp1
global gKd2
global gKp2
global gReference_curve
global gDesiredVelocity

gKd1 = 73.4387;
gKp1 = 4046.276483264287;
gKd2 = 0;
gKp2 = 0;

global gT
global gTheta_swing
global gTheta_torso

gT = 0.4;
gTheta_swing = -pi/16;
gTheta_torso = pi/64;

reference_curve = load('./control/reference_curve.mat');
gReference_curve = reference_curve.curve;
gDesiredVelocity = desired_velocity;

% Start solver
sln = solve_eqns(q0, dq0, num_steps);

% Visualize simulation
animate(sln);
analyze(sln);

if save_results
    save('results_' + 'v' + num2str(desired_velocity) +'.mat', 'sln')
end
