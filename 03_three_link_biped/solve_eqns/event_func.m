%% 
% This function defines the event function.
% In the three link biped, the event occurs when the swing foot hits the
% ground.
%%
function [value,isterminal,direction] = event_func(t, y)

% you may want to use kin_swf to set the 'value'
[~, z_swf, ~, ~] = kin_swf(y(1:3), y(4:6));

% Trigger event if z of swing foot does not change anymore because it 
% is constraint by the ground.
value       = z_swf+0.001;  % The value that we want to be zero %ԭdz_swf
isterminal  = 1;            % Halt integration --> No   ԭ0
direction   = -1;           % Negative direction only  ԭ-1

end
