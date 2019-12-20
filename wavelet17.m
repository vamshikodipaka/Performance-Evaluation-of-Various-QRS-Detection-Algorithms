clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');
hold on;


f2=zeros(1,21600);
Fc=10;
Fb=8;
M=500;
t = -10:1:10;
    a = sqrt(Fb).*sinc(Fb*10*t/M);
    b = sqrt(-Fb).*sinc(Fb*10*t/M);
    c=a+b;
    
    for i=0:293:21600
    f1=(12*t);
    f2=(125*c)+980;
    f1=f1+i+370;
    plot(f1,f2,'k-');grid on; 
    hold on;
    end
title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');


% 
%   for i=0:100:10000
%     plot(f2(i));
%     hold on;
%    plot(g2(i));
%    hold on;
%    end;
%  