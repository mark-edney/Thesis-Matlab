%This script is used to normalize the residense time distribution 
function [tavg,et,Var,Skew]=Clean(x,y)
    et=y./trapz(x,y);
    tavg=trapz(x,x.*et);
    Var=trapz(x,((x-tavg).^2).*et);
    Skew=trapz(x,(((x-tavg).^3).*et))./(Var.^(3/4));
end
