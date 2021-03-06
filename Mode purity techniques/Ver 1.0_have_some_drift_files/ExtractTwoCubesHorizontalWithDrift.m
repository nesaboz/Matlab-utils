function [cube1, cube2, M] = ExtractTwoCubesHorizontalWithDrift(cube)

% distance between centers = 134;
dbc = 134;

N = size(cube);
[xCentersBegin, yCentersBegin, radius] = FindTwoCubeCentersHorizontal(cube);

h = waitbar(0,'Please wait...');

xCenters = zeros(N(3),2);
yCenters = zeros(N(3),2);
radiusC = zeros(N(3),2);

cube1 = zeros(2*radius + 1, 2*radius + 1, N(3));
cube2 = zeros(2*radius + 1, 2*radius + 1, N(3));

for i = 3:N(3)-2
    waitbar(i/N(3),h)
    
    [xCenters(i,1), yCenters(i,1), radiusC(i,1)] = ...
        FindDonutCenterAndRadius(mean(cube(xCentersBegin(1) + (-radius:radius),...
                                           yCentersBegin(1) + (-radius:radius), i-2:i+2),3));
    [xCenters(i,2), yCenters(i,2), radiusC(i,2)] = ...
        FindDonutCenterAndRadius(mean(cube(xCentersBegin(2) + (-radius:radius),...
                                           yCentersBegin(2) + (-radius:radius), i-2:i+2),3));
      
    if i == 3
        xCenters(1,1) = xCenters(3,1);
        xCenters(2,1) = xCenters(3,1);
        xCenters(1,2) = xCenters(3,2);
        xCenters(2,2) = xCenters(3,2);
        yCenters(1,1) = yCenters(3,1);
        yCenters(2,1) = yCenters(3,1);
        yCenters(1,2) = yCenters(3,2);
        yCenters(2,2) = yCenters(3,2);
    end
    
    if i == N(3) - 2
        xCenters(N(3),1) = xCenters(N(3)-2,1);
        xCenters(N(3)-1,1) = xCenters(N(3)-2,1);
        xCenters(N(3),2) = xCenters(N(3)-2,2);
        xCenters(N(3)-1,2) = xCenters(N(3)-2,2);
        yCenters(N(3),1) = yCenters(N(3)-2,1);
        yCenters(N(3)-1,1) = yCenters(N(3)-2,1);
        yCenters(N(3),2) = yCenters(N(3)-2,2);
        yCenters(N(3)-1,2) = yCenters(N(3)-2,2);
    end
    
    % something is wrong if:
    if (abs(yCenters(i,1) - yCenters(i,2)) > dbc + 1) || ...
       (abs(yCenters(i,1) - yCenters(i,2)) > dbc - 1) 
        temp1 = mean(cube(xCentersBegin(1) + (-radius:radius),...
            yCentersBegin(1) + (-radius:radius), i-2:i+2),3);
        temp1Sum = sum(temp1(:));
        temp2 = mean(cube(xCentersBegin(2) + (-radius:radius),...
            yCentersBegin(2) + (-radius:radius), i-2:i+2),3);
        temp2Sum = sum(temp2(:));
       
        if temp1Sum > temp2Sum
            % belive in left center
            yCenters(i,2) = yCenters(i,2) + dbc;
        else
            % believe in right center
            yCenters(i,1) = yCenters(i,2) - dbc;
        end
    end
    
             
        
%     if abs(xCentersBegin(1) - radius + xCenters(i,1) - radius) < 1
%         pause
%     end
%     if abs(xCentersBegin(1) - radius + xCenters(i,1) + radius) > N(1) 
%         pause
%     end
%     if abs(yCentersBegin(1) - radius + yCenters(i,1) - radius) < 1
%         pause
%     end
%     if abs(yCentersBegin(1) - radius + yCenters(i,1) + radius) > N(2) 
%         pause
%     end
%     
%     if abs(xCentersBegin(2) - radius + xCenters(i,2) - radius) < 1
%         pause
%     end
%     if abs(xCentersBegin(2) - radius + xCenters(i,2) + radius) > N(1) 
%         pause
%     end
%     if abs(yCentersBegin(2) - radius + yCenters(i,2) - radius) < 1
%         pause
%     end
%     if abs(yCentersBegin(2) - radius + yCenters(i,2) + radius) > N(2) 
%         pause
%     end

    cube1(:,:,i) = cube(xCentersBegin(1) - radius + xCenters(i,1) + (-radius:radius), ...
                        yCentersBegin(1) - radius + yCenters(i,1) + (-radius:radius), i);
    cube2(:,:,i) = cube(xCentersBegin(2) - radius + xCenters(i,2) + (-radius:radius), ...
                        yCentersBegin(2) - radius + yCenters(i,2) + (-radius:radius), i);   
end
close(h)


for i = [1, 2, N(3)-1, N(3)]
    cube1(:,:,i) = cube(xCentersBegin(i,1) - radius + xCenters(i,1) + (-radius:radius), ...
                        yCentersBegin(i,1) - radius + yCenters(i,1) + (-radius:radius), i);
    cube2(:,:,i) = cube(xCentersBegin(i,1) - radius + xCenters(i,2) + (-radius:radius), ...
                        yCentersBegin(i,1) - radius + yCenters(i,2) + (-radius:radius), i);   
end

disp('Done 4 - extracted cubes');
M = size(cube1);