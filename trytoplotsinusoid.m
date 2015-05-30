function trytoplotsinusoid
%% constants
% speed of sound
c=343;
% variable for sinusoidal function
time = 0;
% timer period
dt=0.001;

%% initiate
% initiate meshgrid for 3d plotting
tau = 0.25;
[X,Y] = meshgrid(-20 : tau : 20);
sizeMesh = size(X);
sizeMesh = sizeMesh(1);

%% initiate figure and plot axes
hfig = figure('Position', [300 300 900 650], 'Resize', 'off');
movegui(hfig,'center');

haxes = axes('Parent', hfig, 'position',[0.05  0.1  .7  .8]);
axis equal;




y0 = [1 2];
freq = [200 500];
phi0 = [0 0];
n = 2;

startpositionAll = ginput(n);
startpositionAll = (startpositionAll-0.5) * 40;

% initiate surface plot
shandle = surf(haxes, X,Y,X*0);

% interpolate surface
shading(gca, 'interp');
view(2)

% 
axis off;

% black and white
colormap('Gray');

% better renderer (fasten 3d-plot)
set(hfig, 'renderer', 'opengl')

%% initiate timer for animation -------------------------------------------

uicontrol('Style', 'pushbutton',...
           'String', 'Start',...
           'Position', [20 15 100 30],...
           'Callback', @startbutton);
uicontrol('Style', 'pushbutton',...
           'String', 'Stop',...
           'Position', [120 15 100 30],...
           'Callback', @stopbutton);
       
       
       


% %% initiate buttons and edit windows --------------------------------------
position = [700 600 180 20];


for ll = 1 : 10
zahl = num2str(ll);
uicontrol( 'Style', 'text', ...
           'String', ['Quelle ' zahl ],...
           'Position', position,...
           'BackgroundColor', [0 0.4 0.6]);

uicontrol( 'Style', 'text', ...
           'String', 'f',...
           'Position', position + [0 -30 -165 0]);
uicontrol( 'Style', 'text', ...
           'String', 'A',...
           'Position',position + [60 -30 -165 0]);
uicontrol( 'Style', 'text', ...
           'String','P',...
           'Position', position + [120 -30 -165 0]);

uicontrol( 'Style', 'edit', ...
           'String', 'f',...
           'Position', position + [15 -30 -135 0]);    
uicontrol( 'Style', 'edit', ...
           'String', 'A',...
           'Position', position + [75 -30  -135 0]);  
%phi = text('Interpreter', 'latex', 'String', '$$\phi$$');
uicontrol( 'Style', 'edit', ...
           'String','Phi',...
           'Position', position + [135 -30 -135 0]);
position = position - [0 60 0 0];  
end      



        
%% initiate and start timer as startbutton callback            
    function startbutton(~,~)
        t = timer('Period',dt,'TimerFcn', @plotSinusoid,...
        'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
        start(t);
    end

%% stop timer as stopbutton callback
    function stopbutton(~,~)

        stop(timerfindall);delete(timerfindall);
    end


%% update plot in every timer iteration
function plotSinusoid(~,~)
%UNTITLED Summary of this function goes here
  %Detailed explanation goes here
  
    % increment time 
    time=time+dt;
    
    % update sinusoidal function
    %Z = amplitude*sin(2*pi*(time./T-r/lambda)+phi0);

    % update surface plot with current Z

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
         
         r = sqrt((X-idx_x).^2 + (Y-idx_y).^2) ;
         
         for kk = 1:len
            z = A * sin(2*pi*(time./T -r/lambda) + Phi0);
            sumh = sumh + z ; 
         end
    
        end
    set(shandle, 'ZData',sumh);
    drawnow;  
end

end


