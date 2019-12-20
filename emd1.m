clc; clear all; close all;
load('100m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');