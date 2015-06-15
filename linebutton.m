% linebutton is a part of wave simulation script,which set position for
% line plot.
%
% Author: J.Arning, H.Heinermann, F.Primadita 
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

%%
% check if handle of position marker exist. If yes, stop timer for
% lineplot, clear plot, axes and position marker.
if exist('hp')
    stop(tlineplot);
    delete(tlineplot);
    clear('tlineplot');
    clear('hlineaxes');
    set(hp, 'visible', 'off');
    clear('hp')
end
%% 
% make axes of simulation window current axes
axes(haxes);
%%
% check if simulation is running. 

%If yes, get position for line plot from
% ginput, mark position in simulation window, start timer, that calls 
% 'plotline.m' to plot line plot
if running == 1
    % get position
    coordinates = ginput(1);
    posLinePlot=coordinates;
    x=posLinePlot(1);
    y=posLinePlot(2);
   
    % set merkerin simulation window
    hp=text(x,y,'o  Lineplot');
    set(hp,'color','yellow');

    % get position of click in the simulation meshgrid 
    positionMesh = interpoltest(coordinates);
    positionMeshx = positionMesh(1);
    positionMeshy = positionMesh(2);
    
    % initiate and start timer 
    tlineplot = timer('Period',dt,'TimerFcn', 'plotline',...
    'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
    start(tlineplot);
    
% If simulation isn't running, give back error message. 
elseif running  == 0
    errorlining = ['Error. Lineplot can only be shown while simulation is running.'];
    set(hwarntext, 'String',errorlining);
    set(hwarntext, 'BackgroundColor','yellow', 'FontSize',11)
end