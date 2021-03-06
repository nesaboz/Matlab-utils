function AddPolarimetryData(stokesParameters)
% Plot the polarimetry data
s0 = stokesParameters(1,:);
x = stokesParameters(2,:)./s0;
y = stokesParameters(3,:)./s0;
z = stokesParameters(4,:)./s0;
for i = 1:size(z,2)
    H = plot3(x(1:i),y(1:i),z(1:i),'m.');
    
    set(gca,'fontweight','bold','fontsize',16,'fontname','arial');
    set(H,'markersize',20,'markeredgecolor','m','markerfacecolor','m','color','m','linewidth',0.2);
    %H = plot3(x(100:120),y(100:120),z(100:120),'m-.');
    %set(gca,'fontweight','bold','fontsize',12,'fontname','arial');
    %set(H,'markersize',12,'markeredgecolor','m','markerfacecolor','m','color','m','linewidth',2);
    view(135,20);  % change the view angle
    % view(45,45);  % change the view angle
    %alpha(0.70);  % set opacity of sphere to 70%
    %ylim(gca,[0 120]);
    %xlabel('S1');
    %ylabel('S2');
    %zlabel('S3');
    
    title('Poincare Sphere');
    
    %legend('data');
    %line width of legend
    h = findobj('type', 'axes');  % Find all sets of axes
    set(h(1), 'linewidth',2)  % Making the vertical lines blend in with the background
    set(h(1), 'linewidth',2)  % Making the horizontal lines blend in with the background
    %set(H,'markersize',8,'color','m');
    
    % Get info for plotting text boxes on screen
    x_rng = xlim;   % range of horizontal axis
    y_rng = ylim;  % range of initial right vertical axis
    delta_x = x_rng(2) - x_rng(1);
    delta_y = y_rng(2) - y_rng(1);
    pause(0.01);
end



