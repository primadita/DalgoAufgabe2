function z = interferenz(y0,f,phi0, tau, n )
   
%   Example : kreiswelle(2,30,0.2, 0.1)
    % y0 :amplitude
    % phi0 : start angular phase
    % tau : step size
    % n : number of wave
    % idx_x : first position on x-axis
    % idx_y : first position on y-axis -- both later can be input by using
    % ginput
    
    
    anfangsposition = ginput(n);
    
    c = 343 ; % air velocity in m/s
    lambda = c/f ; % wavelength in m
    T = 1/f ;   % period in s
    
    %r = phi0*lambda/(-2*pi) ; 
    
    [x ,y] = meshgrid(-20:tau:20) ; 
   
    % maxexp_x = max(y0(1), fenstersize - y0(1)) ; %maximal expansion in x axis
    % maxexp_y = max(y0(2), fenstersize - y0(2)) ; %maximal expansion in y axis
    t_seq = 0:tau:T;
    len = length(t_seq);
    % compare both maximal expansion to get the real maximal expansion
    
    
    for mm = 1:n
         if mm == 1
             sumh = zeros(sizeZ(1),sizeZ(2));
         end
         r = sqrt((x-anfangsposition(mm,1)).^2 + (y-anfangsposition(mm,2)).^2) ;
         for kk = 1:len
            z = y0(mm) * sin(2*pi*(t_seq(kk)./T -r/lambda));
            sumh = sumh + z ; 
         end
            surf(x,y,sumh);
            shading(gca, 'interp');
            colormap('Gray');
            view(2);
        
        
    end
end