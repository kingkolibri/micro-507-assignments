function A_p = eval_A_p(q_p)
    [m, ~, m3, l1, l2, l3, ~] = set_parameters();
    
    q1_p = q_p(1);
    q2_p = q_p(2);
    q3_p = q_p(3);
    
    t2 = l1.^2;
    t3 = q1_p-q2_p;
    t4 = cos(t3);
    t5 = (l1.*l2.*m.*t4)./2.0;
    t6 = l2.^2;
    t7 = (l1.*l2.*m3.*t4)./2.0;
    t8 = q2_p-q3_p;
    t9 = cos(t8);
    t10 = (l2.*l3.*m3.*t9)./4.0;
    A_p = reshape([t5+t7-m.*t2.*(5.0./4.0)-m3.*t2,t5,t7,t5-(m.*t6)./4.0,m.*t6.*(-1.0./4.0),0.0,t10-(l1.*l3.*m3.*cos(q1_p-q3_p))./2.0,0.0,t10],[3,3]);

end