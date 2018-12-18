function u = control(t, q, dq, q0, dq0, t0)
% You may call control_hyper_parameters and desired_outputs in this
% function
% you don't necessarily need to use all the inputs to this control function

[Kd1, Kp1, Kd2, Kp2] = control_hyper_parameters(t0);

% Determine desired state values
[hd, dhd] = desired_outputs(q, dq, q0, dq0, t, t0);

% Compute control outputs
u1 = Kp1*(wrapToPi(q(3))-hd(3)) + Kd1*dq(3); % torso control
u2 =-Kp2*(wrapToPi(q(2))-hd(2)) - Kd2*dq(2); % swing leg control

u=[u1;u2];


% We still have spikes in our control output! We should try to tune the
% parameter or at least lowpass filter u1 and u2.

% Enforce output constraints
u = max(min(u,30),-30);

end