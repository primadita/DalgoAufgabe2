
etime = etime + dt;
%hLinePoints = plot(gca,time, 0.5, 'x-');
dataNew = [dataNew sumh(positionMeshx,positionMeshy)]; 
timeNew = [timeNew etime];

if length(timeNew) >= 50
   timeNew = timeNew(2:end);
   dataNew = dataNew(2:end);
end

set(hlineplot, 'visible', 'on');
set(hlineplot,'XData',timeNew);
set(hlineplot, 'YData',dataNew);
drawnow; 

% if stop(timerfindall) == false
%     nowave = ['The wave(s) is(are) not moving. Press the start button again!'];
%     set(hwarntext, 'String', nowave,...
%                    'BackgroundColor','yellow',...
%                    'FontSize',11);
% end