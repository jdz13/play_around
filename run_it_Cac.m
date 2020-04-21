%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.


tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5]; % Key ratio values, how strict of a condition do we want 
RES = 0.2; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin; % Probe plane points in Z 

% 
% %Save outputs
% [SaveVar9p1] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
% SaveVar9p1.timer = toc; SaveVar9p1.comments = "Running the code again to check the addition of L into the loops, this one is using V3 as a base data set for comparison";

Lengths = pm_cl;

%Save outputs
[SaveVar9p2] = search_tool_3_Caciagli(KRV,RES,pm_cl,Lengths, theta,Yin,Zin,s_rad,con);
SaveVar9p2.timer = toc; SaveVar9p2.comments = "Running the code again to check the addition of L into the loops, this one is using V3 as a base data set for comparison";


Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

%Save outputs
[SaveVar9p3] = search_tool_4_Caciagli(KRV,RES,pm_cl,Lengths, theta,Yin,Zin,s_rad,con);
SaveVar9p3.timer = toc; SaveVar9p3.comments = "Checking the V2 script, this is using Yin(1:26), so no redefinition and should be no FPP error";
