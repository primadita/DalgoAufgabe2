
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
    hfig = figure('Position', [300 300 1200 650], 'Resize', 'off');
    movegui(hfig,'center');

    haxes = axes('Parent', hfig, 'position',[0.02  0.1  .5  .8]);
    axis equal;

    hlineaxes = axes('Parent', hfig, 'position',[0.55  0.1  .25  .4]);
    %axis equal;
    hlineplot = plot(hlineaxes, 0,0.5);
    set(hlineplot, 'visible', 'off');

    %hilfe=helpdlg('Im Input-Dialog musst du die Anzahl der Quellen festlegen.
    %Dann musst du die Quellen mit der Maus in der Oberfl�che anordenen und
    %die gew�nschten Werte f�r Frequenz, Amplitude und Phase eingeben. ');
    %movegui(hilfe,'northeast');

    % first window, asking how many wave sources, one wants to have.
    num_source = inputdlg('How many wave sources do you want to have?',...
                          'Input number of wave source');
    num_source = cell2mat(num_source);
    num_source = str2double(num_source);

    startpositionAll = ginput(num_source);
    startpositionAll = (startpositionAll-0.5) * 40;

    % initiate surface plot
    shandle = surf(haxes, X,Y,X*0);
    % source nameing
    for kk= 1:num_source
        po=startpositionAll(kk,:);
        x=po(1);
        y=po(2);
        zahl=num2str(kk);
        quelle=['Quelle ' zahl];
        ht=text(x,y,quelle);
        set(ht,'color','magenta');
    end

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
              'Callback', 'startbutton');
    uicontrol('Style', 'pushbutton',...
              'String', 'Stop',...
              'Position', [120 15 100 30],...
              'Callback', 'stopbutton');
    uicontrol('Style', 'pushbutton',...
              'String', 'Lineplot',...
              'Position', [220 15 100 30],...
              'Callback', 'linebutton');       
      
    uicontrol('Style', 'pushbutton',...
              'String', 'Add Source',...
              'Position', [800 600 180 20],...
              'Callback', 'addbutton');
          
    % determine the first position of the GUI table
    position = [1000 600 180 20];

hfreq = zeros(1, num_source);  
hAmplitude = zeros(1, num_source); 
hPhi = zeros(1, num_source);


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


    positionMeshx = [];
    positionMeshy = [];
    positionMesh =  [];
    


%%

   sumh = [];

   etime = 0;

