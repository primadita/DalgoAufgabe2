clear all;
close all;
clc;
%% constants
% speed of sound
c=343;
% variable for sinusoidal function
time = 0;
% timer period
dt=0.001;

%% initiate
% initiate meshgrid for 3d plotting
tau = 0.25;
[X,Y] = meshgrid(-20 : tau : 20);
sizeMesh = size(X);
sizeMesh = sizeMesh(1);

%% initiate figure and plot axes
hfig = figure('Position', [300 300 1200 650], 'Resize', 'off');
movegui(hfig,'center');

% set axes of 3D waves simulation
haxes = axes('Parent', hfig, 'position',[0.02  0.1  .5  .8]);
axis equal;

% set axes of 2D line plot
hlineaxes = axes('Parent', hfig, 'position',[0.56  0.1  .25  .4]);

hlineplot = plot(hlineaxes, 0,0.5);
xlabel('time', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
set(hlineplot, 'visible', 'off');

%% Place warning window

hwarnpanel = uipanel('Parent', hfig, 'Title','Warning','FontSize',10,...
                     'Position',[0.56 0.52 0.25 0.38]);
hwarntext = uicontrol('Parent', hwarnpanel, 'Style','text',...
                      'String','test',...
                      'Position',[10 5 280 250]);
%hilfe=helpdlg('Im Input-Dialog musst du die Anzahl der Quellen festlegen.
%Dann musst du die Quellen mit der Maus in der Oberfl�che anordenen und
%die gew�nschten Werte f�r Frequenz, Amplitude und Phase eingeben. ');
%movegui(hilfe,'northeast');

%% initiate acoustic sources
% input dialog to give the number of acoustic sources
input_source = inputdlg('How many wave sources do you want to have?',...
                      'Input number of wave source(s)');
num_source = cell2mat(input_source);
num_source = str2double(num_source);

while num_source > 10
    new_number = questdlg('The number of acoustic sources exceeded the maximum. The maximum number of sources is 10. Do you want to choose another number?',...
        'Input new number of sources','Yes','No','Cancel','Yes');
    switch new_number
        case 'Yes'
            input_source = inputdlg('How many wave sources do you want to have?',...
                      'Input number of wave source(s)');
            num_source = cell2mat(input_source);
            num_source = str2double(num_source);
        case 'No'
            num_source = 10 ;
        case 'Cancel'
            close all; clear; clc;
    end
end

% determine the position of the acoustic sources
startpositionAll = ginput(num_source);
startpositionAll = (startpositionAll-0.5) * 40;


%% initiate surface plot
shandle = surf(haxes, X,Y,X*0);

% interpolate surface
shading(gca, 'interp');
view(2);

axis off;

% black and white
colormap('Gray');

% better renderer (fasten 3d-plot)
set(hfig, 'renderer', 'opengl')

% source naming on the simulation
for kk= 1:num_source
    po=startpositionAll(kk,:);
    x=po(1);
    y=po(2);
    zahl=num2str(kk);
    quelle=['Source ' zahl];
    ht=text(x,y,quelle);
    set(ht,'color','magenta');
end

%% initiate buttons for GUI

uicontrol('Style', 'pushbutton',...
          'String', 'Start',...
          'Position', [20 15 100 30],...
          'Callback', 'startbutton');
uicontrol('Style', 'pushbutton',...
          'String', 'Stop',...
          'Position', [120 15 100 30],...
          'Callback', 'stopbutton');
uicontrol('Style', 'pushbutton',...
          'String', 'Lineplot',...
          'Position', [220 15 100 30],...
          'Callback', 'linebutton');       
uicontrol('Style', 'pushbutton',...
          'String', 'Add Source',...
          'Position', [800 600 180 20],...
          'Callback', 'addbutton');

% determine the first position of the data table
position = [1000 600 180 20];



% data tab
freq = [];
a0 = [];
phi0 = [];

for ll = 1 : num_source
    zahl = num2str(ll);
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

    hfreq(ll) = uicontrol('Style', 'edit', ...
                          'String', '150',...
                          'Position', position + [15 -30 -135 0]);    
    hAmplitude(ll) = uicontrol('Style', 'edit', ...
                               'String', '1',...
                               'Position', position + [75 -30  -135 0]);  
    %phi = text('Interpreter', 'latex', 'String', '$$\phi$$');
    hPhi(ll) = uicontrol('Style', 'edit', ...
                         'String','0',...
                         'Position', position + [135 -30 -135 0]);
    position = position - [0 60 0 0]; 

end      

for cc = 1:num_source
    freq(cc) = str2double(get(hfreq(cc), 'String'));
    a0(cc)= str2double(get(hAmplitude(cc), 'String'));
    phi0(cc)= str2double(get(hPhi(cc), 'String'));
end


timeNew = [];
dataNew = [];


positionMeshx = [];
positionMeshy = [];
positionMesh =  [];

newfreq = [];
newa0 = [];
newphi0 = [];
num_sourcenew = 0;

%%

sumh = [];

etime = 0;

