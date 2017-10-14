function [MPI_lin, MPI_log] = ScaleMPI(coeff1, coeff2)

N = size(coeff1);

DC = sum(coeff1.^2,2) + sum(coeff2.^2,2);

coeff1Scaled = zeros(N);
coeff2Scaled = zeros(N);

for i = 1:N(2)
    coeff1Scaled(:,i) = (coeff1(:,i).^2)./DC;
    coeff2Scaled(:,i) = (coeff2(:,i).^2)./DC;
end

MPI_lin = coeff1Scaled + coeff2Scaled;
MPI_log= 10*log10(MPI_lin);
