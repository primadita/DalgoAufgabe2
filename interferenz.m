function z = interferenz(y0, freq, phi0, tau, n )
   
%   Example : kreiswelle(2,30,0.2, 0.1)
    % y0 :amplitude of all circular waves as a vector,e.g: [1 1 1] shows
    % that the amplitude of 1st,2nd and 3rd circular wave is 1.
    % f : frequency, as a vector as well
    % phi0 : start angular phase, also as a vector, ,e.g: [1 1 1] shows
    % that the angular phase of circular wave 1,2,3 is 1.
    % tau : step size
    % n : number of wave
    % idx_x : first position on x-axis
    % idx_y : first position on y-axis -- both later can be input by using
    % ginput
    
    
    startpositionAll = ginput(n); % determine the center of all circular wave
    startpositionAll = (startpositionAll-0.5) * 40; % return to the desired dimension (-20 to 20)
   
    
    c = 343 ; % air velocity in m/s
    
    
    %r = phi0*lambda/(-2*pi) ; 
    
    [x ,y] = meshgrid(-20:tau:20) ; 
    sizeMesh = size(x) ;
    sizeMesh = sizeMesh(1) ;
   
    % maxexp_x = max(y0(1), fenstersize - y0(1)) ; %maximal expansion in x axis
    % maxexp_y = max(y0(2), fenstersize - y0(2)) ; %maximal expansion in y axis
    
    
    
    % compare both maximal expansion to get the real maximal expansion
    
    
    for mm = 1:n
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
         
         r = sqrt((x-idx_x).^2 + (y-idx_y).^2) ;
         
         for kk = 1:len
            z = A * sin(2*pi*(t_seq(kk)./T -r/lambda) + Phi0);
            sumh = sumh + z ; 
         end
            surf(x,y,sumh);
            shading(gca, 'interp');
            colormap('Gray');
            view(2);
        % For constructive interference we need an even number of half wavelengths. 
        % This means that two peaks or troughs will coincide. For destructive interference 
        % we need odd numbers of half wavelengths. So a peak will coincide with a trough.
        
    end
end