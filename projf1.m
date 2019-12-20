clc; clear all; close all;
N=8; M=8;
k=input('enter the total no.of samples');
for n=0:1:k
    for i=0:1:7
        y(n)=x(n-i+1);
        z(n)=x(n-i);
        x(n)=y(n)-z(n);
        x1(n)=x(n)*x(n);
        x2(n)=abs(x1(n));
        a(n)=x(n)*(N-i+1);
    end
end
for n=0:1:k
    for j=0:1:7
        b(n)=a(n-j);
        c(n)=(b(n)/M);
    end 
end
plot(n,x(n));
plot(n,abs(x1(n)));
plot(n,a(n));
plot(n,b(n));
plot(n,c(n));