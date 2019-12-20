clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');
hold on;

Fc=10;
Fb=8;
M=500;
t = linspace(-15,15);
    a = sqrt(Fb).*sinc(Fb*10*t/M);
    b = sqrt(-Fb).*sinc(Fb*10*t/M);
    c=a+b;
    plot((2*t)+1515,(105*c)+950,'r-');grid on;
title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');

Fc=10;
Fb=8;
M=500;

t = linspace(-15,15);
    a1 = sqrt(Fb).*sinc(Fb*10*t/M);
    b1 = sqrt(-Fb).*sinc(Fb*10*t/M);
    c1=a1+b1;
    plot((0.5*t)+1515,(65*c1)+925,'k-');grid on;
title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');


for t=0:1000:21600
    i=1000;
    t=t+i;
    plot('t,c1');
end
figure2;

% n=2:1:21600;
% ecg(206001)=0;
% ecg(1)=0;
% j=ecg(n);         k=ecg(n+1);         l=ecg(n-1); 
% if ecg==1000
%     if j<k
%     diff=ecg-c;
%     diff>0;
%     diff=c1-ecg;
%     diff>0;
%     f1=n;
%          if j>k
%          diff=ecg-c;
%          diff<0;
%          diff=c1-ecg;
%          diff<0;
%         f2=n;
%         f=(f1+f2)/2;
%         f=1000;
%         plot(f);
%          end
%     end
% end
    
    
    
    
