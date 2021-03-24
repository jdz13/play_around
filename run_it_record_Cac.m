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


tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar22p2] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p2.timer = toc; SaveVar22p2.comments = "Initial magnet length scan, 81 point linescan";


tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar22p3] = search_tool_7p3_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p3.timer = toc; SaveVar22p3.comments = "Initial sample radius scan, 31 point linescan. Using new tool adapted for function, will need a validation test.";

tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar22p4] = search_tool_7p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p4.timer = toc; SaveVar22p4.comments = "Start field scan, 51 point linescan";


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
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar22p7] = search_tool_7p3_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar22p7.timer = toc; SaveVar22p7.comments = "2D OD and L scan. Increased resolution to 21 values, half cm separation. 441 iterations, should take ~11hrs";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

pm_cl = linspace(2e-2, 10e-2, 81); % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar23p1] = search_tool_7p4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar23p1.timer = toc; SaveVar23p1.comments = "Starting the non-idealised results chapter. Running the same OD scan as previously, but with the 5% sigmoid";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

Lengths = linspace(2e-2, 10e-2, 81); % Magnet outer diameters.
pm_cl = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar23p2] = search_tool_7p4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar23p2.timer = toc; SaveVar23p2.comments = "Starting the non-idealised results chapter. Running the same L scan as previously, but with the 5% sigmoid";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = [5]; % Key ratio values, how strict of a condition do we want 
RES = [0.4]; % Start field values. 

Lengths = 4e-2; % Magnet outer diameters.
pm_cl = 4e-2; % Magnet lengths

s_rad = linspace(0.25,1,31).*1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar23p3] = search_tool_7p4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar23p3.timer = toc; SaveVar23p3.comments = "Starting the non-idealised results chapter. Running the same s_rad scan as previously, but with the 5% sigmoid";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = linspace(0.6,0.1,51); % Start field values. 

Lengths = 4e-2; % Magnet outer diameters.
pm_cl = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar23p4] = search_tool_7p4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar23p4.timer = toc; SaveVar23p4.comments = "Starting the non-idealised results chapter. Running the same start field scan as previously, but with the 5% sigmoid";

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar23p5] = search_tool_7p4_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar23p5.timer = toc; SaveVar23p5.comments = "same 2D scan as in idealised model but with the 5% sigmoid";

%%
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar24p1] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p1.timer = toc; SaveVar24p1.comments = "Capturing the same data as in 22p1 but on new code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV24p1.mat';
save(filename, 'SaveVar24p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar24p2] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p2.timer = toc; SaveVar24p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p2.mat';
save(filename, 'SaveVar24p2')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar24p3] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p3.timer = toc; SaveVar24p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p3.mat';
save(filename, 'SaveVar24p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar24p4] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p4.timer = toc; SaveVar24p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p4.mat';
save(filename, 'SaveVar24p4')
cd(oldfolder);
% ------------------------------------------------------------------------

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar25p1] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p1.timer = toc; SaveVar25p1.comments = "Capturing the same data as in 23p1 but on new code";
%%
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV25p1.mat';
save(filename, 'SaveVar25p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar25p2] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p2.timer = toc; SaveVar25p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p2.mat';
save(filename, 'SaveVar25p2')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar25p3] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p3.timer = toc; SaveVar25p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p3.mat';
save(filename, 'SaveVar25p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar25p4] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p4.timer = toc; SaveVar25p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p4.mat';
save(filename, 'SaveVar25p4')
cd(oldfolder);
% ------------------------------------------------------------------------
%%
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar24p5] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p5.timer = toc; SaveVar24p5.comments = "2nd sample radius scan, 31 point linescan. double resolution.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p5.mat';
save(filename, 'SaveVar24p5')
cd(oldfolder);

%%

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar24p6] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p6.timer = toc; SaveVar24p6.comments = "same 2D scan as used before but new model";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p6.mat';
save(filename, 'SaveVar24p6')
cd(oldfolder);

%%
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar25p5] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p5.timer = toc; SaveVar25p5.comments = "2nd sample radius scan, 31 point linescan. double resolution.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p5.mat';
save(filename, 'SaveVar25p5')
cd(oldfolder);

%%

tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar25p6] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p6.timer = toc; SaveVar25p6.comments = "same 2D scan as used before but new model";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p6.mat';
save(filename, 'SaveVar25p6')
cd(oldfolder);

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar24p7] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar24p7.timer = toc; SaveVar24p7.comments = "KRV linescan - 33 values - 3 to 35";

