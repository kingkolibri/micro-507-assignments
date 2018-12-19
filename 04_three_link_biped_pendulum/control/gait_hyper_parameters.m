function [desired] = gait_hyper_parameters(desired_velocity)
%GAIT_HYPERPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

    desired = {};
    
    
    

    if desired_velocity < 0.0
        % Desired values
        desired.T = 0.4;                % swing period
        desired.theta_swing = -pi/16;   % end pitch angle of swing leg
        desired.torso = pi/32;          % torso angle
%     elseif (0.5 < desired_velocity) &&  (desired_velocity <= 0.7)
%         % Desired values
%         desired.T = 0.4;                % swing period
%         desired.theta_swing = -pi/16;   % end pitch angle of swing leg
%         desired.torso = pi/20;          % torso angle
%     elseif (0.7 < desired_velocity) &&  (desired_velocity <= 0.9)
%         % Desired values
%         desired.T = 0.4;                % swing period
%         desired.theta_swing = -pi/16;   % end pitch angle of swing leg
%         desired.torso = pi/20;          % torso angle
%     elseif (0.9 < desired_velocity) &&  (desired_velocity <= 1.1)
%         % Desired values
%         desired.T = 0.4;                % swing period
%         desired.theta_swing = -pi/16;   % end pitch angle of swing leg
%         desired.torso = pi/20;          % torso angle
%     elseif (1.1 < desired_velocity) &&  (desired_velocity <= 1.3)
%         % Desired values
%         desired.T = 0.4;                % swing period
%         desired.theta_swing = -pi/16;   % end pitch angle of swing leg
%         desired.torso = pi/20;          % torso angle
%     elseif (1.3 < desired_velocity)
%         % Desired values
%         desired.T = 0.4;                % swing period
%         desired.theta_swing = -pi/16;   % end pitch angle of swing leg
%         desired.torso = pi/20;          % torso angle
    else
        global gT
        global gTheta_swing
        global gTheta_torso

        % Desired values
        desired.T = gT;                     % swing period
        desired.theta_swing = gTheta_swing; % end pitch angle of swing leg
        desired.torso = gTheta_torso;       % torso angle
    end
        
    
end

