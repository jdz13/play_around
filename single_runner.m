%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 6.*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = 2.*1e-2; % Magnet lengths


%Save outputs
[tester2] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
tester2.timer = toc; tester2.comments = "seeing what happens for single values";
%
[tester4] = search_tool_Caciagli_single_8p1p1_allatonce(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
tester4.timer = toc; tester4.comments = "seeing what happens for single values all at once";
