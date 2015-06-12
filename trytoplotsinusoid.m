function trytoplotsinusoid
% constants
    speed of sound
    c=343;
    variable for sinusoidal function
    time = 0;
    timer period
    dt=0.001;

% initiate
    initiate meshgrid for 3d plotting
    tau = 0.25;
    [X,Y] = meshgrid(-20 : tau : 20);
    sizeMesh = size(X);
    sizeMesh = sizeMesh(1);

% initiate figure and plot axes
    hfig = figure('Position', [300 300 1200 650], 'Resize', 'off');
    movegui(hfig,'center');

    haxes = axes('Parent', hfig, 'position',[0.02  0.1  .5  .8]);
    axis equal;

    hlineaxes = axes('Parent', hfig, 'position',[0.55  0.1  .25  .4]);
    axis equal;
    hlineplot = plot(hlineaxes, 0,0.5);
    set(hlineplot, 'visible', 'off');

    hilfe=helpdlg('Im Input-Dialog musst du die Anzahl der Quellen festlegen.Dann musst du die Quellen mit der Maus in der Oberfl�che anordenen und die gew�nschten Werte f�r Frequenz, Amplitude und Phase eingeben. ');
    movegui(hilfe,'northeast');

    first window, asking how many wave sources, one wants to have.
    num_source = inputdlg('How many wave sources do you want to have?',...
                          'Input number of wave source');
    num_source = cell2mat(num_source);
    num_source = str2double(num_source);

    startpositionAll = ginput(num_source);
    startpositionAll = (startpositionAll-0.5) * 40;

    initiate surface plot
    shandle = surf(haxes, X,Y,X*0);
    source nameing
    for kk= 1:num_source
        po=startpositionAll(kk,:);
        x=po(1);
        y=po(2);
        zahl=num2str(kk);
        quelle=['Quelle ' zahl];
        ht=text(x,y,quelle);
        set(ht,'color','magenta');
    end

    interpolate surface
    shading(gca, 'interp');
    view(2)

    
    axis off;

    black and white
    colormap('Gray');

    better renderer (fasten 3d-plot)
    set(hfig, 'renderer', 'opengl')

% initiate timer for animation -------------------------------------------

    uicontrol('Style', 'pushbutton',...
              'String', 'Start',...
              'Position', [20 15 100 30],...
              'Callback', @startbutton);
    uicontrol('Style', 'pushbutton',...
              'String', 'Stop',...
              'Position', [120 15 100 30],...
              'Callback', @stopbutton);
    uicontrol('Style', 'pushbutton',...
              'String', 'Lineplot',...
              'Position', [220 15 100 30],...
              'Callback', @linebutton);       
      
    uicontrol('Style', 'pushbutton',...
              'String', 'Add Source',...
              'Position', [800 600 180 20],...
              'Callback', @addbutton);
          
    determine the first position of the GUI table
    position = [1000 600 180 20];

    hfreq = zeros(1, num_source);  
    hAmplitude = zeros(1, num_source); 
    hPhi = zeros(1, num_source);
    startpositionAll;
        function addbutton(~,~)

            num_source = num_source+1;
            
                
                zahl = num2str(num_source);
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
                
                
            startpositionNew = ginput(1);
            startpositionNew = (startpositionNew-0.5) * 40;
            startpositionAll = [startpositionAll; startpositionNew];
        end

    present the GUI table with the parameters of each waves
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
    phi = text('Interpreter', 'latex', 'String', '$$\phi$$');
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
    positionMesh = [];
    


% initiate and start timer as startbutton callback            
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


    function linebutton(~,~)
        
        axes(haxes);
        coordinates = ginput(1);
        positionMesh = interpoltest(coordinates);

        positionMeshx = positionMesh(1);
        positionMeshy = positionMesh(2);

        tlineplot = timer('Period',dt,'TimerFcn', @plotline,...
        'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
        start(tlineplot);
        
    end

% stop timer as stopbutton callback
    function stopbutton(~,~)

        stop(timerfindall);delete(timerfindall);
        
    end

    sumh = [];
% update plot in every timer iteration
    function plotSinusoid(~,~)

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
    end
        etime = 0;
        function plotline(~,~)


    

       etime = etime + dt;
        %hLinePoints = plot(gca,time, 0.5, 'x-');
       dataNew = [dataNew sumh(positionMeshx,positionMeshy)]; 
       timeNew = [timeNew etime];


       if length(timeNew) >= 50
           timeNew = timeNew(2:end);
           dataNew = dataNew(2:end);
       end

        set(hlineplot, 'visible', 'on');
       set(hlineplot,'XData',timeNew);
       set(hlineplot, 'YData',dataNew);
       drawnow; 
        end
end



