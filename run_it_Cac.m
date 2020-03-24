%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

tic

theta = linspace(0,pi/2,91); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5,2]; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = [2,3,4]*1e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar2p2] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar2p2.timer = toc; SaveVar2p2.comments = "Looking at this again, this time with linear, 10001 point probe line";

