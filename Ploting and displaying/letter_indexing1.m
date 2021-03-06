function letter_indexing1(s)
% function scalebar(x1,y1)
% draws scalebar on image

%h = text( x1, y1 ,texlabel(s));
%set(h,'Color',[1 1 1],'HorizontalAlignment','center','FontSize',20);

annotation(gcf,'textbox','String',{s},'FontSize',36,...
    'FontName','Arial',...
    'FitHeightToText','off',...
    'LineStyle','none',...
    'Position',[0.2734 0.8247 0.07031 0.06232],...
    'Color',[1 1 1]);

annotation(gcf,'line',[0.2516 0.3758],[0.185 0.186],'LineWidth',6,...
    'Color',[1 1 1]);

annotation(gcf,'textbox','String',{'{50} {\mu} {m}'},'FontSize',30,...
    'FontName','Arial',...
    'FitHeightToText','off',...
    'LineStyle','none',...
    'Position',[0.263 0.125 0.1237 0.05291],...
    'Color',[1 1 1]);