function [positionMesh] =interpoltest(coordinates)
% This function is useful to get the chosen position on the meshgrid with 
% the right value of coordinate systems by transforming the ginput x- and 
% y-coordinates to the right x-, y-value of meshgrid axis.

% Author: J.Arning, H.Heinermann, F.Primadita
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 
    coordinates = [coordinates(1) coordinates(2)];
      
    roundingVariable = 0.25; 
    
    rounded = round(coordinates./roundingVariable) .* roundingVariable; %round the coordinates with 0.25
    positionMesh = rounded./roundingVariable; %position in the meshgrid is calculated

        switch 'positionMesh' %position is set on the right place
            case 0
                positionMesh = [81, 81]; 
            otherwise
                positionMesh = positionMesh + [81, 81];            
        end
    

end
