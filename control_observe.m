A=input('the matrix A');
B=input('the matrix B');
C=input('the matrix C');
Qc=ctrb(A,B);
Qo=obsv(A,C);
n=size(A);
I=eye(n);
if(rank(Qc)<n(1))
T=[Qc(:,1:rank(Qc)),round(rand(n(1),n(1)-rank(Qc)))];
else
    L=zeros(n);
    l=poly(A);
    l(1)=[];
    l(n)=[];
    l=[fliplr(l) ,1 ,zeros(1,n(1))];
    for  m=1:size(B)
       for  n=1:size(B)
       L(m,n)=l(n+m-1);
       end
    end
    T=Qc*L;
end


syms s;
Gs=C/(s*I-A)*B;
Ac=T\A*T;
Bc=T\B;
Cc=C*T;
disp('control matrix');
disp(Qc);
disp('control rank');
disp(rank(Qc));
disp('observe matrix');
disp(Qo);
disp('observe rank');
disp(rank(Qo));
disp('G(s)')
disp(Gs);
disp('Ac');
disp(Ac);
disp('Bc');
disp(Bc);
disp('Cc');
disp(Cc);