%% Script to optimize control parameters

close all;
clc;

set_path();

% Initial parameter
gKd1 = 514.8;
gKp1 = 1.1;
gKd2 = 34.8;
gKp2 = 2.3;

x0 = [gKd1, gKp1, gKd2, gKp2];

% Set function handler to be optimized
fun = @(x) cost_function_control(x(1), x(2), x(3), x(4));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

x = fminsearch( fun,...
                x0,...
                options)