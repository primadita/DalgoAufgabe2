% Script
% Author: J.Arning, H.Heinermann, F.Primadita (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

% increment time 
        time=time+dt;

        % update sinusoidal function
        %Z = amplitude*sin(2*pi*(time./T-r/lambda)+phi0);

        % update surface plot with current Z

            for mm = 1:num_source
             position0 = startpositionAll(mm,:);
             idx_x = position0(1); % x0 of the circular wave
             idx_y = position0(2); % y0 of the circular wave

             A = a0(mm) ; % take the value of x-th amplitude

             f = freq(mm) ; % take the value of x-th frequency
             lambda = c/f ; % wavelength in m
             T = 1/f ;   % period in s

             Phi0 = phi0(mm); 
             t_seq = 0:tau:T;
             len = length(t_seq);

             if mm == 1
                sumh = zeros(sizeMesh);
             end

             r = sqrt((X-idx_x).^2 + (Y-idx_y).^2) ;

             for kk = 1:len
                z = A * sin(2*pi*(time./T -r/lambda) + Phi0);
                sumh = sumh + z ; 
             end

            end
        set(shandle, 'ZData',sumh);
        drawnow;  
   