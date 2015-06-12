% variable to differ between running or stopped simulation
running =1;

% loading frequency, amplitude and phase from edit windows
for cc = 1:num_source
    freq(cc) = str2double(get(hfreq(cc), 'String'));
    a0(cc)= str2double(get(hAmplitude(cc), 'String'));
    phi0(cc)= str2double(get(hPhi(cc), 'String'));
end

% initiating and starting timer for animation
t = timer('Period',dt,'TimerFcn', 'plotSinusoid',...
          'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
start(t);