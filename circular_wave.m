function z = circular_wave(y0, f, phi0, tau, idx_x, idx_y)
%   circular_wave(y0,f,phi0, tau, idx_x, idx_y) computes the coordinates of
%   a wave as three-dimensional coordinate system and plots the wave from 
%   the upper side.
%
%   Usage : z = circular_wave(y0, f, phi0, tau, idx_x, idx_y)
%   
%   Inputs: y0 :amplitude
%           phi0 : start angular phase [rad]
%           f : frequency [Hz]
%           tau : stepsize [s]
%           idx_x : desired center point of the wave (x-axis), number
%           between -20 and 20
%           idx_y : desired center point of the wave (y-axis)
%   Output: z : the third axis(z-axis)
%
%   Example : circular_wave(2, 30, 0.2, 0.1, 0, 10)
%
%   Author : J.Arning, H.Heinermann, F.Primadita
%   Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP
    
    % constants
    c = 343 ; % air velocity in m/s
    lambda = c/f ; % wavelength in m
    T = 1/f ;   % period in s
    
    % define the size of the coordinates
    [x ,y] = meshgrid(-20:tau:20) ; 
    
    % radius
    r = sqrt((x-idx_x).^2 + (y-idx_y).^2) ;
    
    % time sequence in s
    t_seq = 0:tau:T;
    n = length(t_seq);
   
    % z-axis
    for kk = 1:n
        
        z = y0 * sin(2*pi*(t_seq(kk)./T -r/lambda) + phi0);
        
        surf(x,y,z);
        shading(gca, 'interp');
        colormap('Gray');
        view(2);
       
    end     
end