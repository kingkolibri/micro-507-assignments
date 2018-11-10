%% Solve equations of motion 
% Note: eqns.m defines the equations of motion to be solved by this script
% This function returns the time vector T, the solution Y, the event time
% TE, solution at the event time YE.
% q0, dq0 are the initial angles and angular velocities, num_steps are the
% number of steps the robot is supposed to take
% As an example you can use q0 = [pi/6; -pi/3; 0] and dq0 = [0;0;0]. 

function sln = solve_eqns(q0, dq0, num_steps)

% options = ...
h = 0.001; % time step
tmax = 2;           % max time that we allow for a single step
tspan =  0:h:tmax;  % from 0 to tmax with time step h
y0 = [q0; dq0];
t0 = 0;

% we define the solution as a structure to simplify the post-analyses and
% animation, here we intialize it to null. 
sln.T = {};
sln.Y = {};
sln.TE = {};
sln.YE = {};
sln.IE = {};

options = odeset('RelTol', 1e-5, 'Events', @event_func);


    for i = 1:num_steps
        
        % use ode45 to solve the equations of motion (eqns.m)
        [T, Y, TE, YE, IE] = ode45(@eqns, tspan, y0, options);

        sln.T{i} = T;
        sln.Y{i} = Y;
        sln.TE{i} = TE;
        sln.YE{i} = YE;
        sln.IE{i} = IE;
        
        if T(end) == tmax
            break
        end

        % Impact map
        if(TE==1)
            [q_p, dq_p] = impact(Y(TE, 1:3), Y(TE, 4:5));
            y0 = [q_p; dq_p];
        else
            y0 = Y(end,:);
        end

        t0 = T(end);

    end
end


