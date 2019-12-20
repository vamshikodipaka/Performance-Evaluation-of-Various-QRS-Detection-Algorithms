clc; close all; clear all;

load('100m.mat');
ecg=val(1,:);
ecg1=(ecg)/1244;
figure(1);
plot(ecg1);
x = decimate(ecg1,12);
figure(2);
plot(x);grid on; hold on;

c = x(:)'; % copy of the input signal (as a row vector)
N = length(x);

%-------------------------------------------------------------------------
% loop to decompose the input signal into successive IMF

imf = []; % Matrix which will contain the successive IMF, and the residue

% while (1) % the stop criterion is tested at the end of the loop
   
   %-------------------------------------------------------------------------
   % inner loop to find each imf
   
   h = c; % at the beginning of the sifting process, h is the signal
   SD = 1; % Standard deviation which will be used to stop the sifting process
   
%    while SD > 0.3
      % while the standard deviation is higher than 0.3 (typical value)
      
      % find local max/min points
      N = length(h);
      d = diff(h); % approximate derivative
      maxmin = []; % to store the optima (min and max without distinction so far)
      for i=1:N-2
         if d(i)==0                        % we are on a zero
            maxmin = [maxmin, i];
         elseif sign(d(i))~=sign(d(i+1))   % we are straddling a zero so
            maxmin = [maxmin, i+1];        % define zero as at i+1 (not i)
         end
      end
     grid on; 
      if size(maxmin,2) < 2 % then it is the residue
         break
      end
      
      % divide maxmin into maxes and mins
      if maxmin(1)<maxmin(2)              % first one is a max not a min
         maxes = maxmin(1:2:length(maxmin));
         mins  = maxmin(2:2:length(maxmin));
      else                                % is the other way around
         maxes = maxmin(2:2:length(maxmin));
         mins  = maxmin(1:2:length(maxmin));
      end
      
%       % make endpoints both maxes and mins
      maxes = [1 maxes N];
      mins  = [1 mins  N];
%       
%       
%       %-------------------------------------------------------------------------
%       % spline interpolate to get max and min envelopes; form imf
      maxenv = spline(maxes,h(maxes),1:N);
      minenv = spline(mins, h(mins),1:N);
      
      plot(minenv,'b+-');
      hold on;
      plot(maxenv,'k*--');
      hold on;
      
      m = (maxenv + minenv)/2; % mean of max and min enveloppes
      plot(m, 'r.-');
      hold on;
title('templates:  blue+1=max;  black*=min;  red.=avg;  blue=ecg');
xlabel('time(msec)'); ylabel('amplitude(mV)');

