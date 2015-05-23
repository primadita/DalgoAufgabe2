function trytoplotsinusoid


time = 1;
dt=0.01;
frequency = 1;
% initiate timer for animation
t = timer('Period',dt,'TimerFcn', @plotSinusoid, 'ExecutionMode','FixedRate', 'TasksToExecute',Inf);
hfig=figure;
start(t);
uiwait(hfig);
stop(t);delete(t);

function plotSinusoid( handle, event )
%UNTITLED Summary of this function goes here
  %Detailed explanation goes here
time=time+dt
[X,Y] = meshgrid(-20:.25: 20);
c=343;
amplitude=1;
T=1/frequency;
lambda = c/frequency;
r = sqrt(X.^2 + Y.^2);
Z = amplitude*sin(2*pi*(time./T+r/lambda));
surf(X,Y,Z); %'LineStyle,'none', 'EdgeColor','none'

shading(gca, 'interp');
view(2)
%plot(Z);
colormap('Gray');
drawnow;
end
end