function trytoplotsinusoid

%% constants
% speed of sound
c=343;
% variable for sinusoidal function
time = 0;
% timer period
dt=0.001;

%% edit
frequency = 30;

%% initiate figure and plot axes
hfig = figure('Position', [300 300 900 650], 'Resize', 'off');
movegui(hfig,'center');
haxes = axes('position',[0.05  0.1  .7  .8]);

%% initiate plot features

% initiate meshgrid for 3d plotting
[X,Y] = meshgrid(-20:.25: 20);

% 
amplitude=1;
T=1/frequency;
lambda = c/frequency;
phi0 = 0;
r = sqrt(X.^2 + Y.^2);

% initiate surface plot
shandle = surf(X,Y,X*0);

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
%% initiate buttons and edit windows --------------------------------------      
uicontrol('Style', 'text', ...
           'String', 'Quelle 1',...
           'Position', [730 550 150 20],...
           'BackgroundColor', [0 0.4 0.6]);
uicontrol('Style', 'text', ...
           'String', 'Freq[Hz]',...
           'Position', [730 520 75 20],...
           'BackgroundColor', [0.6 0.8 0.8]);
uicontrol('Style', 'edit', ...
           'String', 'Frequenz',...
           'Position', [805 520 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Amplitude',...
           'Position', [730 490 75 20],...
           'BackgroundColor', [0.6 0.8 0.8]);       
uicontrol('Style', 'edit', ...
           'String', 'Amplitude',...
           'Position', [805 490 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Phase[rad]',...
           'Position', [730 460 75 20],...
           'BackgroundColor', [0.6 0.8 0.8]);
uicontrol('Style', 'edit', ...
           'String', 'Phase',...
           'Position', [805 460 75 20]);
% -------------------------------------------------------------------------       
uicontrol('Style', 'text', ...
           'String', 'Quelle 2',...
           'Position', [730 420 150 20],...
           'Callback', @stopbutton);
uicontrol('Style', 'text', ...
           'String', 'Freq[Hz]',...
           'Position', [730 390 75 20]);
uicontrol('Style', 'edit', ...
           'String', 'Frequenz',...
           'Position', [805 390 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Amplitude',...
           'Position', [730 360 75 20]);       
uicontrol('Style', 'edit', ...
           'String', 'Amplitude',...
           'Position', [805 360 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Phase[rad]',...
           'Position', [730 330 75 20]);
uicontrol('Style', 'edit', ...
           'String', 'Phase',...
           'Position', [805 330 75 20]);       
%--------------------------------------------------------------------------       
       
uicontrol('Style', 'text', ...
           'String', 'Quelle 3',...
           'Position', [730 290 150 20],...
           'Callback', @stopbutton);
uicontrol('Style', 'text', ...
           'String', 'Freq[Hz]',...
           'Position', [730 260 75 20]);
uicontrol('Style', 'edit', ...
           'String', 'Frequenz',...
           'Position', [805 260 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Amplitude',...
           'Position', [730 230 75 20]);       
uicontrol('Style', 'edit', ...
           'String', 'Amplitude',...
           'Position', [805 230 75 20]);
uicontrol('Style', 'text', ...
           'String', 'Phase[rad]',...
           'Position', [730 200 75 20]);
uicontrol('Style', 'edit', ...
           'String', 'Phase',...
           'Position', [805 200 75 20]);       
    
       

%% initiate and start timer as startbutton callback            
    function startbutton(handle, event)
        t = timer('Period',dt,'TimerFcn', @plotSinusoid,...
        'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
        start(t);
    end

%% stop timer as stopbutton callback
    function stopbutton(handle, event)

        stop(timerfindall);delete(timerfindall);
    end


%% update plot in every timer iteration
function plotSinusoid( handle, event )
%UNTITLED Summary of this function goes here
  %Detailed explanation goes here
  
    % increment time 
    time=time+dt;
    
    % update sinusoidal function
    Z = amplitude*sin(2*pi*(time./T-r/lambda)+phi0);
    
    % update surface plot with current Z
    set(shandle, 'ZData',Z);
    drawnow;
    
end

end


