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