%% 
% Evaluate the gravity matrix G given q
function G = eval_G(q)

q1 = q(1);
q2 = q(2);
q3 = q(3);

[l1, l2, l3, m1, m2, m3] = set_parameters;

t2 = sin(q1);
G = [l1.*(g.*m1.*t2+g.*m2.*t2.*2.0+g.*m3.*t2.*2.0+l1.*m2.*q1.*2.0+l1.*m3.*q1.*2.0).*(-1.0./2.0);(g.*l2.*m2.*sin(q2))./2.0;g.*l3.*m3.*sin(q3).*(-1.0./2.0)];


end