figure;
hold on;
plot(time,cond(:,4))
fitplot=plot(minv1);
fitplot(2).LineWidth=2.5;
title('Conductivity for Sensor #4','FontSize',20)
xlabel({'Time(hr)'},'FontSize',20)
ylabel({'Conductivity($\mu$ S)'},'Interpreter','Latex','FontSize',20)
legend("RTD","Data","Fit","Confidence bounds (95%)");
saveas(gcf,'pic\sample_lm','epsc');
saveas(gcf,'pic\sample_lm','png');