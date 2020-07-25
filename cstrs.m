function [my]=cstrs(x,n,tau)
%This function produces a series of models based on the cstr in series
%model and test the models for the best results
Cstrs=@(x,n,tau)(n.*(n.*x./tau).^(n-1)./(factorial(n-1)).*exp(-n.*x./tau));
my=Cstrs(x,n,tau);
end