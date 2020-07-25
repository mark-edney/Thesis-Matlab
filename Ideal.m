%Creates a function in order to display the ideal graphs on the same RTD
%plot.

function[yc,yp,yl]=Ideal(tau,theta)
x=theta;

%Model for CSTR
cstr=@(x,tau)exp(-x/tau)/tau;
yc=cstr(x,tau);


%for PFR model
for i=1:1:length(theta)
    if tau<theta(i)
    else
        ttau=theta(i);
        i=length(theta);
    end
end
yp=dirac(x-ttau);
idx=yp==inf;
yp(idx)=length(theta);
yp(idx)=length(theta)/trapz(theta,yp);
end