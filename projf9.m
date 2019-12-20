clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg);
N=8; M=8;
k=input('enter the total no.of samples ');
% n=0:1:k;
ecg1=ecg(1:2*k);
figure(2);
plot(ecg1);
n=1:1:2*k
    for i=0:1:7
         x=ecg(n);
         y=ecg(n+i+1);
         z=ecg(n+i); 
          y1=y-z;
          x2=y1.*y1;
          x3=abs(x2);
          a(n)=x3*(N+i+1);
    end
%      disp(a);
figure(3);
     plot(a);     
%      hold on;
    figure(4);
 n=1:1:k;
% j=1:7 %           plot(n,((a(n-j)/M)));
s1=a(n); s2=a(n+1); s3=a(n+2); s4=a(n+3); 
s5=a(n+4); s6=a(n+5); s7=a(n+6);s8=a(n+7);
s=(s1+s2+s3+s4+s5+s6+s7+s8)/M; disp(s)
figure(5);
       plot(n,s);hold on;
% plot(n,x); % plot(n,abs(x1)); % plot(n,a);% plot(n,b(n)); % plot(n,c(n));
