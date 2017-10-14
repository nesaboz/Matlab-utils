function [fittedArray, fittedParameters] = FitGaussian(array)
% function [fittedArray,fittedParameters] = FitGaussian(array)
%
% Fits 'array' with the Gaussian shape function: a * exp( b * (x-c).^2 ) + d.
% Outputs 'fittedArray' and 'fittedParameters', among others 'c' parameter 
% that defines the Gaussian offset on the x axis
% 
% N. Bozinovic, 08/15/08

t = (1:size(array,1))';
myFitType = fittype('a * exp( b * (x-c).^2 ) + d');
[myMax,I] = max(array);
startPoint = [max(array)-min(array) -0.05 I min(array)];
options = fitoptions('Method','NonlinearLeastSquares','StartPoint',startPoint,'MaxFunEvals',1500);
[fittedParameters, junk, output] = fit(t,array,myFitType,options);

a = fittedParameters.a;
b = fittedParameters.b;
c = fittedParameters.c;
d = fittedParameters.d;

fittedArray = a*exp(b*(t-c).^2) + d;
Pos(1);
plot(t,array,t,fittedArray);
title('Axes 3 plot');

leg = str2mat(['a = ' num2str(a,'%8g')], ['b = ' num2str(b,'%8g')], ... 
           ['c = ' num2str(c,'%8g')], ['d = ' num2str(d,'%8g')], ...
           ['y = a*e^{b*(x-c)^2} + d.']);
% xlabel = 'Frames';
text(length(t)*0.7,max(array(:))*0.8,leg);