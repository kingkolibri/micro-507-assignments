%%
% Evaluate the Coriolis matrix C, given q, dq
function C = eval_C(q, dq)
    
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    
    [l1,l2,l3,~,m2,m3] = set_parameters;
    
    t2 = q1+q2;
    t3 = q1+q3;
    t4 = cos(t2);
    t5 = sin(t2);
    t6 = t4-q1.*t5;
    t7 = cos(t3);
    t8 = sin(t3);
    t9 = t7-q1.*t8;
    t10 = (l1.*l3.*m3.*t9)./2.0;
    C = reshape([0.0,(l1.*l2.*m2.*t6)./2.0,-t10,l1.*l2.*m2.*t6.*(-1.0./2.0),0.0,0.0,t10,0.0,0.0],...
                [3,3]);

end