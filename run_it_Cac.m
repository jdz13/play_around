%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

a = inf;

tic
[SaveVar30p8] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con,a);
SaveVar30p8.timer = toc; SaveVar30p8.comments = "testing the sigmoid decay parameter a = inf. Does this give the ideal results? ";

folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p8.mat';
save(filename, 'SaveVar30p8')
cd(oldfolder);
% ------------------------------------------------------------------------

a = logspace(1e-2,1e3,51);

tic
[SaveVar30p9] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con,a);
SaveVar30p9.timer = toc; SaveVar30p9.comments = "testing the sigmoid decay parameter a, does it converge to ideal results? ";

folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p9.mat';
save(filename, 'SaveVar30p9')
cd(oldfolder);