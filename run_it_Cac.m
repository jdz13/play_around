%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar24p1] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar24p1.timer = toc; SaveVar24p1.comments = "Capturing the same data as in 22p1 but on new code";

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
[oldfolder] = cd(folpath);
filename = 'matlab_SV24p1.mat';
save(filename, 'SaveVar24p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar24p2] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar24p2.timer = toc; SaveVar24p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p2.mat';
save(filename, 'SaveVar24p2')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar24p3] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p3.timer = toc; SaveVar24p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p3.mat';
save(filename, 'SaveVar24p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar24p4] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p4.timer = toc; SaveVar24p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p4.mat';
save(filename, 'SaveVar24p4')
cd(oldfolder);
% ------------------------------------------------------------------------

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar25p1] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p1.timer = toc; SaveVar25p1.comments = "Capturing the same data as in 23p1 but on new code";

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
[oldfolder] = cd(folpath);
filename = 'matlab_SV25p1.mat';
save(filename, 'SaveVar25p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar25p2] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p2.timer = toc; SaveVar25p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p2.mat';
save(filename, 'SaveVar25p2')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar25p3] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar25p3.timer = toc; SaveVar25p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p3.mat';
save(filename, 'SaveVar25p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar25p4] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar25p4.timer = toc; SaveVar25p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p4.mat';
save(filename, 'SaveVar25p4')
cd(oldfolder);
% ------------------------------------------------------------------------


