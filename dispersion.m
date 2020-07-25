%This function is for the dispersion model

function [my]=dispersion(x,D,tau)
Dis(:)=@(x,D,tau)(1./sqrt(4*pi.*D).*exp(-(1-x./tau).^2./(4.*D)));
my=Dis(x,D,tau);
end