clear all
clf
close all

%% 
q_m = [pi/6; -pi/6; pi/10];
dq_m = [1; 0.2; 0];

disp('Energy before impact')

[T_before, V_before] = eval_energy(q_m, dq_m)

% Apply impact mapping

[q_p, dq_p] = impact(q_m, dq_m);

disp('Energy after impact')

[T_after, V_after] = eval_energy(q_p, dq_p)

disp(['Kinetic energy lost due to impact: ' , num2str(T_after / (T_before/100) ), ' %'])

%% Kinematic energy loss over impact angle
dq_m = [1; 0.2; 0];

alphas = linspace(0, pi/4, 1000);

for alpha = alphas
        
    q_m = [alpha; -alpha; 0];
    dq_m = [1; 0.2; 0];

    %'Energy before impact'
    [T_before, V_before] = eval_energy(q_m, dq_m);

    % Apply impact mapping
    [q_p, dq_p] = impact(q_m, dq_m);

     % 'Energy after impact'
    [T_after, V_after] = eval_energy(q_p, dq_p);
    
    loss = T_after/(T_before/100);
    
    if exist('losses', 'var')
        losses = [losses, loss];
    else
        losses = loss; 
    end
    
end

figure;
plot(alphas, losses)
title('Kinetic losses during stance phase over impact angle $\alpha$', 'Interpreter','latex')
xlabel('$\alpha$ [rad]', 'Interpreter','latex')
xticks([0, pi/16, pi/8, 3*pi/16, pi/4])
xticklabels({'0','\pi/16','\pi/8','3\pi/16','\pi/4'})
ylabel('Loss [\% of kinetic energy before impact]', 'Interpreter','latex')