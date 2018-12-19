%% Script to optimize control parameters

close all;
clc;

set_path();

% Initial parameter
gKd1 = -1.9683 - rand(1)*10; % 18.5311;
gKp1 = -38.7703 - rand(1)*100;
gKd2 = 2.6602 + rand(1)*10;
gKp2 = 30.7931 + rand(1)*100;

x0 = [gKd1, gKp1, gKd2, gKp2];

% Set function handler to be optimized
fun = @(x) cost_function_control(x(1), x(2), x(3), x(4));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

x = fminsearch( fun,...
                x0,...
                options)