% You can set any hyper parameters of the control function here; you may or
% may not want to use the step_number as the input of the function. 
function [Kd1, Kp1, Kd2, Kp2] = control_hyper_parameters(step_number)

    global gKd1
    global gKp1
    global gKd2
    global gKp2
    
    Kd1 = gKd1;
    Kp1 = gKp1;
    Kd2 = gKd2;
    Kp2 = gKp2;
    
% kd=500; %0.01
% kp=1;%0.1
% 
% kd2=3; %0.01
% kp2=30;%0.1d
end
