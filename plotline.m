% Script to create line plot of waveform at one position as a function of
% time
% Author: J.Arning, H.Heinermann, F.Primadita 
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

% increment time
etime = etime + dt;

% update time vector and read z-Values from simulation plot routine
dataNew = [dataNew sumh(positionMeshx,positionMeshy)]; 
timeNew = [timeNew etime];

% update time domain 
if length(timeNew) >= 50
   timeNew = timeNew(2:end);
   dataNew = dataNew(2:end);
end

% update plot window with values
set(hlineplot, 'visible', 'on');
set(hlineplot,'XData',timeNew);
set(hlineplot, 'YData',dataNew);
drawnow; 