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
[SaveVar27p1] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p1.timer = toc; SaveVar27p1.comments = "Capturing the same data as in 22p1 but on new code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV27p1.mat';
save(filename, 'SaveVar27p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar27p2] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p2.timer = toc; SaveVar27p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p2.mat';
save(filename, 'SaveVar27p2')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar27p3] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p3.timer = toc; SaveVar27p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p3.mat';
save(filename, 'SaveVar27p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar27p4] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p4.timer = toc; SaveVar27p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p4.mat';
save(filename, 'SaveVar27p4')
cd(oldfolder);
% ----------------


%%
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar27p5] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p5.timer = toc; SaveVar27p5.comments = "2nd sample radius scan, 31 point linescan. double resolution.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p5.mat';
save(filename, 'SaveVar27p5')
cd(oldfolder);


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
[SaveVar27p6] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p6.timer = toc; SaveVar27p6.comments = "same 2D scan as used before but new model";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p6.mat';
save(filename, 'SaveVar27p6')
cd(oldfolder);


%%

KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar27p7] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p7.timer = toc; SaveVar27p7.comments = "KRV linescan - 33 values - 3 to 35";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p7.mat';
save(filename, 'SaveVar27p7')
cd(oldfolder);