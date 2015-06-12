axes(haxes);
coordinates = ginput(1);
positionMesh = interpoltest(coordinates);

positionMeshx = positionMesh(1);
positionMeshy = positionMesh(2);

tlineplot = timer('Period',dt,'TimerFcn', 'plotline',...
'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
start(tlineplot);