function [int]=Simpson(a,b,y)
n=100;
h=(b-a)/n;
simp=y(1)+y(end);
   for i=1:2:n-1
      simp=simp+4*y(a+i*h);
   end
   
   for i=2:2:n-2
      simp=simp+2*y(a+i*h);
   end
   int=simp*h/3