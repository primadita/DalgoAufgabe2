% Script
% Author: J.Arning, H.Heinermann, F.Primadita (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

% variable to differ between running or stopped simulation
running=0;

% stopping and deleting all timers (simulation and lineplot)
if exist('t')
    stop(t);
end
if exist('tlineplot')
    stop(tlineplot);
    delete(tlineplot);
    clear('tlineplot');
    clear('hlineaxes');
    set(hp, 'visible', 'off');
    clear('hp');
end