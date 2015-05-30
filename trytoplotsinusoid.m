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

y0 = [1 1 1 1 1];
freq = [100 100 100 100 100];
phi0 = [0 0 0 0 0];
n = 5;



startpositionAll = ginput(n);
startpositionAll = (startpositionAll-0.5) * 40;

xPosition = startpositionAll(:,1);
yPosition = startpositionAll(:,2);

%amplitude = 1;
%T = 1/frequency;
lambda = c/frequency;

%r = sqrt((X-xPosition).^2 + (Y-yPosition).^2);


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


