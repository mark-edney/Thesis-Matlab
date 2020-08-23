%Converts conductivity reading into a concentration  for sodium in water
%with system meters

y=[0 1.24 2.22 3.104 3.792 4.102 4.856 5.242 5.652];
x=[419 2608 4369 5974 7044 7634 8838 9196 9648];
lm=fitlm(x,y)

plot (lm);

ylabel(["Concentration NaCl"; "g/L"],'FontSize',16)
xlabel(["Conductivity";"\muS/cm"],'Interpreter','tex','FontSize',16)
title("Concentration of NaCl solution vs. Conductivity",'FontSize',16)

