


            num_source = num_source+1;
            
                
                zahl = num2str(num_source);
                uicontrol( 'Style', 'text', ...
                           'String', ['Quelle ' zahl ],...
                           'Position', position,...
                           'BackgroundColor', [0 0.4 0.6]);

                uicontrol( 'Style', 'text', ...
                           'String', 'f',...
                           'Position', position + [0 -30 -165 0]);
                uicontrol( 'Style', 'text', ...
                           'String', 'A',...
                           'Position',position + [60 -30 -165 0]);
                uicontrol( 'Style', 'text', ...
                           'String','P',...
                           'Position', position + [120 -30 -165 0]);

                hfreqNew = uicontrol( 'Style', 'edit', ...
                           'String', '150',...
                           'Position', position + [15 -30 -135 0]);    
                hAmplitudeNew = uicontrol( 'Style', 'edit', ...
                           'String', '1',...
                           'Position', position + [75 -30  -135 0]);  
                %phi = text('Interpreter', 'latex', 'String', '$$\phi$$');
                hPhiNew = uicontrol( 'Style', 'edit', ...
                           'String','0',...
                           'Position', position + [135 -30 -135 0]);
                position = position - [0 60 0 0];
            
                
                hfreq=[hfreq hfreqNew];
                hAmplitude=[hAmplitude hAmplitudeNew];
                hPhi=[hPhi hPhiNew];
                
            axes(haxes);    
            startpositionNew = ginput(1);
            %startpositionNew = (startpositionNew-0.5) * 40;
            startpositionAll = [startpositionAll; startpositionNew];

                

        po=startpositionAll(num_source,:);
        x=po(1);
        y=po(2);
        zahl=num2str(num_source);
        quelle=['Quelle ' zahl];
        ht=text(x,y,quelle);
        set(ht,'color','magenta');
    
                
            