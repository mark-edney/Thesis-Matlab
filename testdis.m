tau=1;

E=zeros(1,2000);
hold on;
 for i=1:1:length(E)
     my=disperssion(theta1,i/length(E),tau);
     E(i)=Modeltest(theta1,ett1,my);
    plot(theta1,disperssion(time,i/length(E),tavg1));
 end
nmin=find(E==min(E))/length(E)
figure
hold on;
plot(theta1,ett1)
plot(theta1,disperssion(theta1,nmin,tau))