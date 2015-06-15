% Script to stop simulation and line plot. 
% Author: J.Arning, H.Heinermann, F.Primadita
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 



% variable to differ between running or stopped simulation
running=0;

% stopping and deleting timers (t --> simulation and tlineplot -->lineplot)
% if they already exist, and in case of the line plot clear plot, axes and 
% position marker in simulation window

if exist('t')==1
    stop(t);
    delete(t);
    clear('t');
end

if exist('tlineplot')==1
    stop(tlineplot);
    delete(tlineplot);
    clear('tlineplot');
    clear('hlineaxes');
    set(hp, 'visible', 'off');
    clear('hp');
end
