%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = 4e-2; % Magnet lengths


%Save outputs
[SaveVar22p1] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p1.timer = toc; SaveVar22p1.comments = "Initial magnet OD scan, 81 point linescan";

%%
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar22p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p2.timer = toc; SaveVar22p2.comments = "Initial magnet length scan, 81 point linescan";

%%
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar22p3] = search_tool_7p3_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p3.timer = toc; SaveVar22p3.comments = "Initial sample radius scan, 31 point linescan. Using new tool adapted for function, will need a validation test.";
%%
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar22p4] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p4.timer = toc; SaveVar22p4.comments = "Start field scan, 51 point linescan";

%%
tic
theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = 4e-2; % Magnet lengths


%Save outputs
[SaveVar22p5] = search_tool_7p3_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p5.timer = toc; SaveVar22p5.comments = "second magnet OD scan, checking 7p3 validation";

%%
tic

Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 5;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,61).*1e-3;
[SaveVar22p6] = search_tool_7p3_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p6.timer = toc; SaveVar22p6.comments = "2nd sample radius scan, 61 point linescan. double resolution. Using new tool adapted for function, will need a validation test.";
