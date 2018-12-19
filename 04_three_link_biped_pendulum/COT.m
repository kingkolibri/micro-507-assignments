function [cot]=COT(num_steps,dq1,dq2,dq3,u1,u2,x_swf,x_h)

t=x_h;
X=x_swf;
B1=dq3-dq1;
B2=dq3-dq2;

dt(1)=t(1);
for i=2:num_steps
    dt(i)=t(i)-t(i-1);
end


for i=1:num_steps
    
    shang1=max(0,u1(i)*B1(i))*dt(i);
    COT1(i)=shang1/X(i);
    
    shang2=max(0,u2(i)*B2(i))*dt(i);
    COT2(i)=shang2/X(i);
    
end

cot=COT1+COT2;

step=1:1:num_steps;
plot(step,cot),title('CoT vs step');

end

