function squareErrorGraph(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,...
    'MarkerFaceColor',[0.831372559070587 0.815686285495758 0.7843137383461],...
    'Marker','o',...
    'LineWidth',2,...
    'Parent',axes1);
set(plot1(1),'DisplayName','X Axis',...
    'Color',[0.635294139385223 0.0784313753247261 0.184313729405403]);
set(plot1(2),'DisplayName','Y Axis',...
    'MarkerEdgeColor',[0 0.498039215803146 0],...
    'Color',[0 0.498039215803146 0]);
set(plot1(3),'DisplayName','Z Axis',...
    'MarkerEdgeColor',[0 0.447058826684952 0.74117648601532],...
    'Color',[0 0.447058826684952 0.74117648601532]);

% Create ylabel
ylabel('Error in extraploated position (mm)','FontName','AvantGarde');

% Create xlabel
xlabel('Error in square size (mm)','FontName','AvantGarde');

% Set the remaining axes properties
set(axes1,'FontSize',8,'LineWidth',1,'TickDir','out','TickLength',...
    [0.02 0.02],'XColor',[0.3 0.3 0.3],'XMinorTick','on','XTick',...
    [-0.2 -0.1 0 0.1 0.2],'YColor',[0.3 0.3 0.3],'YGrid','on','YMinorTick','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.643452388216697 0.798412701180057 0.141071427081312 0.104761901994546]);

