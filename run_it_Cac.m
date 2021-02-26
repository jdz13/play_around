%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 6.*1e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

IB = 6e-3; % inner diameter (bore) [m]

min_separation = linspace(50,500,46).*1e-4; % minimum separation [T]

tic
[SaveVar26p1] = search_tool_9p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad, IB ,con, min_separation);
SaveVar26p1.timer = toc; SaveVar26p1.comments = "Seeing if we can cpture information on changing minimum separation - in the idealised code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV26p1.mat';
save(filename, 'SaveVar26p1')
cd(oldfolder);
% ------------------------------------------------------------------------

IB = linspace(2e-3,40e-3, 39); % inner diameter (bore) [m]

min_separation = 50.*1e-4; % minimum separation [T]

tic
[SaveVar26p2] = search_tool_9p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad, IB ,con, min_separation);
SaveVar26p2.timer = toc; SaveVar26p2.comments = "Seeing if we can cpture information on IB - in the idealised code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV26p2.mat';
save(filename, 'SaveVar26p2')
cd(oldfolder);
% ------------------------------------------------------------------------