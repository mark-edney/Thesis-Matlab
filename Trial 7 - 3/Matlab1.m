plot(Temperature(:,7),Conductivity(:,2))
xlabel("Temperature(C)")
ylabel("Conductivity (mS/cm)")
title("Coductivity change over a temperture range")
hold on
plot(Temperature(:,6),Conductivity(:,4))
xlabel("Temperature(C)")
ylabel("Conductivity (mS/cm)")
title("Coductivity change over a temperture range")
legend ("Inline", "Bulk")

