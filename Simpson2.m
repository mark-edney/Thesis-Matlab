%This function finds the integral with the simpsons 3/8 method
function [simp2]=Simpson2(x,y)
    a=x(1);
    b=x(end);
    n=length(x);
    h=(b-a)/n;
    
        simp2=y(1)+y(end);
    for k=2:1:n-1
        if rem(k,3)==0
            simp2=simp2+2*y(k);
        else
            simp2=simp2+3*y(k);
        end
    end
    simp2=simp2*h*3/8;
end
