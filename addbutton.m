% Script to add sound sources to the animation
% Author: J.Arning, H.Heinermann, F.Primadita
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

%%

% increment number of sources
num_sourcenew = num_sourcenew+1;
% Check if number of sources is less than ten.
if num_source+num_sourcenew <= 10
    
% If yes, 

    zahl = num2str(num_source+num_sourcenew);
    
    %  % create new edit windows for frequency, amplitude and phase
    uicontrol('Style', 'text', ...
              'String', ['Source ' zahl ],...
              'Position', position,...
              'BackgroundColor', [0 0.4 0.6]);
    
    uicontrol('Style', 'text', ...
              'String', 'f',...
              'Position', position + [0 -30 -165 0]);
    uicontrol('Style', 'text', ...
              'String', 'A',...
              'Position',position + [60 -30 -165 0]);
    uicontrol('Style', 'text', ...
              'String','P',...
              'Position', position + [120 -30 -165 0]);
         
    hfreqNew = uicontrol('Style', 'edit', ...
                         'String', '50',...
                         'Position', position + [15 -30 -135 0]);    
    hAmplitudeNew = uicontrol('Style', 'edit', ...
                              'String', '1',...
                              'Position', position + [75 -30  -135 0]);  

    hPhiNew = uicontrol('Style', 'edit', ...
                        'String','0',...
                        'Position', position + [135 -30 -135 0]);

    position = position - [0 60 0 0];

    % make simulation window current axes and get position of added source
    % from click
    axes(haxes);    
    startpositionNew = ginput(1);
    startpositionAll = [startpositionAll; startpositionNew];
    po=startpositionAll(num_source+num_sourcenew,:);
    x=po(1);
    y=po(2);
    
    %set source marker in simulation window
    zahl=num2str(num_source+num_sourcenew);
    quelle=['x  Source ' zahl];
    ht=text(x,y,quelle);
    set(ht,'color','magenta');

       
else
% If number of sources is more than ten return error message
    error = ['Maximum number of sources is reached. You can not '...
              'add more sources.'];
    set(hwarntext, 'String',error);
    set(hwarntext, 'BackgroundColor','red', 'FontSize',11)
    num_sourcenew = num_sourcenew-1;
end