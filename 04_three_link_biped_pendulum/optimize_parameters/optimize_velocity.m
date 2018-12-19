%% Script to optimize control parameters

close all;
clc;

set_path();


desired_velocity = 1.0; % <== set desired velocity here

% Initial parameter
T0 = 0.4326 + rand(1)*1;
theta_swing0 = -0.1271 + rand(1)*1;
theta_torso0 = 0.0492 + rand(1)*1;

x0 = [T0, theta_swing0, theta_torso0];

% Set control parameters (global visibility only necessary for optimization)
global gKd1
global gKp1
global gKd2
global gKp2
global gReference_curve
global gDesiredVelocity

gKd1 = 159.8387;
gKp1 = 1519.776483264287;
gKd2 = 0;
gKp2 = 0;

reference_curve = load('./control/reference_curve.mat');
gReference_curve = reference_curve.curve;
gDesiredVelocity = desired_velocity;



% Set function handler to be optimized
fun = @(x) cost_function_velocity(x(1), x(2), x(3));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

disp(gDesiredVelocity)

x = fminsearch( fun,...
                x0,...
                options)