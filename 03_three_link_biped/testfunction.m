%test founction
clear all
addpath('./kinematics', './control', './dynamics', './set_parameters/', './solve_eqns/', './visualize') %add path
q0=[pi/6;-pi/3;0]; 
dq0=[0;0;8]; %inital q0 and dq0 value
num_steps=10; %inital num_steps value
sln = solve_eqns(q0, dq0, num_steps);
animate(sln);