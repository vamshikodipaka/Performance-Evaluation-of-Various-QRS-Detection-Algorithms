clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');
hold on;
% N=8; M=8;
% k=input('enter the total no.of samples ');
% % n=0:1:k; 
% figure
% n=1:1:2*k;
%     for i=0:1:7
%          x=ecg(n);         y=ecg(n+i+1);         z=ecg(n+i); 
%           y1=y-z;          x2=y1.*y1;          x3=abs(x2);
%           a(n)=x3*(N+i+1);
%     end
% %      disp(a); 
% plot(y1);  grid on; 
% title('derivated'); xlabel('time(msec)'); ylabel('amplitude(mV)');
% figure; plot(a);  grid on;
% title('derivated, squared & integrated'); 
% xlabel('time(msec)'); ylabel('amplitude(mV)');
% %      hold on;
%     figure
%  n=1:1:k;
% % j=1:7 %           plot(n,((a(n-j)/M)));
% s1=a(n); s2=a(n+1); s3=a(n+2); s4=a(n+3); s5=a(n+4); s6=a(n+5);
% s7=a(n+6); s8=a(n+7); s9=a(n+8); s10=a(n+9); s11=a(n+10); 
% s12=a(n+11); s13=a(n+12); s14=a(n+13); s15=a(n+14); s16=a(n+15);
% s=(s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16)/16;
% disp(s); plot(n,s); grid on; hold on;
% title('moving averager'); xlabel('time(msec)'); ylabel('amplitude(mV)');
%  

Fc=10;
Fb=8;
M=500;

t = linspace(-10,10);
    y1 = sqrt(Fb).*sinc(Fb*10*t/M);
    y2 = sqrt(-Fb).*sinc(Fb*10*t/M);
    y=((y1+y2)*60)/100;
    plot((10*t)+1515,(150*y)+950,'r-');grid on;
title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');