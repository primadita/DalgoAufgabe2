axes(haxes);
if running == 1
 coordinates = ginput(1);
positionMesh = interpoltest(coordinates);

positionMeshx = positionMesh(1);
positionMeshy = positionMesh(2);

tlineplot = timer('Period',dt,'TimerFcn', 'plotline',...
'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
start(tlineplot);

elseif running  == 0
    errordlg('Error. Lineplot can only be shown while simulation is running.')
end