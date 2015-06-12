
num_source = num_source+1;
num_sourcenew = 1;

if num_source <= 10

    zahl = num2str(num_source);
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
                         'String', '150',...
                         'Position', position + [15 -30 -135 0]);    
    hAmplitudeNew = uicontrol('Style', 'edit', ...
                              'String', '1',...
                              'Position', position + [75 -30  -135 0]);  

    hPhiNew = uicontrol('Style', 'edit', ...
                        'String','0',...
                        'Position', position + [135 -30 -135 0]);

    position = position - [0 60 0 0];

    newfreq=str2double(get(hfreqNew, 'String'));
    newa0=str2double(get(hAmplitudeNew, 'String'));
    newphi0=str2double(get(hPhiNew, 'String'));

    axes(haxes);    
    startpositionNew = ginput(1);
    startpositionAll = [startpositionAll; startpositionNew];


    po=startpositionAll(num_source,:);
    x=po(1);
    y=po(2);
    zahl=num2str(num_source);
    quelle=['Source ' zahl];
    ht=text(x,y,quelle);
    set(ht,'color','magenta');


    freq = [freq newfreq];
    a0 = [a0 newa0];
    phi0 = [phi0 newphi0];
else
    error = ['Maximum number of sources is reached. You can not '...
              'add more sources.'];
    set(hwarntext, 'String',error);
    pause(5);
    num_source = 10;
end