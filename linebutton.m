% Script
% Author: J.Arning, H.Heinermann, F.Primadita (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

if exist('hp')
    stop(tlineplot);

    delete(tlineplot);
    clear('tlineplot');
    clear('hlineaxes');


    set(hp, 'visible', 'off');
    clear('hp')
end
axes(haxes);
if running == 1
    coordinates = ginput(1);

    posLinePlot=coordinates;
    x=posLinePlot(1);
    y=posLinePlot(2);
   
    hp=text(x,y,'o  Lineplot');
    set(hp,'color','yellow');


positionMesh = interpoltest(coordinates);

positionMeshx = positionMesh(1);
positionMeshy = positionMesh(2);

tlineplot = timer('Period',dt,'TimerFcn', 'plotline',...
'ExecutionMode','fixedRate', 'TasksToExecute',Inf);

start(tlineplot);

elseif running  == 0
    errorlining = ['Error. Lineplot can only be shown while simulation is running.'];
    set(hwarntext, 'String',errorlining);
    set(hwarntext, 'BackgroundColor','yellow', 'FontSize',11)
end