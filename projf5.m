clc; clear all; close all;
N=8; M=8;
k=input('enter the total no.of samples');
n=0:1:k; 

for n=0:1:k
    for i=0:1:7
         x=cos(.2*pi*n);
         y=cos(.2*pi*(n-i+1));
         z=cos(.2*pi*(n-i)); 
          y1=y-z;
          x1=y1*y1;
          x2=abs(x1);
          a=x2*(N-i+1);
        end
    end
 for n=0:1:k
    for j=0:1:7
        plot(n,a(n-j));
          plot(n,((a(n-j)/M)));
      end 
end
plot(n,x);
plot(n,abs(x1));
plot(n,a);
plot(n,b(n));
plot(n,c(n));