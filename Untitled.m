close all

figure;
hold on;
D=0.1;
tau=1;
Dis=1./sqrt(4*pi.*D).*exp(-(1-x./tau).^2./(4.*x.*D));
y=cumtrapz(Dis(x));
plot(x,y,'LineWidth',2.5);
plot(x,cstr(x),'LineWidth',2.5);
title('Segregation Quantity (S)','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
xline(1,'LineWidth',2.5);
yline(1,'LineWidth',2.5);
legend('Reactor','CSTR','Segregation (S)','Interpreter','Latex')