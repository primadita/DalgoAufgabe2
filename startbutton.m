% 
% if num_sourcenew == 0;
%     
%     for cc = 1:(num_source)
%         freq(cc) = str2double(get(hfreq(cc), 'String'));
%         a0(cc)= str2double(get(hAmplitude(cc), 'String'));
%         phi0(cc)= str2double(get(hPhi(cc), 'String'));
%     end 
% else
% 
%     for cc = 1:num_source-1
%         freq(cc) = str2double(get(hfreq(cc), 'String'));
%         a0(cc)= str2double(get(hAmplitude(cc), 'String'));
%         phi0(cc)= str2double(get(hPhi(cc), 'String'));
%     end
%     freq = [freq newfreq];
%     a0 = [a0 newa0];
%     phi0 = [phi0 newphi0];
% 
% end


t = timer('Period',dt,'TimerFcn', 'plotSinusoid',...
          'ExecutionMode','fixedRate', 'TasksToExecute',Inf);
start(t);