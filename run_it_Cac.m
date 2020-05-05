%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

%Lengths = linspace(2,4,3).*1e-2;
%pm_cl = linspace(2,4,3).*1e-2;

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,4,11).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = linspace(2,4.2,12).*1e-2;

%Save outputs
[SaveVar12p1] = search_tool_6_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar12p1.timer = toc; SaveVar12p1.comments = "Using the new search code, which implements toroids. Will look to run coherent story off back of this";

%[SaveVar12p1.propkeepers,SaveVar12p1.plt] = homog_L_PM_plott_toroid(SaveVar12p1,2);

saved_var_plotter_V4_comparison (SaveVar12p1,22,SaveVar12p1.MxB);