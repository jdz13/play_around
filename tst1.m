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

a = logspace(-2,2,51);

tic
[SaveVar30p11] = search_tool_10p2a_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con,a);
SaveVar30p11.timer = toc; SaveVar30p11.comments = "retesting the a scan - with the correct model";

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p11.mat';
save(filename, 'SaveVar30p11')
cd(oldfolder);