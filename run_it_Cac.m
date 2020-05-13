%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = [0.3,0.2]; % Start field values. 

%pm_cl = linspace(2,4,11).*1e-2; % Magnet outer diameters.
pm_cl = 4e-2;

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

%Lengths = linspace(2,4.2,12).*1e-2;
Lengths = 4e-2;

inputpcs = [0,0.2,0.5,0.8,1,2,5,8,10,15,20,25];

%Save outputs
[SaveVar12p7] = search_tool_6p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, inputpcs);
SaveVar12p7.timer = toc; SaveVar12p7.comments = "Same as 12p1 (toroid with sigmmoid) but this time different start fields";
