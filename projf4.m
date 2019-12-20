clc; clear all; close all;
N=8; M=8;
k=input('enter the total no.of samples');
n=0:1:k; 
x=cos(.2*pi*n);
for n=0:1:k
    for i=0:1:7
        for j=0:1:7
          y(n)=x(n-i+1);
          z(n)=x(n-i);
          y1(n)=y(n)-z(n);
          x1(n)=y1(n)*y1(n);
          x2(n)=abs(x1(n));
          a(n)=x(n)*(N-i+1);
             b(n)=a(n-j);
             c(n)=(b(n)/M);
          end       
     end 
end
plot(n,x(n));
plot(n,abs(x1(n)));
plot(n,a(n));
plot(n,b(n));
plot(n,c(n));