[oldfolder] = cd(folpath);
filename = 'matlab_SV24p7.mat';
save(filename, 'SaveVar24p7')
cd(oldfolder);

tic
[SaveVar25p7] = search_tool_8p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc);
SaveVar25p7.timer = toc; SaveVar25p7.comments = "KRV linescan - 33 values - 3 to 35";

[oldfolder] = cd(folpath);
filename = 'matlab_SV25p7.mat';
save(filename, 'SaveVar25p7')
cd(oldfolder);

%%

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 6.*1e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

IB = 6e-3; % inner diameter (bore) [m]

min_separation = linspace(50,500,46).*1e-4; % minimum separation [T]

tic
[SaveVar26p1] = search_tool_9p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad, IB ,con, min_separation);
SaveVar26p1.timer = toc; SaveVar26p1.comments = "Seeing if we can cpture information on changing minimum separation - in the idealised code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV26p1.mat';
save(filename, 'SaveVar26p1')
cd(oldfolder);
% ------------------------------------------------------------------------
%%
% IB = linspace(2e-3,40e-3, 39); % inner diameter (bore) [m]
% 
% min_separation = 50.*1e-4; % minimum separation [T]
% 
% tic
% [SaveVar26p2] = search_tool_9p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad, IB ,con, min_separation);
% SaveVar26p2.timer = toc; SaveVar26p2.comments = "Seeing if we can cpture information on IB - in the idealised code";
% 
% % folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
% folpath = 'C:\Users\Jake\Documents\MATLAB';
% [oldfolder] = cd(folpath);
% filename = 'matlab_SV26p2.mat';
% save(filename, 'SaveVar26p2')
% cd(oldfolder);
% ------------------------------------------------------------------------

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar27p1] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p1.timer = toc; SaveVar27p1.comments = "Capturing the same data as in 22p1 but on new code";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV27p1.mat';
save(filename, 'SaveVar27p1')
cd(oldfolder);

tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar27p2] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p2.timer = toc; SaveVar27p2.comments = "Capturing the same data as in 22p2 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p2.mat';
save(filename, 'SaveVar27p2')
cd(oldfolder);

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar27p3] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p3.timer = toc; SaveVar27p3.comments = "Capturing the same data as in 22p3 but on new code";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p3.mat';
save(filename, 'SaveVar27p3')
cd(oldfolder);

tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar27p4] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p4.timer = toc; SaveVar27p4.comments = "Start field scan, 51 point linescan";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p4.mat';
save(filename, 'SaveVar27p4')
cd(oldfolder);

Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar27p5] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p5.timer = toc; SaveVar27p5.comments = "2nd sample radius scan, 31 point linescan. double resolution.";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p5.mat';
save(filename, 'SaveVar27p5')
cd(oldfolder);


tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar27p6] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p6.timer = toc; SaveVar27p6.comments = "same 2D scan as used before but new model";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p6.mat';
save(filename, 'SaveVar27p6')
cd(oldfolder);


KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar27p7] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar27p7.timer = toc; SaveVar27p7.comments = "KRV linescan - 33 values - 3 to 35";

[oldfolder] = cd(folpath);
filename = 'matlab_SV27p7.mat';
save(filename, 'SaveVar27p7')
cd(oldfolder);

%%
%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear
%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar28p1] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p1.timer = toc; SaveVar28p1.comments = "Checking for artificial supression by working range in OD study";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV28p1.mat';
save(filename, 'SaveVar28p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar28p2] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p2.timer = toc; SaveVar28p2.comments = "Checking for artificial supression by working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p2.mat';
save(filename, 'SaveVar28p2')
cd(oldfolder);
%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar28p3] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p3.timer = toc; SaveVar28p3.comments = "Checking for artificial supression by working range in s_rad study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p3.mat';
save(filename, 'SaveVar28p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar28p4] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p4.timer = toc; SaveVar28p4.comments = "Checking for artificial supression by working range in B_0 study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p4.mat';
save(filename, 'SaveVar28p4')
cd(oldfolder);
% ------------------------------------------------------------------------
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar28p5] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p5.timer = toc; SaveVar28p5.comments = "Checking for artificial supression by working range in s_rad study - double resolution";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p5.mat';
save(filename, 'SaveVar28p5')
cd(oldfolder);
% ------------------------------------------------------------------------
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar28p6] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p6.timer = toc; SaveVar28p6.comments = "same 2D scan as used before but removed working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p6.mat';
save(filename, 'SaveVar28p6')
cd(oldfolder);
% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar28p7] = search_tool_10p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar28p7.timer = toc; SaveVar28p7.comments = "Checking for artificial supression by working range in KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV28p7.mat';
save(filename, 'SaveVar28p7')
cd(oldfolder);
% ------------------------------------------------------------------------
%%

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,81).*1e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar30p1] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p1.timer = toc; SaveVar30p1.comments = "Checking for artificial supression by working range in OD study";

% folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V';
folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p1.mat';
save(filename, 'SaveVar30p1')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = linspace(2,10,81).*1e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
[SaveVar30p2] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p2.timer = toc; SaveVar30p2.comments = "Checking for artificial supression by working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p2.mat';
save(filename, 'SaveVar30p2')
cd(oldfolder);
%% ------------------------------------------------------------------------

tic
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar30p3] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p3.timer = toc; SaveVar30p3.comments = "Checking for artificial supression by working range in s_rad study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p3.mat';
save(filename, 'SaveVar30p3')
cd(oldfolder);
% ------------------------------------------------------------------------
tic
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3;
RES = linspace(0.6,0.1,51); % Start field values. 
[SaveVar30p4] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p4.timer = toc; SaveVar30p4.comments = "Checking for artificial supression by working range in B_0 study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p4.mat';
save(filename, 'SaveVar30p4')
cd(oldfolder);
% ------------------------------------------------------------------------
Yin = linspace(-1e-3, 1e-3,101); % Probe plane points in Y 
Zin = Yin(1:51);
KRV = 10;
RES = 0.4;
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = linspace(0.25,1,31).*1e-3;
[SaveVar30p5] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p5.timer = toc; SaveVar30p5.comments = "Checking for artificial supression by working range in s_rad study - double resolution";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p5.mat';
save(filename, 'SaveVar30p5')
cd(oldfolder);
% ------------------------------------------------------------------------
%%


%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar29p6] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p6.timer = toc; SaveVar29p6.comments = "same 2D scan as used before but removed working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p6.mat';
save(filename, 'SaveVar29p6')
cd(oldfolder);
% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar29p7] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p7.timer = toc; SaveVar29p7.comments = "Checking for artificial supression by working range in KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p7.mat';
save(filename, 'SaveVar29p7')
cd(oldfolder);
% ------------------------------------------------------------------------

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
sigmoid_pc = 5; 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar30p6] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p6.timer = toc; SaveVar30p6.comments = "same 2D scan as used before but removed working range in OD study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p6.mat';
save(filename, 'SaveVar30p6')
cd(oldfolder);
% ------------------------------------------------------------------------
KRV = linspace(3,35,33); % Key ratio values, how strict of a condition do we want 
pm_cl = 6e-2; % Magnet outer diameters.
Lengths = 2e-2; % Magnet lengths

tic
[SaveVar30p7] = search_tool_10p2_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar30p7.timer = toc; SaveVar30p7.comments = "Checking for artificial supression by working range in KRV study";

[oldfolder] = cd(folpath);
filename = 'matlab_SV30p7.mat';
save(filename, 'SaveVar30p7')
cd(oldfolder);
% ------------------------------------------------------------------------

%% Run it. Script for controlling entry variables into the new Caciagli code, ready for analysis.

% clear

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = 4e-2; % Magnet outer diameters.
Lengths = 4e-2; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

a = inf;

tic
[SaveVar30p8] = search_tool_10p2a_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con,a);
SaveVar30p8.timer = toc; SaveVar30p8.comments = "testing the sigmoid decay parameter a = inf. Does this give the ideal results? ";

folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p8.mat';
save(filename, 'SaveVar30p8')
cd(oldfolder);
% ------------------------------------------------------------------------
%%
a = logspace(-2,3,51);

tic
[SaveVar30p9] = search_tool_10p2a_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con,a);
SaveVar30p9.timer = toc; SaveVar30p9.comments = "testing the sigmoid decay parameter a, does it converge to ideal results? ";

folpath = 'C:\Users\Jake\Documents\MATLAB';
[oldfolder] = cd(folpath);
filename = 'matlab_SV30p9.mat';
save(filename, 'SaveVar30p9')
cd(oldfolder);

%%
tic

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.

KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

pm_cl = linspace(2,10,21).*1e-2; % Magnet outer diameters.
Lengths = pm_cl; % Magnet lengths

s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 

Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 

tic
[SaveVar29p10] = search_tool_8p1_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
SaveVar29p10.timer = toc; SaveVar29p10.comments = "2D OD L scan with KRV = 10. For Ch VI";

[oldfolder] = cd(folpath);
filename = 'matlab_SV29p10.mat';
save(filename, 'SaveVar29p10')
cd(oldfolder);
% ------------------------------------------------------------------------
