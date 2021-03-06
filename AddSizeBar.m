function createfigure(X1, Y1, X2, Y2)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data

%  Auto-generated by MATLAB on 05-Dec-2016 23:15:33

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'MarkerSize',1,'Marker','x','LineWidth',2,'LineStyle','none',...
    'Color',[0 0 1]);

% Create plot
plot(X2,Y2,'MarkerFaceColor',[1 0 0],'Marker','o','LineWidth',2,...
    'LineStyle','none',...
    'Color',[1 0 0]);

% Create title
title('XY location of detected cells and beads');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[-2113.84572416172 1956.04037282941]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[3760.86696768075 6866.67373557157]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'DataAspectRatio',[1 1 1],'FontSize',40,'LineWidth',2,...
    'PlotBoxAspectRatio',[2034.94304849557 1552.90338394541 1],'XTick',[],...
    'YTick',[]);
% Create rectangle
annotation(figure1,'rectangle',...
    [0.28742886773072 0.174093371730969 0.0633523822692805 0.0107331012310966],...
    'FaceColor',[0 0 0]);

