function z = kreiswelle(y0,f,phi0, tau, idx_x, idx_y)
%   Example : kreiswelle(2, 30, 0.2, 0.1, 0, 10)
    % y0 :amplitude
    % phi0 : start angular phase
    % tau : step size
    % idx_x : first position on x-axis
    % idx_y : first position on y-axis -- both later can be input by using
    % ginput
    
    %idx_x = ginput(1);
    %idx_y = ginput(2);
    
    c = 343 ; % air velocity in m/s
    lambda = c/f ; % wavelength in m
    T = 1/f ;   % period in s
    
    
    [x ,y] = meshgrid(-20:tau:20) ; 
    
    r = sqrt((x-idx_x).^2 + (y-idx_y).^2) ;
    % maxexp_x = max(y0(1), fenstersize - y0(1)) ; %maximal expansion in x axis
    % maxexp_y = max(y0(2), fenstersize - y0(2)) ; %maximal expansion in y axis
    t_seq = 0:tau:T;
    n = length(t_seq);
    % compare both maximal expansion to get the real maximal expansion
    for kk = 1:n
        
        z = y0 * sin(2*pi*(t_seq(kk)./T -r/lambda) + phi0);
        
        surf(x,y,z);
        shading(gca, 'interp');
        colormap('Gray');
        view(2);
       
    end
    
    
 
    
%     for kk = 1: length(t_seq)
%     y1 = y0 * sin (2*pi*(t/T -r/lambda));
%     %y_2(r,t)=y0 * sin (2\pi*(t/T-r/\lambda+s/\lambda))
%     
    
end