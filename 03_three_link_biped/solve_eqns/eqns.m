function dy = eqns(t, y)
% n this is the dimension of the ODE, note that n is 2*DOF, why? 
% y1 = q1, y2 = q2, y3 = q3, y4 = dq1, y5 = dq2, y6 = dq3

    q = y(1:3);
    dq = y(4:6);

    u = control(q, dq); % for the moment we set the control outputs to zero

    n = 6;   
    dy = zeros(n, 1);

    % write down the equations for dy:
    dy(1) = y(4);
    dy(2) = y(5);
    dy(3) = y(6);

    ddq = eval_M(q) \ ( eval_B() * u...
                       -eval_C(q, dq) * dq...
                        -eval_G(q) ...
                           );

    dy(4) = ddq(1);
    dy(5) = ddq(2);
    dy(6) = ddq(3);

end