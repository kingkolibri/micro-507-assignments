%% Read the README_ASSIGN4.pdf to see what results you need to analyze here. 
function sln = analyze(sln)

num_steps = length(sln.T);
r0 = [0; 0];

T = [];
Q = [];
DQ= [];
x_swf_total=[];
control_error = 0;
i = 0;

for j = 1:num_steps
    time = sln.T{j};
    Y = sln.Y{j};
    [N, ~] = size(Y);
    
    for n = 1:N
        
        q = Y(n, 1:3)';
        dq = Y(n, 4:6)';
        
        T = cat(1, T, time(n));
        Q = cat(2, Q, q);
        DQ= cat(2, DQ, dq);
        
        i = i+1;
        
        % Desired outputs
        [Do(1:3,i), Do(4:6,i)]  = desired_outputs(q, dq,...
                                                    0, 0,...
                                                    T(i), time(1));
                                                   
        % Control error (L2 norm to discourage large abbreviations)
        control_error = control_error + (q(2) - Do(2,i))^2 ...
                                      + (q(3) - Do(3,i))^2;
        
        % Hip position
        [Hip(i,1), Hip(i,2), ~, ~] = kin_hip(q);        
        Hip(i,1) = Hip(i,1) + r0(1);
        
        % Controller outputs
        U(i,:) = control(i, q, dq, Do(1:3,i), Do(4:6,i), i); 
        
    end
    [x_swf, ~, ~, ~] = kin_swf(q);
    x_swf_total=[x_swf_total,x_swf];
    r0 = r0 + [x_swf; 0];
end
	
    
    %% Plot graphs for analysis
    figure('name', 'Analyze state variables',...
           'units','normalized',...
           'outerposition', [0 0 1 1])
       
    set(groot, 'defaultLegendInterpreter','latex');
    
    colors = [0,114,189;... % blue
              222,104,54;...% orange
              237,177,32]./255;
    
    
    % Plot joint angles
        subplot(2,2,1)
        hold on
        
        % actual state
            plot(T, Q(1,:), 'DisplayName', '$q_1$',...
                            'LineStyle', '-', 'Color', colors(1,:))
            plot(T, Q(2,:), 'DisplayName', '$q_2$',...
                            'LineStyle', '-', 'Color', colors(2,:))
            plot(T, Q(3,:), 'DisplayName', '$q_3$',...
                            'LineStyle', '-', 'Color', colors(3,:))

        % desired state
            plot(T, Do(1,:), 'DisplayName', '$q_{1,desired}$',...
                             'LineStyle', ':', 'Color', colors(1,:))
            plot(T, Do(2,:), 'DisplayName', '$q_{2,desired}$',...
                             'LineStyle', ':', 'Color', colors(2,:))
            plot(T, Do(3,:), 'DisplayName', '$q_{3,desired}$',...
                             'LineStyle', ':', 'Color', colors(3,:))

        hold off
        title('Joint angles')
        xlabel('Time [s]')
        ylabel('Angle [rad]')
        legend()

        subplot(2,2,3)
        hold on
            plot(T, DQ(1,:), 'DisplayName', '$\dot{q}_1$')
            plot(T, DQ(2,:), 'DisplayName', '$\dot{q}_2$')
            plot(T, DQ(3,:), 'DisplayName', '$\dot{q}_3$')
        hold off
        title('Joint angles derrivatives')
        xlabel('Time [s]')
        ylabel('Angle derrivative [\delta rad]')
        legend()

   % Plot controller outputs over time
        subplot(2,2,4)
        hold on
            plot(T, U(:,1), 'DisplayName', '$u_1$')
            plot(T, U(:,2), 'DisplayName', '$u_2$')
        hold off
        title('Controller outputs')
        xlabel('Time [s]')
        ylabel('u [Nm]')
        legend()

    % Plot hip position over time
            subplot(2,2,2)
            hold on
                plot(T, Hip(:,2))
            hold off
            title('Hip position in space')
            xlabel('Time [s]')
            ylabel('z position [m]')


% Phase potraits of biped links
figure('name', 'Analyze phase potrait')
hold on
    plot(Q(:,1), DQ(:,1), 'DisplayName', 'Link 1')
    plot(Q(:,2), DQ(:,2), 'DisplayName', 'Link 2')
    plot(Q(:,3), DQ(:,3), 'DisplayName', 'Link 3')
hold off
title('Phase potrait of biped links')
xlabel('q [rad]')
ylabel('$\dot{q}$ [rad/s]', 'Interpreter', 'latex')
legend()

% Plot hip position (to determine velocity)
figure('name', 'Horizontal hip position')
            hold on
                plot(T, Hip(:,1))
            hold off
            title('Hip position in space')
            xlabel('Time [s]')
            ylabel('x position [m]')
% Plot CoT
 cot = COT( num_steps,...
            DQ(1,:), DQ(2,:), DQ(3,:),...
            U(:,1), U(:,2),...
            x_swf_total, Hip(:,1));
	    
end
