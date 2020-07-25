i=4;
close all;

import11;
Code;
hold on;
plot(time,conf(:,i),'LineWidth',2.5);
title('Internal Recycle Study','FontSize',20);
xlabel({'Time (hr)'},'FontSize',20);
ylabel({'Conductivity(\mu S)'},'FontSize',20);

import13;
Code;
hold on;
plot(time,conf(:,i),'LineWidth',2.5);
legend('With recycle','No recycle');
saveas(gcf,'\Thesis\Writing\pic\Recycle','epsc')
saveas(gcf,'\Thesis\Writing\pic\Recycle','png')