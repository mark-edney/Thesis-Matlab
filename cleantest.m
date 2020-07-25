%This script is used to normalize the residense time distribution 
function [tavg,et]=Cleantest(x,y)
   et=y/trapz(x,y);
   tavg=trapz(x,x.*y)/trapz(x,y);
    a=x(1);
    b=x(end);
    n=length(x);
    h=(b-a)/n;
    
    simp=y(1)+y(end);
    for i=2:2:n-2
        simp=simp+2*y(1+i);
    end
    for i=1:2:n-1
      simp=simp+4*y(1+i);
    end
    
        simp2=y(1)+y(end);
    for k=2:1:n-1
        if rem(k,3)==0
            simp2=simp2+2*y(k);
        else
            simp2=simp2+3*y(k);
        end
    end
    simp=simp*h/3
    simp2=simp2*h*3/8
    t=trapz(x,y)
end
