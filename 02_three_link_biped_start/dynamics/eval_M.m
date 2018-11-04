%%
% Evaluate the Mass matrix given q
function M = eval_M(q)

    q1 = q(1);
    q2 = q(2);
    q3 = q(3);

    [l1, l2, l3, m1, m2, m3, ~] = set_parameters;

    t2 = q1-q2;
    t3 = cos(t2);
    t4 = q1-q3;
    t5 = cos(t4);
    t6 = (l1.*l3.*m3.*t5)./2.0;
    M = reshape([l1.^2.*(m1./4.0+m2+m3),l1.*l2.*m2.*t3.*(-1.0./2.0),t6,l1.*l2.*m2.*t3.*(-1.0./2.0),(l2.^2.*m2)./4.0,0.0,t6,0.0,(l3.^2.*m3)./4.0],[3,3]);

end