function trytoplotsinusoid


frequency = 250;

% initiate timer for animation
t = timer('Period',1,'TimerFcn', @plotSinusoid, 'ExecutionMode', 'FixedRate');
hfig = figure();
start(t);uiwait(hfig);stop(t);delete(t);

function plotSinusoid( handle, event )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

time=(1:1000);

[X,Y] = meshgrid(-20:.25: 20);
c=343;
a=1;
lambda = c/frequency;

r = sqrt(X.^2 + Y.^2);
Z = a*sin(2*pi*r/lambda);
surf(X,Y,Z); %'LineStyle','none', 'EdgeColor','none'
shading(gca, 'interp');
view(2)
colormap('Gray');
end




%f=figure;
%set(f, 'Menubar', 'none')

% Auslesen der Quellpositionen
end