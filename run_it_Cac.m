%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar31p1] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p1.timer = toc; SaveVar31p1.comments = "Running the ideal study - with no suppression (working range or minimum separation). OD study";

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
% folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV31p1.mat';
save(filename, 'SaveVar31p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar31p2] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p2.timer = toc; SaveVar31p2.comments = "Running the ideal study - with no suppression (working range or minimum separation). L study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p2.mat';
save(filename, 'SaveVar31p2')
cd(oldfolder);
%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar31p3] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p3.timer = toc; SaveVar31p3.comments = "Running the ideal study - with no suppression (working range or minimum separation). s_rad study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p3.mat';
save(filename, 'SaveVar31p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar31p4] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p4.timer = toc; SaveVar31p4.comments = "Running the ideal study - with no suppression (working range or minimum separation). B_0 study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p4.mat';
save(filename, 'SaveVar31p4')
cd(oldfolder);
% ------------------------------------------------------------------------
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar31p5] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p5.timer = toc; SaveVar31p5.comments = "Running the ideal study - with no suppression (working range or minimum separation). s_rad study - double resolution";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p5.mat';
save(filename, 'SaveVar31p5')
cd(oldfolder);
% ------------------------------------------------------------------------

% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar31p7] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p7.timer = toc; SaveVar31p7.comments = "Running the ideal study - with no suppression (working range or minimum separation). KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p7.mat';
save(filename, 'SaveVar31p7')
cd(oldfolder);
% ------------------------------------------------------------------------

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar31p6] = search_tool_11p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar31p6.timer = toc; SaveVar31p6.comments = "Running the ideal study - with no suppression (working range or minimum separation). 2D OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV31p6.mat';
save(filename, 'SaveVar31p6')
cd(oldfolder);

%% -----------------------------------------------------------------------