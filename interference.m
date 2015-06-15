function z = interference(y0, freq, phi0, tau, n )

%   interference(y0,f,phi0, tau, idx_x, idx_y) computes the coordinates of
%   superposed waves as three-dimensional coordinate system and plots the 
%   wave from the upper side.
%
%   Usage : z = interference(y0, freq, phi0, tau, n)
%   
%   Inputs: y0 :amplitude of all circular waves as a vector,e.g: [1 1 1] shows
%               that the amplitude of 1st,2nd and 3rd circular wave is 1.
%           freq : frequency [Hz], as a vector as well.
%           phi0 : start angular phase [rad]
%           tau : stepsize [s]
%           n : desired number of waves
%   Output: z : the third axis(z-axis)
%
%   Example : z =circular_wave([2 1], [50 100], [0.2 0.2], 0.1, 2)
%
%   Author : J.Arning, H.Heinermann, F.Primadita
%   Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP
       

    
    % determine position of the source center
    startpositionAll = ginput(n); % determine the center of all circular wave
    startpositionAll = (startpositionAll-0.5) * 40; % return to the desired dimension (-20 to 20)
   
    % constant
    c = 343 ; % air velocity in m/s
    
    % determine x- and y-axis
    [x ,y] = meshgrid(-20:tau:20) ; 
    sizeMesh = size(x) ;
    sizeMesh = sizeMesh(1);
    
    for mm = 1:n
        % determine parameters of each wave
        position0 = startpositionAll(mm,:);
        idx_x = position0(1); % x0 of the circular wave
        idx_y = position0(2); % y0 of the circular wave

        A = y0(mm) ; % take the value of x-th amplitude

        f = freq(mm) ; % take the value of x-th frequency
        lambda = c/f ; % wavelength in m
        T = 1/f ;   % period in s

        Phi0 = phi0(mm); 
        t_seq = 0:tau:T;
        len = length(t_seq);

         if mm == 1
            sumh = zeros(sizeMesh);
         end

         % radius
         r = sqrt((x-idx_x).^2 + (y-idx_y).^2) ;

         for kk = 1:len
            z = A * sin(2*pi*(t_seq(kk)./T -r/lambda) + Phi0);
            sumh = sumh + z ; 
         end
        
        surf(x,y,sumh);
        shading(gca, 'interp');
        colormap('Gray');
        view(2);
       
    end
end