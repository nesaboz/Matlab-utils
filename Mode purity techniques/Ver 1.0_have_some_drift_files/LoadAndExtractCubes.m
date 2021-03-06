% Ring
clc;

[stack, pathname] = LoadStack('C:\NENAD_DATA\ImagingData\2012_03_24\dk11OD135\');

if numel(stack) == 0
    return
end

% [lambda, L] = FindWavelengths(stack);

% if L == 454
%     L = 445;
% end

timing = GetTimeStamps(stack);
ID = GetID(stack(1).name);

[cubeBG, meanValue, stDev] = ConvertStackToMatrix(stack);
% 3) subtract background
bg = LoadImage('C:\NENAD_DATA\ImagingData\2012_01_25\bg\bg_exp13000.tif');

N = size(cubeBG);
if numel(N) == 2
    N(3) = 1;
end

bgValue = mean(bg(:));
cube = cubeBG;
arr = zeros(1,N(3));
for i=1:N(3)
    % local BG subtraction
    %temp = cubeBG(N(1)/2 + (-20:20),1:50,i);
    % temp = cubeBG(N(1) + (-70:-1), 1:70,i);
    temp = cubeBG(1:10, 1:10,i);
        
    bgValue = mean(temp(:));

    % arr(i) = bgValue;
    cube(:,:,i) = cubeBG(:,:,i) - bgValue;
end
cube(cube<0) = eps*1e10;
disp('Done 3 - subtracted background')
%
% 4) crop cubes
% [cubePol3, cubePol4, M] = ExtractTwoCubes(cube);
% 4) crop cubes
[cubePol1, cubePol2, M] = ExtractTwoCubesHorizontal(cube);
% [cubePol1, cubePol2, M] = ExtractTwoCubesVertical(cube);

