% %set(shandle,'ButtonDownFcn',@buttondownCallback)  
%      
% function buttondownCallback(~,~)
% %         set(hLinePlot, 'Visible', 'on');
% % 
% 
% 
% 
% %         coordinates = get(gca,'Currentpoint');
% end
function [positionMeshx, positionMeshy] =interpoltest(coordinates)
    coordinatesx = coordinates(1,1);
    coordinatesy = coordinates(1,2);
    roundingVariable = 0.25;

%--------------------------------------------------------------------------
    rounded = round(coordinatesx/roundingVariable) * roundingVariable;
    positionMeshx = rounded/roundingVariable;

        switch positionMeshx
            case 0
                positionMeshx = 81;
            otherwise
                positionMeshx = positionMeshx + 81;            
        end
 
        roundedy = round(coordinatesy/roundingVariable) * roundingVariable;
        positionMeshy = roundedy/roundingVariable;
        switch positionMeshy
            case 0
                positionMeshy = 81; 
            otherwise
                positionMeshy = positionMeshy + 81;     
        end
end