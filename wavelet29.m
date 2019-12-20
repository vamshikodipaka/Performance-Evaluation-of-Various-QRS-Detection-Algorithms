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
    f2=(150*c)+940;
    f1=f1+i+370;
   
    plot(f1,f2,'k-');grid on; 
    hold on;
    end
title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');


g2=zeros(1,21600);
Fc=10;
Fb=8;
M=500;

t = -10:1:10;
    a1 = sqrt(Fb).*sinc(Fb*10*t/M);
    b1 = sqrt(-Fb).*sinc(Fb*10*t/M);
    c1=a1+b1;
    
    for i=0:293:21600
    g1=(0.4*t);
    g2=(50*c1)+950;
    g1=g1+i+370;
    plot(g1,g2,'r-');grid on;
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