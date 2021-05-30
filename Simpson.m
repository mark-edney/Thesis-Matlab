%This function finds the integral with the simpsons 1/3 method
function [simp]=Simpson(x,y)
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
    
    simp=simp*h/3;
end
