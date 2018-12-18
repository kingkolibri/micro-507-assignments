% Demo skript for project

close all;
clc;

set_path();

% Set control parameters (global visibility only necessary for optimization)
global gKd1
global gKp1
global gKd2
global gKp2
global gReference_curve

gKd1 = 859.5549;
gKp1 = 1.2098;
gKd2 = 0.8898;
gKp2 = 28.7090;
reference_curve = load('./control/reference_curve.mat');
gReference_curve = reference_curve.curve;

% Initial values
q0=[0;0;0]; 
dq0=[0;0;0]; %inital q0 and dq0 value
num_steps=15; %inital num_steps value

% Start solver
sln = solve_eqns(q0, dq0, num_steps);

% Visualize simulation
animate(sln);
analyze(sln);