%% Script to optimize control parameters

close all;
clc;

set_path();


desired_velocity = 1.0; % <== set desired velocity here

% Initial parameter
T0 = 0.4;
theta_swing0 = -pi/32;
theta_torso0 = pi/32;

x0 = [T0, theta_swing0, theta_torso0];

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



% Set function handler to be optimized
fun = @(x) cost_function_velocity(x(1), x(2), x(3));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

disp(gVelocity)

x = fminsearch( fun,...
                x0,...
                options)