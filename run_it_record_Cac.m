%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

tic

theta = linspace(0,pi/2,91); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5,2]; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = [2,3,4]*1e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar1.varst, SaveVar1.SWres,SaveVar1.Bset,SaveVar1.FWHMres,SaveVar1.ind1res,SaveVar1.ind2res, SaveVar1.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar1.timer = toc; SaveVar1.comments = "Inital test to see if we have a working coherent code";


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
[SaveVar2.varst, SaveVar2.SWres,SaveVar2.Bset,SaveVar2.FWHMres,SaveVar2.ind1res,SaveVar2.ind2res, SaveVar2.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar2.timer = toc; SaveVar2.comments = "Starting YZ convergence testing, 2xY";

Yin = linspace(-1e-3, 1e-3,201); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z
tic
%Save outputs
[SaveVar3.varst, SaveVar3.SWres,SaveVar3.Bset,SaveVar3.FWHMres,SaveVar3.ind1res,SaveVar3.ind2res, SaveVar3.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar3.timer = toc; SaveVar3.comments = "YZ convergence testing, 4xY";


Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,101); % Probe plane points in Z 
tic
%Save outputs
[SaveVar4.varst, SaveVar4.SWres,SaveVar4.Bset,SaveVar4.FWHMres,SaveVar4.ind1res,SaveVar4.ind2res, SaveVar4.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar4.timer = toc; SaveVar4.comments = "YZ convergence testing, 2xZ";

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,201); % Probe plane points in Z 
tic
%Save outputs
[SaveVar5.varst, SaveVar5.SWres,SaveVar5.Bset,SaveVar5.FWHMres,SaveVar5.ind1res,SaveVar5.ind2res, SaveVar5.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar5.timer = toc; SaveVar5.comments = "YZ convergence testing, 4xZ";

%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%               Note, all these above used a 101 element line
%                           Innefective data
%                        This also includes SV1
%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

tic

theta = linspace(0,pi/2,91); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5,2]; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = [2,3,4]*1e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar1p1.varst, SaveVar1p1.SWres,SaveVar1p1.Bset,SaveVar1p1.FWHMres,SaveVar1p1.ind1res,SaveVar1p1.ind2res, SaveVar1p1.MxB, SaveVar1p1.SH0] = Copy_of_search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar1p1.timer = toc; SaveVar1p1.comments = "Rerun 1.1, but this time with 10001 probe points in Z, and saving SH0 value";

tic
%Save outputs
[SaveVar1p2.varst, SaveVar1p2.SWres,SaveVar1p2.Bset,SaveVar1p2.FWHMres,SaveVar1p2.ind1res,SaveVar1p2.ind2res, SaveVar1p2.MxB, SaveVar1p2.SH0] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar1p2.timer = toc; SaveVar1p2.comments = "Rerun 1.2, to test the effect of using cubic probe term";


%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%               Note, SV1p2 didnt actually run
%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

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
[SaveVar2p1.varst, SaveVar2p1.SWres,SaveVar2p1.Bset,SaveVar2p1.FWHMres,SaveVar2p1.ind1res,SaveVar2p1.ind2res, SaveVar2p1.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar2p1.timer = toc; SaveVar2p1.comments = "Starting YZ convergence testing, 2xY";


Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,101); % Probe plane points in Z 
tic
%Save outputs
[SaveVar4p1.varst, SaveVar4p1.SWres,SaveVar4p1.Bset,SaveVar4p1.FWHMres,SaveVar4p1.ind1res,SaveVar4p1.ind2res, SaveVar4p1.MxB] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar4p1.timer = toc; SaveVar4p1.comments = "YZ convergence testing, 2xZ";

%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%            Note, accidentally used the non-linear probe line
%              Will in fact be a nice test (coincidentally!)
%'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

%%

% God I was bad here, I'll sort it out.

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
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

tic

theta = linspace(0,pi/2,91); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5,2]; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = [2,3,4]*1e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,101); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar4p2] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar4p2.timer = toc; SaveVar4p2.comments = "Looking at 2xZ again, this time with linear, 10001 point probe line";
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2, 181); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5,2]; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = [2,3,4]*1e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar1p2] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar1p2.timer = toc; SaveVar1p2.comments = "Same as before, 10001 probe in z, double theta rsolution";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,1081); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 2.5; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar6p0] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar6p0.timer = toc; SaveVar6p0.comments = "Increasing angular resolution (1081) heavily to probe relationship";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,5401); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 2.5; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar6p1] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar6p1.timer = toc; SaveVar6p1.comments = "Increasing angular resolution (5401) heavily to probe relationship";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,90001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 2.5; % Key ratio values, how strict of a condition do we want 
RES = [0.15,0.2,0.25,0.3,0.35,0.4]; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar6p2] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar6p2.timer = toc; SaveVar6p2.comments = "Increasing angular resolution (90001) heavily to probe relationship";


