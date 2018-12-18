%% Script to optimize control parameters

% Initial parameter
gKd1 = 269.6263;
gKp1 = 2.4294;
gKd2 = -0.0547;
gKp2 = 24.3599;

x0 = [gKd1, gKp1, gKd2, gKp2];

% Set function handler to be optimized
fun = @(x) cost_function_control(x(1), x(2), x(3), x(4));

% Run optimizer
options = optimset('PlotFcns',@optimplotfval);

x = fminsearch( fun,...
                x0,...
                options)