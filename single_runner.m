%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 2.*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = 4.5.*1e-2; % Magnet lengths


%Save outputs
[tester4] = search_tool_Caciagli_single_7p2(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);

tester3.timer = toc; tester3.comments = "seeing what happens for single values all at once";
