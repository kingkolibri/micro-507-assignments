% Demo skript for project

close all;
clc;

set_path();

save_results = 0;

% Initial values
q0=[0;0;0]; 
dq0=[0;0;0]; %inital q0 and dq0 value
num_steps=50; %inital num_steps value
desired_velocity = 0.5;

% Set control parameters (global visibility only necessary for optimization)
global gKd1
global gKp1
global gKd2
global gKp2
global gReference_curve
global gDesiredVelocity

gKd1 = 859.5549;
gKp1 = 1.2098;
gKd2 = 0.8898;
gKp2 = 28.7090;

global gT
global gTheta_swing
global gTheta_torso

gT = 0.5;
gTheta_swing = -pi/16;
gTheta_torso = pi/32;

gDesiredVelocity = desired_velocity;

% Start solver
sln = solve_eqns(q0, dq0, num_steps);

% Visualize simulation
animate(sln);
analyze(sln);

if save_results
    save('results_' + 'v' + num2str(desired_velocity) +'.mat', 'sln')
end
