%This program is to test the effective and speed of different numerical
%integrations


%Starts the tes
profile on;

%The values to test
x=[0:1:100];
f=@(x)(x.^2);
y=f(x);
T=@(x)(1/3*x.^3);
Tint=T(x(end));

%The test for different methods
    E1=abs((Tint-trapz(x,y))/Tint*100)
    
    E2=abs((Tint-Simpson(x,y))/Tint*100)
    
    E3=abs((Tint-Simpson2(x,y))/Tint*100)
  
    %Display the viewer
    profile viewer