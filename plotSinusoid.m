% Script to plot and animate waves simulation
% Author: J.Arning, H.Heinermann, F.Primadita  
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

% increment time 
time=time+dt;


% update surface plot with current Z
if exist('hfreqNew')
% read parameters from edit window
        hfreq = [hfreq hfreqNew];
        hAmplitude = [hAmplitude hAmplitudeNew];
        hPhi=[ hPhi hPhiNew];
end

% loading frequency, amplitude and phase from edit windows
 for cc = 1:(num_source+num_sourcenew)
    freq(cc) = str2double(get(hfreq(cc), 'String'));
    a0(cc)= str2double(get(hAmplitude(cc), 'String'));
    phi0(cc)= str2double(get(hPhi(cc), 'String'));
 end

for mm = 1:(num_source+num_sourcenew);
    
     % position of sources
     position0 = startpositionAll(mm,:);
     
     % x0 and y0 of the circular wave
     idx_x = position0(1); 
     idx_y = position0(2);

     % take the value of x-th amplitude
     A = a0(mm) ; 
     
     % take the value of x-th frequency, calculate wavelength and period
     f = freq(mm) ; 
     lambda = c/f ; 
     T = 1/f ;

     % take the value of x-th phase and calculate sequence time 
     Phi0 = phi0(mm); 
     t_seq = 0:tau:T;
     len = length(t_seq);

     % pre-allocate vector for z-Values
     if mm == 1
        sumh = zeros(sizeMesh);
     end
     
     % calculate radius
     r = sqrt((X-idx_x).^2 + (Y-idx_y).^2) ;

     % calculate z-values and calculate cummulative sum
     for kk = 1:len
        z = A * sin(2*pi*(time./T -r/lambda) + Phi0);
        sumh = sumh + z ; 
     end

end

% update simulation window with new values
set(shandle, 'ZData',sumh);
drawnow;  
   