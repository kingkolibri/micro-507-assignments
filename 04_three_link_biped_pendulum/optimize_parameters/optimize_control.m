%% Script to optimize control parameters

close all;
clc;

set_path();

% Initial parameter
gKd1 = 73.4387 + rand(1)*10;
gKp1 = 500.276483264287 + rand(1)*100;
gKd2 = 0;
gKp2 = 0;

x0 = [gKd1, gKp1, gKd2, gKp2];

% Set function handler to be optimized
fun = @(x) cost_function_control(x(1), x(2), x(3), x(4));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

x = fminsearch( fun,...
                x0,...
                options)