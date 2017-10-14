% Ring
clc;

stack = LoadStack('C:\NENAD_DATA\ImagingData\2012_07_22');

if numel(stack) == 0
    return
end

[lambda, L] = FindWavelengths(stack);
timing = GetTimeStamps(stack);

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
[cubePol3, cubePol4, M] = ExtractTwoCubesHorizontal(cube);
%%
[MPI, coeff] = MPIRingMethod(cubePol3, cubePol4, 0.94);

%%
Pos(2)
x = lambda; 
% x = timing;
plot(x, MPI.a1)
hold on
plot(x, MPI.a2,'r')
plot(x, MPI.b,'g')
plot(x, MPI.c,'m')
legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')

% plot(MPIth.a1)
% plot(MPIth.a2,'r')
% plot(MPIth.b,'g')
% plot(MPIth.c,'m')

%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')
%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}', 'OAM^{+} th','OAM^{-} th', 'TE+TM th','HE_{11}^{x+y} th')

ylabel('Mode power contribution (dB)');
if x(1) ~= 0 
    xlabel('Wavelength (nm)');
else
    xlabel('Time (s)');
end

title('Recovered vales for MPI')
PrepareGraphWithLegend
hold off;