%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5]; % Key ratio values, how strict of a condition do we want 
RES = 0.2; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 0,26); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar7p1] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar7p1.timer = toc; SaveVar7p1.comments = "Testing the symmetry benefit. Shorter param space. 9001 theta";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5,4,3,2.5]; % Key ratio values, how strict of a condition do we want 
RES = 0.2; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51); % Probe plane points in Z 

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

%Save outputs
[SaveVar7p2] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar7p2.timer = toc; SaveVar7p2.comments = "Testing the symmetry benefit. Shorter param space. 9001 theta, using same parameters as 7p1 but old code. For comparison";

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

%Save outputs
[SaveVar8p1] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar8p1.timer = toc; SaveVar8p1.comments = "Running the code again to check the V2 script, this one is using V1 as a base data set for comparison";

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 0, 26); % Probe plane points in Z 

%Save outputs
[SaveVar8p2] = search_tool_2_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar8p2.timer = toc; SaveVar8p2.comments = "Checking the V2 script, this is using the redefined Zin using new linspace to 0";

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

%Save outputs
[SaveVar8p3] = search_tool_2_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con);
SaveVar8p3.timer = toc; SaveVar8p3.comments = "Checking the V2 script, this is using Yin(1:26), so no redefinition and should be no FPP error";


%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

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
[SaveVar10p6] = search_tool_4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar10p6.timer = toc; SaveVar10p6.comments = "Proper code running, with larger information space. Last stop before toroidal integration";


%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

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
[SaveVar11p1] = search_tool_5_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar11p1.timer = toc; SaveVar11p1.comments = "Using the new search code, which implements toroids. Will look to run coherent story off back of this";


[SaveVar11p1.propkeepers,SaveVar11p1.plt] = homog_L_PM_plott_toroid(SaveVar11p1,2);

saved_var_plotter_V4_comparison (SaveVar11p1,21,SaveVar11p1.MxB);


%%

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
[SaveVar12p1] = search_tool_6_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, 5);
SaveVar12p1.timer = toc; SaveVar12p1.comments = "Same as SV11p1 though this time incorporating the sigmoidal switching dependence";

%[SaveVar12p1.propkeepers,SaveVar12p1.plt] = homog_L_PM_plott_toroid(SaveVar12p1,2);

saved_var_plotter_V4_comparison (SaveVar12p1,22,SaveVar12p1.MxB);

%%

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

%Lengths = linspace(2,4,3).*1e-2;
%pm_cl = linspace(2,4,3).*1e-2;

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = [0.3,0.2]; % Start field values. 

pm_cl = linspace(2,4,11).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = linspace(2,4.2,12).*1e-2;

%Save outputs
[SaveVar12p2] = search_tool_6_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, 5);
SaveVar12p2.timer = toc; SaveVar12p2.comments = "Same as 12p1 (toroid with sigmmoid) but this time different start fields";

%[SaveVar12p1.propkeepers,SaveVar12p1.plt] = homog_L_PM_plott_toroid(SaveVar12p1,2);

saved_var_plotter_V4_comparison (SaveVar12p2,23,SaveVar12p2.MxB);

%%

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

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
[SaveVar12p3] = search_tool_6_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, 0);
SaveVar12p3.timer = toc; SaveVar12p3.comments = "Testing whether we get the same results as 11p1 if a = inf";

saved_var_plotter_V4_comparison (SaveVar12p3,24,SaveVar12p3.MxB);


%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [2.5,3,4,5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4,0.3,0.2]; % Start field values. 

pm_cl = linspace(2,4,5).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = linspace(2,4.5,6).*1e-2; % Magnet lengths


%Save outputs
[SaveVar21p1] = search_tool_7p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar21p1.timer = toc; SaveVar21p1.comments = "testing again for final thesis results, simplified code (7p1) with no sigmoid. Initial tests.";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

clear

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [2.5,3,4,5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4,0.3,0.2]; % Start field values. 

pm_cl = linspace(2,4,5).*1e-2; % Magnet outer diameters.

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

Lengths = linspace(2,4.5,6).*1e-2; % Magnet lengths


%Save outputs
[SaveVar21p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar21p2.timer = toc; SaveVar21p2.comments = "testing again for final thesis results, simplified code (7p1) with no sigmoid. Initial tests.";


%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%% random addition, for more detail (might as well run overnight!)
tic 
Yin200 = Md200.pureliney; Zin200 = Md200.purelinez;
Xin200 = Md200.purelinex;
[BOD200] = new3Dbanditunitvector(Xin200,Yin200,Zin200,L./2,R./2,M);
[BIB200] = new3Dbanditunitvector(Xin200,Yin200,Zin200,L./2,IB./2,M);
Xu200 = BOD200(:,:,:,1,1) - BIB200(:,:,:,1,1); 
Yu200 = BOD200(:,:,:,1,2) - BIB200(:,:,:,1,2);
toc
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

Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar22p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p2.timer = toc; SaveVar22p2.comments = "Initial magnet length scan, 81 point linescan";
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar22p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p2.timer = toc; SaveVar22p2.comments = "Initial sample radius scan, 31 point linescan";