%This script is used to normalize the residense time distribution 
function [et,tavg]=Clean(cond,time)
   et=cond/trapz(time,cond)
   tavg=trapz(time,time.*et)
end
