clc
clear 
A=[-20 20;0 0];
B=[0;1];
C=[1 0];
D=[0];
disp(rank(ctrb(A,B)))
sys=ss(A,B,C,D);
t=0:0.01:5;
y=step(sys,t);
P=[-7.07+7.07*1i -7.07-7.07*1i];
K=acker(A,B,P);
sys_new=ss(A-B*K,B,C,D);
y_new=step(sys_new,t);
figure()
plot(t,y,'b');
figure()
plot(t,y_new,'r');
