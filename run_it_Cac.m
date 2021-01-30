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
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.05,1,21).*1e-3;
[SaveVar22p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p2.timer = toc; SaveVar22p2.comments = "Initial sample radius scan, 51 point linescan";

