clc; clear all; close all;
load('rec_1m.mat');
x=val(1,:);
ecg=x';
figure(1);
plot(ecg); grid on;
title('ecg wave'); xlabel('time (msec)'); ylabel('amplitude(mV)');
N=8; M=8;
k=input('enter the total no.of samples ');
% n=0:1:k; 
figure
%ecg duration is 10000msec signal= 2hr 40mins signal 
n=1:1:2*k;
    for i=0:1:7
         x=ecg(n);         y=ecg(n+i+1);         z=ecg(n+i); 
          y1=y-z;          x2=y1.*y1;          x3=abs(x2);
          a(n)=x3*(N+i+1);
    end
%      disp(a); 
plot(y1);  grid on; 
title('derivated'); xlabel('time(msec)'); ylabel('amplitude(mV)');
figure; plot(a);  grid on;
title('derivated, squared & integrated'); 
xlabel('time(msec)'); ylabel('amplitude(mV)');
%      hold on;
    figure
 n=1:1:k;
% j=1:7 %           plot(n,((a(n-j)/M)));
s1=a(n); s2=a(n+1); s3=a(n+2); s4=a(n+3); s5=a(n+4); s6=a(n+5);
s7=a(n+6); s8=a(n+7); s9=a(n+8); s10=a(n+9); s11=a(n+10); 
s12=a(n+11); s13=a(n+12); s14=a(n+13); s15=a(n+14); s16=a(n+15);
s=(s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16)/16;
disp(s); plot(n,s); grid on; hold on;
title('moving averager'); xlabel('time(msec)'); ylabel('amplitude(mV)');
 
figure
v=hilbert(s);
hr=real(v);
subplot(2,1,1); stem(n,hr); grid on; hold on;
 title('hilbert transform real part = moving avg.');
 xlabel('time(msec)'); ylabel('amplitude(mV)');
 
 hr2=imag(v)
 subplot(2,1,2); stem(n,hr2); grid on; hold on;
 title('hilbert transform imaginary part = moving avg.');
 xlabel('time(msec)'); ylabel('phase');

 
 
 z1=zeros(1,k);
  count2=0;
  for i=1:1:k
    if hr(i)>2000 
       z1(i)=1;
        count2=count2+1;
    end;
  end;
  disp(count2);
figure;

 subplot(3,1,1); stem(z1); grid on; hold on;
 title('above threshold limit-values'); 
 xlabel('time(msec)'); ylabel('amplitude(mV)');
% 


 z2=zeros(1,k); 
   count=0;
for i=1:1:k
    
    if hr(i)>2000;
    if hr2(i)<500;
        if hr2(i)>-500;
       z2(i)=1;
          count=count+1;
        end;
    end;
    end;
end;
disp(count);
 subplot(3,1,2); stem(z2); grid on; hold on;
 title('above threshold values & peaks detected through hilbert phase'); 
 xlabel('time(msec)'); ylabel('amplitude(mV)');
%


z3=zeros(1,k); 
   count1=0;
   hr(k+1)=0;
for i=1:1:k
    
    if hr(i)>2000;
    if hr(i)>hr(i-1);
        if hr(i)>hr(i+1);
       z3(i)=1;
          count1=count1+1;
        end;
    end;
    end;
end;
disp(count1);
 subplot(3,1,3); stem(z3); grid on; hold on;
 title('total no. of peaks we obtain in ecg'); 
 xlabel('time(msec)'); ylabel('amplitude(mV)');
%

w=(((count)/(count1))*100);
disp(w);