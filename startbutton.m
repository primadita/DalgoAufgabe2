

for cc = 1:num_source
        freq(cc) = str2double(get(hfreq(cc), 'String'));
        a0(cc)= str2double(get(hAmplitude(cc), 'String'));
        phi0(cc)= str2double(get(hPhi(cc), 'String'));
end
        
        
        t = timer('Period',dt,'TimerFcn', 'plotSinusoid',...
        'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
        start(t);