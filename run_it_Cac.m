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
[SaveVar29p1] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p1.timer = toc; SaveVar29p1.comments = "Checking for artificial supression by working range in OD study";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV29p1.mat';
save(filename, 'SaveVar29p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar29p2] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p2.timer = toc; SaveVar29p2.comments = "Checking for artificial supression by working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p2.mat';
save(filename, 'SaveVar29p2')
cd(oldfolder);
%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar29p3] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p3.timer = toc; SaveVar29p3.comments = "Checking for artificial supression by working range in s_rad study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p3.mat';
save(filename, 'SaveVar29p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar29p4] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p4.timer = toc; SaveVar29p4.comments = "Checking for artificial supression by working range in B_0 study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p4.mat';
save(filename, 'SaveVar29p4')
cd(oldfolder);
% ------------------------------------------------------------------------
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar29p5] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p5.timer = toc; SaveVar29p5.comments = "Checking for artificial supression by working range in s_rad study - double resolution";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p5.mat';
save(filename, 'SaveVar29p5')
cd(oldfolder);
% ------------------------------------------------------------------------
%%


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
[SaveVar30p1] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p1.timer = toc; SaveVar30p1.comments = "Checking for artificial supression by working range in OD study";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p1.mat';
save(filename, 'SaveVar30p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar30p2] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p2.timer = toc; SaveVar30p2.comments = "Checking for artificial supression by working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p2.mat';
save(filename, 'SaveVar30p2')
cd(oldfolder);
%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar30p3] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p3.timer = toc; SaveVar30p3.comments = "Checking for artificial supression by working range in s_rad study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p3.mat';
save(filename, 'SaveVar30p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar30p4] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p4.timer = toc; SaveVar30p4.comments = "Checking for artificial supression by working range in B_0 study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p4.mat';
save(filename, 'SaveVar30p4')
cd(oldfolder);
% ------------------------------------------------------------------------
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar30p5] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p5.timer = toc; SaveVar30p5.comments = "Checking for artificial supression by working range in s_rad study - double resolution";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p5.mat';
save(filename, 'SaveVar30p5')
cd(oldfolder);
% ------------------------------------------------------------------------
%%


%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar29p6] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p6.timer = toc; SaveVar29p6.comments = "same 2D scan as used before but removed working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p6.mat';
save(filename, 'SaveVar29p6')
cd(oldfolder);
% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar29p7] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p7.timer = toc; SaveVar29p7.comments = "Checking for artificial supression by working range in KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p7.mat';
save(filename, 'SaveVar29p7')
cd(oldfolder);
% ------------------------------------------------------------------------

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar30p6] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p6.timer = toc; SaveVar30p6.comments = "same 2D scan as used before but removed working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p6.mat';
save(filename, 'SaveVar30p6')
cd(oldfolder);
% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar30p7] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p7.timer = toc; SaveVar30p7.comments = "Checking for artificial supression by working range in KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p7.mat';
save(filename, 'SaveVar30p7')
cd(oldfolder);
% ------------------------------------------------------------------------
