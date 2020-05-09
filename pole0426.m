clc
clear 
A=[0 10 0; 0 -2 2;0 0 -5];
B=[0 ;0 ;5];
C=[1 0 0];
D=[0];
disp(rank(ctrb(A,B)))
sys=ss(A,B,C,D);
t=0:0.01:5;
y=step(sys,t);
P=[-9 -2+2*1i -2-2*1i];
K=acker(A,B,P);
sys_new=ss(A-B*K,B,C,D);
y_new=step(sys_new,t);
figure()
plot(t,y,'b');
figure()
plot(t,y_new,'r');
