clc; clear all; close all;

% load('100m.mat');
% x=val(1,:);
% ecg=x';
% figure(1);
% plot(ecg);

N=8; M=8;
k=input('enter the total no.of samples');
% n=0:1:k; 
figure
for n=1:1:2*k
    for i=0:1:7
         x=cos(.2*pi*n);
         y=cos(.2*pi*(n-i+1));
         z=cos(.2*pi*(n-i)); 
          y1=y-z;
          x1=y1*y1;
          x2=abs(x1);
          a(n)=x2*(N-i+1);
    end
%      disp(a); 

     plot(a);
%      hold on;
end
    figure
 n=1:1:k;
%     for j=1:7
        
%           plot(n,((a(n-j)/M)));
     
    disp((a(n+4)))
       plot(n,a(n+4));hold on;
%     end
% end
% plot(n,x);
% plot(n,abs(x1));
% plot(n,a);
% plot(n,b(n));
% plot(n,c(n));