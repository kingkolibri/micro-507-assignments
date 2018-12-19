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

gKd1 = 664.3467;
gKp1 = 3.7122;
gKd2 = 5.007;
gKp2 = 149.2581;

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
