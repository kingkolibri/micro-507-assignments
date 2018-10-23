%%
% Evaluate the Mass matrix given q
function M = eval_M(q)

[l1, l2, l3, m1, m2, m3] = set_parameters;
M = reshape([(l1.^2.*m1)./4.0,0.0,0.0,0.0,(l2.^2.*m2)./4.0,0.0,0.0,0.0,(l3.^2.*m3)./4.0],[3,3]);

end