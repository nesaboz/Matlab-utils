% won't work if there is legend in the graph
h = gcf;
% PosTo(1)
h1 = get(h,'Children');
set(h,'Color',[1 1 1])

% input
myLetterSize = 24;
myAxisNumberSize = 20;
myLineWidth = 2;
myName = 'nesa.eps';

%% adjust letters on axes and title
xName = get(h1,'xlabel');
if numel(xName) > 1
    for i = 1:numel(xName)
        set(xName{i},'FontSize',myLetterSize);
    end
else
    set(xName,'FontSize',myLetterSize);
end

yName = get(h1,'ylabel');

if numel(yName) > 1
    for i = 1:numel(yName)
        set(yName{i},'FontSize',myLetterSize);
    end
else
    set(yName,'FontSize',myLetterSize);
end

zName = get(h1,'zlabel');
set(zName,'FontSize',myLetterSize);

titleName = get(h1,'title');
set(titleName,'FontSize',myLetterSize);
%% set up the box
box(h1,'on');
%% adjust the data lines
h2 = get(h1,'Children');
for iii = 1:numel(h2)
    set(h2(iii),'LineWidth',myLineWidth)
end
% adjust the axis lines and numbers
set(h1,'FontSize',myAxisNumberSize)
set(h1,'LineWidth',myLineWidth)
set(h1,'LineWidth',myLineWidth)
%yTL = (get(h1,'YTickLabel'));
%set(h1,'YTickLabel',stryTL(1:2:end));

