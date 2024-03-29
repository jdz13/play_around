% ------------------------------------------------------------------------
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

%%
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar34p2] = search_tool_12p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar34p2.timer = toc; SaveVar34p2.comments = "L study. 'Ideal' data. Minimum field applied, but not working range or minimum separation.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV34p2.mat';
save(filename, 'SaveVar34p2')
cd(oldfolder);
%% ------------------------------------------------------------------------
pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

tic
[SaveVar34p1] = search_tool_12p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar34p1.timer = toc; SaveVar34p1.comments = "OD study. 'Ideal' data. Minimum field applied, but not working range or minimum separation.";

folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV34p1.mat';
save(filename, 'SaveVar34p1')
cd(oldfolder);

%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar34p3] = search_tool_12p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar34p3.timer = toc; SaveVar34p3.comments = "s_rad study. 'Ideal' data. Minimum field applied, but not working range or minimum separation.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV34p3.mat';
save(filename, 'SaveVar34p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar34p4] = search_tool_12p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar34p4.timer = toc; SaveVar34p4.comments = "B_0 study. 'Ideal' data. Minimum field applied, but not working range or minimum separation.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV34p4.mat';
save(filename, 'SaveVar34p4')
cd(oldfolder);
% ------------------------------------------------------------------------

% ------------------------------------------------------------------------
% KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
% pm_cl = 6e-2; % Magnet outer diameters.
% Lengths = 2e-2; % Magnet lengths
% 
% tic
% [SaveVar34p7] = search_tool_12p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
% SaveVar34p7.timer = toc; SaveVar34p7.comments = "KRV study. 'Ideal' data. Minimum field applied, but not working range or minimum separation.";
% 
% [oldfolder] = cd(folpath);
% filename = 'matlab_SV34p7.mat';
% save(filename, 'SaveVar34p7')
% cd(oldfolder);
% % ------------------------------------------------------------------------
% 
