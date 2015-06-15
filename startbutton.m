% Script to start simulation
% Author: J.Arning, H.Heinermann, F.Primadita 
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 


% variable to differ between running or stopped simulation

running = 1;

% if exist('hfreqNew')
% % read parameters from edit window
%         hfreq = [hfreq hfreqNew];
%         hAmplitude = [hAmplitude hAmplitudeNew];
%         hPhi=[ hPhi hPhiNew];
% end
% % loading frequency, amplitude and phase from edit windows
%  for cc = 1:(num_source+num_sourcenew)
%     freq(cc) = str2double(get(hfreq(cc), 'String'));
%     a0(cc)= str2double(get(hAmplitude(cc), 'String'));
%     phi0(cc)= str2double(get(hPhi(cc), 'String'));
%  end
%  
% 
%  
%  
if exist('t')==1
    stop(t);
    delete(t);
    clear('t');
end 
% initiating and starting timer for animation
t = timer('Period',dt,'TimerFcn', 'plotSinusoid',...
          'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
start(t);
