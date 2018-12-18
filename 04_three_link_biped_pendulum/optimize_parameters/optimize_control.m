%% Script to optimize control parameters

close all;
clc;

set_path();

% Initial parameter
gKd1 = 664.3467;
gKp1 = 3.7122;
gKd2 = 5.007;
gKp2 = 149.2581;

x0 = [gKd1, gKp1, gKd2, gKp2];

% Set function handler to be optimized
fun = @(x) cost_function_control(x(1), x(2), x(3), x(4));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

x = fminsearch( fun,...
                x0,...
                options)