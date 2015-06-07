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

% first window, asking how many wave sources, one wants to have.
num_source = inputdlg('How many wave sources do you want to have?','Input number of wave source');
num_source = cell2mat(num_source);
num_source = str2double(num_source);

startpositionAll = ginput(num_source);
startpositionAll = (startpositionAll-0.5) * 40;

% initiate surface plot
shandle = surf(haxes, X,Y,X*0);

% interpolate surface
shading(gca, 'interp');
view(2)

% 
%axis off;

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
       
% determine the first position of the GUI table
position = [700 600 180 20];

hfreq = zeros(1, num_source);  
hAmplitude = zeros(1, num_source); 
hPhi = zeros(1, num_source);

% present the GUI table with the parameters of each waves
for ll = 1 : num_source
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

hfreq(ll) = uicontrol( 'Style', 'edit', ...
           'String', '150',...
           'Position', position + [15 -30 -135 0]);    
hAmplitude(ll) = uicontrol( 'Style', 'edit', ...
           'String', '1',...
           'Position', position + [75 -30  -135 0]);  
%phi = text('Interpreter', 'latex', 'String', '$$\phi$$');
hPhi(ll) = uicontrol( 'Style', 'edit', ...
           'String','0',...
           'Position', position + [135 -30 -135 0]);
position = position - [0 60 0 0];  
end      

freq = zeros(1, num_source);
a0 = zeros(1, num_source);
phi0 = zeros(1, num_source);
timeNew = [];
dataNew = [];

hLinePlot = figure('Visible', 'off');
hLinePoints = plot(gca, 10, 10);

positionMeshx = [];
positionMeshy = [];

%% initiate and start timer as startbutton callback            
    function startbutton(~,~)
        for cc = 1: num_source
        freq(cc) = str2double(get(hfreq(cc), 'String'));
        a0(cc)= str2double(get(hAmplitude(cc), 'String'));
        phi0(cc)= str2double(get(hPhi(cc), 'String'));
        end
        
        
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

    %hLinePoints = plot(gca,time, 0.5, 'x-');
     
   timeNew = [timeNew time];
   dataNew = [dataNew sumh(80,120)]
   
   if length(timeNew) >= 50
       timeNew = timeNew(2:end);
       dataNew = dataNew(2:end);
   end
   
   
   set(hLinePoints,'XData',timeNew);
   set(hLinePoints, 'YData',dataNew);
   drawnow;
   
end
 


end



