%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,4,5).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = linspace(2,4,3).*1e-2;

%Save outputs
[SaveVar10p5] = search_tool_4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar10p5.timer = toc; SaveVar10p5.comments = "After de-bug, compare with 10p4. Issue in MxBProbeMulti";