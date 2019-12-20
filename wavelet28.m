clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');
hold on;


% f2=zeros(1,21600);
% Fc=10;
% Fb=8;
% M=500;
% t = -15:1:15;
%     a = sqrt(Fb).*sinc(Fb*10*t/M);
%     b = sqrt(-Fb).*sinc(Fb*10*t/M);
%     c=a+b;
%     f1=(2*t)+1515;
%     f2=(105*c)+950;
%     plot(f1,f2,'r-');grid on;
% title('template ecg'); xlabel('time (msec)'); ylabel('amplitude(mV)');
% hold on;
g2=zeros(1,21600);
Fc=10;
Fb=8;
M=500;
t=-15;
%    for i=0:173:21600

i=0;
t=0;
for k=0:100:21600
t = -15+t:1:15+t;
    a1 = sqrt(Fb).*sinc(Fb*10*t/M);
    b1 = sqrt(-Fb).*sinc(-Fb*10*t/M);
    c1=a1+b1;
%     g1=1:2000
    g1=(t)+151;
    g2=(160*c1)+925; 
      plot(g1,g2,'g-');grid on;
    hold on;
    i=i+50;
    t=t+i;
% disp(g1);
% disp(abs(g2))
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