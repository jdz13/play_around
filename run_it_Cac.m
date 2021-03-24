%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.


%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar30p10] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p10.timer = toc; SaveVar30p10.comments = "2D OD L scan with KRV = 10. For Ch VI";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p10.mat';
save(filename, 'SaveVar30p10')
cd(oldfolder);
% ------------------------------------------------------------------------