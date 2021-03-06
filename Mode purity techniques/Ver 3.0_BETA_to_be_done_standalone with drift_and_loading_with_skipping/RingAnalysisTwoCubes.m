% Ring
[stack, pathname] = LoadStack('C:\NENAD_DATA\ImagingData\2012_07_24');
% [lambda, L] = FindWavelengths(stack);
timing = GetTimeStamps(stack);
%%
if numel(stack) == 0
    return
end

[cubeBG, meanValue, stDev] = ConvertStackToMatrix(stack);
% 3) subtract background
% bg = LoadImage('C:\NENAD_DATA\ImagingData\2012_01_25\bg\bg_exp13000.tif');
bg = LoadImage('Y:\Instruments\Camera labview control\background.tif');

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
    temp = cubeBG(1:20, 1:20,i);
        
    bgValue = mean(temp(:));

    % arr(i) = bgValue;
    
    cube(:,:,i) = cubeBG(:,:,i) - bgValue;
    %cube(:,:,i) = cubeBG(:,:,i) - bg;
end

cube(cube<0) = eps*1e10;
disp('Done 3 - subtracted background')

%
% 4) crop cubes
% [cubePol3, cubePol4, M] = ExtractTwoCubes(cube);
% 4) crop cubes
[cubePol3, cubePol4, M] = ExtractTwoCubesHorizontal(cube);

% find the ring around cubePol3

%%

MPI = MPIRingMethod(cubePol3, cubePol4);

%%
Pos(2)
plot(lambda, MPI.a1)
hold on
plot(lambda, MPI.a2,'r')
% plot(lambda, MPI.b1,'g')
 plot(lambda, MPI.b,'g')
% plot(lambda, MPI.c1,'m')
% plot(lambda, MPI.b2,'g')
% plot(lambda, MPI.c2,'m')
% 
plot(lambda, MPI.c,'m')
legend('V_{21}^{+}','V_{21}^{-}', 'V_T','V_{11}')
xlabel('Wavelength (nm)');
ylabel('Mode power contribution (dB)');
title('MPI')
%%

% plot(MPI.a1)
% hold on
% plot(MPI.a2,'r')
% plot(MPI.b,'g')
% plot(MPI.c,'m')
% legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')

plot(timing/60, MPI.a1)
hold on
plot(timing/60, MPI.a2,'r')
plot(timing/60, MPI.b,'g')
plot(timing/60, MPI.c,'m')
%legend('V_{21}^{+}','V_{21}^{-}', 'V_T','V_{11}')
legend('OAM^{+}','OAM^{-}', 'parasitic','LP_{01}')
xlabel('Time (min)');
ylabel('Mode power contribution (dB)');
title('MPI')
%%

%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}')
%legend('OAM^{+}','OAM^{-}', 'TE+TM','HE_{11}^{x+y}', 'OAM^{+} th','OAM^{-} th', 'TE+TM th','HE_{11}^{x+y} th')


% xlabel('Time');


PrepareGraphWithLegendNE

% %%
% Pos(1);
% hold on
% plot(lambda, MPI.a1)
% plot(lambda, MPI.b1,'r')




