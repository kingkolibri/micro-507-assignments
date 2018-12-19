% If you are using the virtual constraints or trajectory based control
% methods, then you may cosider using a function such as this. 
function [hd, dhd] = desired_outputs(s, ds, q0, dq0, delta_t, t0)

    % desired gait hyperparameters
    global gDesiredVelocity
    desired = gait_hyper_parameters(gDesiredVelocity);


    global gReference_curve
    reference_curve = gReference_curve;
    reference_curve_lenght = length(reference_curve);

    % Build desired angles vectors
    hd = [s(1); desired.theta_swing; desired.torso];
    
    if t0 == 0
        % at beginning use large value to get robot walking 
        hd(2) = desired.theta_swing;
    else
        % after first step guide walking along reference curve
        index = length(reference_curve)*((delta_t-t0)/desired.T)  +1;
        index = min(floor(index), reference_curve_lenght);
        hd(2) = -desired.theta_swing*reference_curve(index);
    end
    
    dhd = zeros(3,1);
    dhd(1) = ds(1);
    
    % Fall protection:
   if(s(1)*s(2) > 0)&&(abs(s(1))>0.2)
       % both legs are on same side of torso, enforce stable stand
       % hd(2) = -s(2);
       % actually makes no sense here , because when swing leg is at same
       % position as stance leg, the event func will trigger stance phases
       % until the simulation ends.
    end
end