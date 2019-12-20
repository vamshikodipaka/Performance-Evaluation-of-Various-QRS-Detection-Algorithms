clc; close all; clear all;

load('rec_1m.mat');
ecg=val(1,:);
ecg1=(ecg)/1244;
figure(1); plot(ecg1);
x = decimate(ecg1,12);
figure(2); plot(x);hold on;

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
      prevh = h; % copy of the previous value of h before modifying it
      h = h - m; % substract mean to h
      plot(h,'g');
      figure(3);
      subplot(9,1,1); plot(prevh);
      subplot(9,1,2); plot(h);
   
      
      % calculate standard deviation
      eps = 0.0000001; % to avoid zero values
      SD = sum ( ((prevh - h).^2) ./ (prevh.^2 + eps) );
      
%    end
   
   imf = [imf; h]; % store the extracted IMF in the matrix imf
   % if size(maxmin,2)<2, then h is the residue
   
   % stop criterion of the algo.
   if size(maxmin,2) < 2
      break
   end
   
   h1 = h - m; % substract mean to h
       subplot(9,1,3);    plot(h1); 
      
      prevh=h;
   h2 = h1 - m; % substract mean to h
      subplot(9,1,4);     plot(h2);      
         
         prevh1=h;
   h3 = h2 - m; % substract mean to h
      subplot(9,1,5);     plot(h3);   
      
         prevh=h;
   h4 = h3 - m; % substract mean to h
      subplot(9,1,6);     plot(h4);    
      
      prevh=h;
   h5 = h4 - m; % substract mean to h
        subplot(9,1,7);      plot(h5);   
        
         prevh=h;
      h6 = h5 - m; % substract mean to h
     subplot(9,1,8);         plot(h6); 
      
%          prevh=h;
%       h = h - m; % substract mean to h
%        subplot(9,1,9);        plot(h);      
      
       h7 = h6 - m; h8 = h7 - m; h9 = h8 - m; h10 = h9 - m; h11 = h10 - m; 
       h12 = h11 - m;
%        h = h - m;h = h - m;h = h - m;h = h - m;h = h - m;
       subplot(9,1,9);        plot(h12); 
       
       u= h+h1+h2-h5-h6;        figure(4); plot(u); grid on;

figure
v=hilbert(u);
hr=real(v);
subplot(3,1,1); stem(hr); grid on; hold on;
 title('hilbert transform real part = moving avg.');
 xlabel('time(msec)'); ylabel('amplitude(mV)');
 
 hr2=imag(v)
 subplot(3,1,2); stem(hr2); grid on; hold on;
 title('hilbert transform imaginary part = moving avg.');
 xlabel('time(msec)'); ylabel('phase');

subplot(3,1,3); stem(u); grid on; hold on;
 title('emd analyzed sig.');
 xlabel('time(msec)'); ylabel('phase');
%