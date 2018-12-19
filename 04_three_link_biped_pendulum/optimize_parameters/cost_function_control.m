function [J] = cost_function_control(Kd1, Kp1, Kd2, Kp2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes her

    global gKd1
    global gKp1
    global gKd2
    global gKp2
    
    gKd1 = Kd1;
    gKp1 = Kp1;
    gKd2 = Kd2;
    gKp2 = Kp2;
    
    global gT
    global gTheta_swing
    global gTheta_torso

    gT = 0.5;
    gTheta_swing = -pi/16;
    gTheta_torso = pi/64;
    
    global gDesiredVelocity
    gDesiredVelocity = 0.5;
    
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
    J = 0;

    for j = 1:num_steps
        T = cat(1, T, sln.T{j});
    end
    
    for j = 1:num_steps
        time = sln.T{j};
        Y = sln.Y{j};
        [N, ~] = size(Y);

        for n = 1:N

            q = Y(n, 1:3);
            dq = Y(n, 4:6);

            % Desired outputs
            [do(1:3), ~]  = desired_outputs(q, dq,...
                                            0, 0,...
                                            time(n), time(1));

            % Control error (L2 norm to discourage large abbreviations)
            J = J + abs(q(3) - do(3)) + (q(2) - do(2))^2;

            % Controller outputs (not used yet)
            % u = control(T(i), q, dq, do(1:3), do(4:6), j); 

        end

        % Update global stance foot coordinates
        [x_swf, ~, ~, ~] = kin_swf(q);
        r0 = r0 + [x_swf; 0];

    end

    % normalize by time to discourage immedeate falls, standing
    J = J/length(T) + 10 - r0(1);

end

