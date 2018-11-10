%% 
% This function defines the event function.
% In the three link biped, the event occurs when the swing foot hits the
% ground.
%%
function [value,isterminal,direction] = event_func(t, y)

% you may want to use kin_swf to set the 'value'
[~, ~, ~, dz_swf] = kin_swf(y(1:3), y(4:6));

% Trigger event if z of swing foot does not change anymore because it 
% is constraint by the ground.
value       = dz_swf;   % The value that we want to be zero
isterminal  = 0;        % Halt integration --> No
direction   = -1;       % Negative direction only

end
