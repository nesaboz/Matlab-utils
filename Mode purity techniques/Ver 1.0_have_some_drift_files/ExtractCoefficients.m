function  coeff = ExtractCoefficients(FScoeff, scalingCoeff)
coeff = zeros(size(FScoeff));
for i = 1:size(cube.FScoeff,1)
    [coeff(i,1), coeff(i,2)] = FindAB(FScoeff(i,1), FScoeff(i,3));
    [junk,junk1, coeff(i,3)] = FindABC(FScoeff(i,1), FScoeff(i,2), FScoeff(i,3));
    [junk,junk1, coeff(i,4)] = FindABC(FScoeff(i,1), FScoeff(i,4), FScoeff(i,3));
    [junk,junk1, coeff(i,5)] = FindABC(FScoeff(i,1), FScoeff(i,5), FScoeff(i,3));
    [junk,junk1, coeff(i,6)] = FindABC(FScoeff(i,1), FScoeff(i,6), FScoeff(i,3));
    
    % [~,c(i)] = FindAB(FScoeff(i,1), FScoeff(i,2)); 
    
    coeff(i,3) = coeff(i,3)/scalingCoeff;    
end
