distroLow = fitdist(low,'normal')
distroMed = fitdist(med,'normal')
distroHigh = fitdist(high,'normal')
p = plot(distroLow)
hold on
plot(distroMed)
plot(distroHigh)
%xlabel('Cell Body Movment (Px)')
%hold off
%figure 


ax = gca; 
ax.FontSize = 14;