
function [positionMesh] =interpoltest(coordinates)
    coordinates = [coordinates(1) coordinates(2)];
    
  
    roundingVariable = 0.25;

    
    rounded = round(coordinates./roundingVariable) .* roundingVariable;
    positionMesh = rounded./roundingVariable;

        switch 'positionMesh'
            case 0
                positionMesh = [81, 81];
            otherwise
                positionMesh = positionMesh + [81, 81];            
        end
    
% %--------------------------------------------------------------------------
%     rounded = round(coordinatesx/roundingVariable) * roundingVariable;
%     positionMeshx = rounded/roundingVariable;
% 
%         switch positionMeshx
%             case 0
%                 positionMeshx = 81;
%             otherwise
%                 positionMeshx = positionMeshx + 81;            
%         end
%  
%         roundedy = round(coordinatesy/roundingVariable) * roundingVariable;
%         positionMeshy = roundedy/roundingVariable;
%         switch positionMeshy
%             case 0
%                 positionMeshy = 81; 
%             otherwise
%                 positionMeshy = positionMeshy + 81;     
%         end
end
