% expects the coordinaten in the Meshgrid 

% Author: J.Arning, H.Heinermann, F.Primadita
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 
function [positionMesh] =interpoltest(coordinates)
    coordinates = [coordinates(1) coordinates(2)];
      
    roundingVariable = 0.25; 
    
    rounded = round(coordinates./roundingVariable) .* roundingVariable; %runded the coordinaten on 0,25
    positionMesh = rounded./roundingVariable; %position in the Meshgrid is calculated

        switch 'positionMesh' %position is seting on the right place
            case 0
                positionMesh = [81, 81]; 
            otherwise
                positionMesh = positionMesh + [81, 81];            
        end
    

end
