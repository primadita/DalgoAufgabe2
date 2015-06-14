% variable to differ between running or stopped simulation
running=0;

% stopping and deleting all timers (simulation and lineplot)
stop(t);
stop(tlineplot);

delete(tlineplot);
clear('tlineplot');
clear('hlineaxes');


set(hp, 'visible', 'off');
clear('hp');