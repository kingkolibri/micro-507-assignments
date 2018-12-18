function [J] = cost_function_velocity(T, theta_swing, theta_torso)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes her

    global gT
    global gTheta_swing
    global gTheta_torso
    global gVelocity
    
    gT = T;
    gTheta_swing = theta_swing;
    gTheta_torso = theta_torso;
    
    global gReference_curve
    reference_curve = load('./control/reference_curve.mat');
    gReference_curve = reference_curve.curve;
    
    %% Run simulation
    q0 = [0;0;0]; 
    dq0 = [0;0;0]; %inital q0 and dq0 value
    num_steps = 15; %inital num_steps value
    
    sln = solve_eqns(q0, dq0, num_steps);
    
    %% Compute cost function

    % Extract steps from solution struct
    num_steps = length(sln.T);
    r0 = [0; 0];

    T = [];

    for j = 1:num_steps
        T = cat(1, T, sln.T{j});
    end
    
    for j = 1:num_steps
        Y = sln.Y{j};

        % Update global stance foot coordinates
        [x_swf, ~, ~, ~] = kin_swf(Y(end, 1:3));
        r0 = r0 + [x_swf; 0];

    end

    % normalize by time to discourage immedeate falls, standing
    J =  abs( (r0(1)/T(end)) - gVelocity);

end

