% Script to initiate GUI, waves simulation and line plot
% Author: J.Arning, H.Heinermann, F.Primadita
% Ver. 0.01 initial create (empty) 23-May-2015 			 JA, HH, FP 

%stop(timerfindall);
delete(timerfindall);

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
set(hlineaxes, 'XTick', []);

% legend of the table
uicontrol('Style', 'text', ...
          'String', 'f:frequency[Hz] A:Amplitude P:Start angle[rad]',...
          'FontSize',10,...
          'Position',[330 20 300 25]);

%% Place warning window

hwarnpanel = uipanel('Parent', hfig, 'Title','Warning','FontSize',11,...
                     'Position',[0.56 0.52 0.25 0.38]);
                 
hint = ['Please left-click on the axes on the left to determine your' ...
        ' desired source points as many times as the number you put before.'...
        ' Then, put your desired values of frequency, amplitude, and '...
        'start angle on the right table. Then click on start button '...
        'under the 3D-simulation window. It is possible to add one '...
        'source by clicking on the add-source button above. You will'...
        ' then be asked to place the source point like before. If you '...
        'change any frequency, angle, or amplitude, do not forget to press'...
        ' the start button again!'];
    
hwarntext = uicontrol('Parent', hwarnpanel, 'Style','text',...
                      'String', hint,...
                      'Visible','on',...
                      'FontSize',10,...
                      'Units','Normalized',...
                      'Position',[0.03 0.03 0.95 0.93]);

%% initiate acoustic sources
% input dialog to give the number of acoustic sources
input_source = inputdlg('How many wave sources do you want to have?',...
                        'Input number of wave source(s)');

num_source = cell2mat(input_source);
num_source = str2double(num_source);

% error message for no input and too many inputs
while isnan(num_source) == 1
    %herror = errordlg('Please put a number'); pause(3);
    
    input_source = inputdlg('Error.Please type a number',...
                        'Error');
    num_source = cell2mat(input_source);
    num_source = str2double(num_source);
    
end

while num_source > 10
    questtext = ['The number of acoustic sources exceeded the maximum. The' ...
                 ' maximum number of sources is 10. Do you want to choose'...
                 ' another number?'];
    new_number = questdlg(questtext, 'Input new number of sources',...
                          'Yes','No','Cancel','Yes');
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
    quelle=['x  Source ' zahl];
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
                          'String', '50',...
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
          
% empty vectors for the callback functions
timeNew = [];
dataNew = [];

num_sourcenew = 0;

positionMeshx = [];
positionMeshy = [];
positionMesh =  [];

num_sourcenew = 0;

sumh = [];

etime = 0;

