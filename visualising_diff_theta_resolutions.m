%% A script to demonstrate the effect of having different theta resolutions, can be run on it's own.

clear

tic
thetan = [9001, 901, 91];
n = 1;

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.2; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 0,26); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
theta = linspace(0,pi/2,thetan(n)); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.
[DT1] = search_tool_2_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
DT1.timer = toc; 
n = n+1;

theta = linspace(0,pi/2,thetan(n));
[DT2] = search_tool_2_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
DT2.timer = toc; 
n = n+1;

theta = linspace(0,pi/2,thetan(n));
[DT3] = search_tool_2_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
DT3.timer = toc;
n = n+1;


%%
figure(121)
plot(rad2deg(DT1.varst.theta), DT1.NVC(1,:), rad2deg(DT2.varst.theta), DT2.NVC(1,:), rad2deg(DT3.varst.theta), DT3.NVC(1,:));
xlim([13,25])
   legendCell = cellstr(num2str(thetan', '%-g point theta resolution')); 
   legend(legendCell, 'Location', 'Southwest')
xlabel 'Degrees rotation [deg]'
ylabel 'Normalised area above switching field'
title 'Visualising the effect of different theta resolutions'


text(20,0.85, compose("High resolution \nTheta number: " + size(DT1.varst.theta,2) + "\nFWHM: " + rad2deg(DT1.FWHMres(2)) + " [deg]\nMax location: " + rad2deg(DT1.MLOC(1)) + " [deg] \nNext optimal channel: " + DT1.swinit(1) + " [T]"))
text(20,0.60, compose("Middle resolution \nTheta number: " + size(DT2.varst.theta,2) + "\nFWHM: " + rad2deg(DT2.FWHMres(2)) + " [deg]\nMax location: " + rad2deg(DT2.MLOC(1)) + " [deg] \nNext optimal channel: " + DT2.swinit(1) + " [T]"))
text(20,0.35, compose("Lower resolution \nTheta number: " + size(DT3.varst.theta,2) + "\nFWHM: " + rad2deg(DT3.FWHMres(2)) + " [deg]\nMax location: " + rad2deg(DT3.MLOC(1)) + " [deg] \nNext optimal channel: " + DT3.swinit(1) + " [T]"))
