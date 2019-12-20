clc; clear all; close all;
load('100m.mat');
N=8; M=8;
k=input('enter the total no.of samples');
% figure;
n=1:1:k;        
x(n)=val(1,k);
         x=x(n);
%          figure 1;
         plot(x(n));
         y2=x(n);  
         y3=x(n+1);     
         y4=x(n+2);   y5=x(n+3);     y6=x(n+4);  
         y7=x(n+5);     y8=x(n+6);   y1=x(n+7);  
         z=x(n-i); 
          y1=y-z;
          x1=y1*y1;
          x2=abs(x1);
          a(n)=x2*(N-i+1);
    %      disp(a); 
     plot(a);
%      hold on;

    figure
 n=1:1:k;
% j=1:7
%           plot(n,((a(n-j)/M)));
s1=a(n); s2=a(n+1); s3=a(n+2); s4=a(n+3); s5=a(n+4);
s6=a(n+5); s7=a(n+6); s8=a(n+7);
s=(s1+s2+s3+s4+s5+s6+s7+s8)/M;
disp(s)
       plot(n,s);hold on;
% plot(n,x); % plot(n,abs(x1)); % plot(n,a);% plot(n,b(n)); % plot(n,c(n));