% MDT FTIR by interplation, Non expansive, 
% you need to format cells, 6-decimal places before input!

% section 2 breaks because x values are rounded?
endVal = 4000;
Sample = "GMA2";
SamplePrefix = "FTIR of ";
Data = readtable('Gelma.csv');
xWavenumber = table2array(Data(:,1));
yAsorbance = table2array(Data(:,2));
yZero = zeros(size([0:1:min(xWavenumber)-1]));
yZeroPlusYNormal = vertcat(yZero',yAsorbance);

% X add trail of numbers to start wavlength at zero
addVectX = [0:1:min(xWavenumber)-1]; % the minus 1 is as 399.x is already on
xScaledWaveN = vertcat(addVectX',xWavenumber); % this is the array with blanks before using non - interplated data


% interplated X and Y for peak values - this x does not start at zero!
% we need to make y start at zero, we do this above.
new_x_data = linspace(0,max(xScaledWaveN),4000); %min max values
new_y_data = interp1(xScaledWaveN,yZeroPlusYNormal,new_x_data)


plot(xWavenumber,yAsorbance,'r', 'LineWidth',1) %line ftir plot of real data
hold on


%this is the using interplation by parabaler estimates, takes data starting
%from zero and interplated Y and X as need linier increece
findpeaksInterp(new_y_data)

[pekInt,loc] = findpeaksInterp(new_y_data)
[VoidpekInts2,Voidlocs2] = findpeaks(new_y_data)

%DiffVectc = pekInt-VoidpekInt
%pdc = fitdist(DiffVectc','normal')



hold on
scatter(loc, pekInt,30,'x','b','r') % find how to make diffrent

%plotting
xlabel('wavenumber (cm^-^1)')
ylabel('Asorbance (a.u)');
title(SamplePrefix + Sample)
grid on
set(gca, 'xdir','reverse')
xlim([400 4000]); % limits x axis, flipped by above

%% plot 2 - callogen
figure()
endVal = 4000;
SampleC = "GelS";
SamplePrefixC = "FTIR of ";
DataC = readtable('callo.csv');
xWavenumberC = table2array(DataC(:,1));
yAsorbanceC = table2array(DataC(:,2));
yZeroC = zeros(size([0:1:min(xWavenumberC)-1]));
yZeroPlusYNormalC = vertcat(yZeroC',yAsorbanceC);

% X add trail of numbers to start wavlength at zero
addVectXC = [0:1:min(xWavenumberC)-1]; % the minus 1 is as 399.x is already on
xScaledWaveNC = vertcat(addVectXC',xWavenumberC); % this is the array with blanks before using non - interplated data


% interplated X and Y for peak values - this x does not start at zero!
% we need to make y start at zero, we do this above.
new_x_dataC = linspace(0,max(xScaledWaveNC),4000); %min max values
new_y_dataC = interp1(unique(xScaledWaveNC),yZeroPlusYNormalC,new_x_dataC)


plot(xWavenumberC,yAsorbanceC,'r', 'LineWidth',1) %line ftir plot of real data
hold on


%this is the using interplation by parabaler estimates, takes data starting
%from zero and interplated Y and X as need linier increece
findpeaksInterp(new_y_dataC)
[pekIntC,locC] = findpeaksInterp(new_y_dataC)

[VoidpekIntc,Voidlocc] = findpeaks(new_y_dataC)

%DiffVectc = pekInt-VoidpekInt
%pdc = fitdist(DiffVectc','normal')

hold on
scatter(locC, pekIntC,30,'x','b','r') % find how to make diffrent

%plotting
xlabel('wavenumber (cm^-^1)')
ylabel('Asorbance (a.u');
title(SamplePrefixC + SampleC)
grid on
set(gca, 'xdir','reverse')
xlim([400 4000]); % limits x axis, flipped by above

%% plot 3 - semester 1 gelma
figure()
endVal = 4000;
SampleG = "GMA1";
SamplePrefixG = "FTIR of ";
DataG = readtable('gelma_fail.csv');
xWavenumberG = table2array(DataG(:,1));
yAsorbanceG = table2array(DataG(:,2));
yZeroG = zeros(size([0:1:min(xWavenumberG)-1]));
yZeroPlusYNormalG = vertcat(yZeroG',yAsorbanceG);

% X add trail of numbers to start wavlength at zero
addVectXG = [0:1:min(xWavenumberG)-1]; % the minus 1 is as 399.x is already on
xScaledWaveNG = vertcat(addVectXG',xWavenumberG); % this is the array with blanks before using non - interplated data


% interplated X and Y for peak values - this x does not start at zero!
% we need to make y start at zero, we do this above.
new_x_dataG = linspace(0,max(xScaledWaveNG),4000); %min max values
new_y_dataG = interp1(unique(xScaledWaveNG),yZeroPlusYNormalG,new_x_dataG)


plot(xWavenumberG,yAsorbanceG,'r', 'LineWidth',1) %line ftir plot of real data
hold on


%this is the using interplation by parabaler estimates, takes data starting
%from zero and interplated Y and X as need linier increece
findpeaksInterp(new_y_dataG)
[pekIntG,locG] = findpeaksInterp(new_y_dataG)

[VoidpekInts1,Voidlocs1] = findpeaks(new_y_dataG)

%DiffVectc = pekInt-VoidpekInt
%pdc = fitdist(DiffVectc','normal')


hold on
scatter(locG, pekIntG,30,'x','b','r') % find how to make diffrent

%plotting
xlabel('wavenumber (cm^-^1)')
ylabel('Asorbance (a.u)');
title(SamplePrefixG + SampleG)
grid on
set(gca, 'xdir','reverse')
xlim([400 4000]); % limits x axis, flipped by above

%% plot all peaks against eachother
figure()

hold on
title("")
plot(xWavenumber,yAsorbance+0.15,'r', 'LineWidth',1) % gelma sem 2
plot(xWavenumber,yAsorbanceC+0.055,'b', 'LineWidth',1) % geltine
plot(xWavenumber,yAsorbanceG,'m', 'LineWidth',1) % gelma sem 1
set(gca,'YTickLabel',[])
set(gca, 'xdir','reverse')
legend('GMA2', 'Fish GelS', 'GMA1', 'Location', 'NorthWest');
xlabel('wavenumber (cm^-^1)')
ylabel('Asorbance (a.u)');
set(gca,'XMinorTick','on','YMinorTick','on')
xlim([400 4000]); % limits x axis, flipped by above

%% plot the scattered parts for peaks on top

%% transpose Locational peak vectors for export
% note we can starts test peaks to see if theres diffrence
tGelMaLoc = loc'
tCalLoc = locC'
tGelMaFailLoc = locG'

%% sub plot via tiled lay out
t = tiledlayout(3,1);
nexttile
t.XLabel.String = 'wavenumber (cm^-^1)';
t.YLabel.String = 'Asorbance (a.u)';
t.Title.String = 'FTIR Results'
%t.XLabel.FontSize = 14;
plot(xWavenumber,yAsorbanceC,'r', 'LineWidth',1.5) % geltine
hold on 
title('Fish Gelatin')
scatter(locC, pekIntC,30,'x','b','r')
set(gca,'XMinorTick','on','YMinorTick','on')
xlim([400 4000]); % limits x axis, flipped by above
set(gca, 'xdir','reverse')
hold off
nexttile
plot(xWavenumber,yAsorbance,'r', 'LineWidth',1.5) % gelma sem 2
hold on
title('GelMA Semester 2')
scatter(loc, pekInt,30,'x','b','r')
set(gca,'XMinorTick','on','YMinorTick','on')
xlim([400 4000]); % limits x axis, flipped by above
set(gca, 'xdir','reverse')
hold off
nexttile
plot(xWavenumber,yAsorbanceG,'r', 'LineWidth',1.5) % gelma sem 1
hold on
title('GelMA Semester 1')
scatter(locG, pekIntG,30,'x','b','r')
set(gca,'XMinorTick','on','YMinorTick','on')
xlim([400 4000]); % limits x axis, flipped by above
set(gca, 'xdir','reverse')
hold off
%% plot distrobutions
figure
hold on
plot(pds2)
xlabel('Difference in Peak Position (cm^-^1)')
ylabel('Frequency');
title('')
pds2

ylim([0 50000]); % limits x axis, flipped by above



