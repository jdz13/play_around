% Chapter 5 thesis figure generators

%% COMPARISON OF MUMAX AND CACIAGLI SAMPLE BOUNDARIES.

h1 = openfig('keep1.fig','reuse'); ax1 = gca;
h2 = openfig('keep2.fig','reuse'); ax2 = gca;
h11 = figure; %create new figure
s1 = subplot(2,1,1); %create and get handle to the subplot axes
s2 = subplot(2,1,2);
fig1 = get(ax1,'children'); %get handle to all the children in the figure
fig2 = get(ax2,'children');
copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
copyobj(fig2,s2); polarmap

subplot(2,1,1)
xlabel 'Distance (x) [m]'; ylabel 'Distance (y) [m]'
title 'Field profile - Mumax'; colorbar; axis equal
subplot(2,1,2)
xlabel 'Distance (x) [m]'; ylabel 'Distance (y) [m]'
title 'Field profile - Caciagli'; colorbar; axis equal

set(s1, 'clim', [-0.65,0.65]); set(s1,'fontsize', 11)
set(s1, 'xlim', [-0.015,0.015]); set(s1, 'ylim', [-0.015,0.015])
set(s2, 'clim', [-0.65,0.65]); set(s2,'fontsize', 11)
set(s2, 'xlim', [-0.015,0.015]); set(s2, 'ylim', [-0.015,0.015])

set(gcf, 'Position',  [1600, 0, 540, 800]) 

close ([h1 h2])
clear s1 s2 ax1 ax2 h1 h2 h3 fig1 fig2


%% IDEAL PARTICLE SET IMAGE (USED IN CH IV BUT ALSO INTO CH V)

x = linspace(0,6000,6001);
y1 = zeros (size(x));y2 = zeros (size(x));y3 = zeros (size(x));y4 = zeros (size(x));y5 = zeros (size(x));
y1(1000) = 1; y2(2000) = 1; y3(3000) = 1; y4(4000) = 1; y5(5000) = 1;
h7 = figure;
plot(x,y1,x,y2,x,y3,x,y4,x,y5)
ylim([0,1.2])
% title 'Ideal channel system'
xlabel 'Field'
ylabel 'Signal'
legend ('Channel 1', 'Channel 2', 'Channel 3', 'Channel 4', 'Channel 5', 'Location','northwest','NumColumns',3)
thesis_fig_gen(h7.Number); clear y1 y2 y3 y4 y5 x
set(gca, 'ytick',[0,1],'yticklabel',{'low';'high'});
set(gca, 'xtick',[1000,2000,3000,4000,5000],'xticklabel',{'H_J_1';'H_J_2';'H_J_3';'H_J_4';'H_J_5'});

%% COMPARISON ON THE EFFECTS OF START FIELD ON FWHM AND CHANNEL VALUE

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

trial.fwhm = squeeze(rad2deg(SaveVar21p2.FWHMres(4,:,1,:,3)))';
trial.SWres3 = squeeze(SaveVar21p2.SWres(4,:,1,:,3))';

h3 = figure;

for mm = 1:size(SaveVar21p1.SWres,4)
temp = nonzeros(trial.fwhm(mm,:));
plot(nonzeros(trial.SWres3(mm,1:length(temp))),temp,'+:')
hold on
end 
clear mm 

xlabel 'Field value of channel [Oe]'
ylabel 'FWHM [deg]'
legend('Start field 0.4 [T]', 'Start field 0.3 [T]', ...
    'Start field 0.2 [T]', 'Location', 'Southeast')
title 'FWHM characteristics with respect to field'
thesis_fig_gen(h3.Number)


%% STATIC VS DYNAMIC MEASUREMENT 


ise = evalin( 'base', 'exist(''tester1'',''var'') == 1' );
isee = evalin( 'base', 'exist(''tester2'',''var'') == 1' );
    if ise && isee 
    else

        % Set variable space
        theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.
        KRV = 5; % Key ratio values, how strict of a condition do we want 
        RES = 0.4; % Start field values. 
        pm_cl = 2.*1e-2; % Magnet outer diameters.
        s_rad = 1e-3; % define the sample radius (where the particles will actually be
        con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
        Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
        Zin = Yin(1:26); % Probe plane points in Z 
        Lengths = 2.*1e-2; % Magnet lengths

        %Save outputs
        [tester1] = search_tool_Caciagli_single_7p2(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
        [tester2] = search_tool_Caciagli_single_7p2p1_allatonce(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);

    end
% get plotting
h6  = figure; 
s1 = subplot(2,1,1);
for mm = 1:size(tester2.masterNVC,1)
plot(tester2.SWres(mm).*cos((tester2.varst.theta(2:end))), smooth(diff(tester2.masterNVC(mm,:)),1000), '-')
hold on
end 
clear mm 
xlabel 'Field [T]'; ylabel (compose("Smoothed, differentiated \nnormalised area"))
set(gca,'YTickLabel',[]); thesis_fig_gen(h6.Number)
title 'Static measurement'

s2 = subplot(2,1,2);
for mm = 1:size(tester1.masterNVC,1)
plot(tester1.SWres(mm).*cos((tester1.varst.theta(2:end))), smooth(diff(tester1.masterNVC(mm,:)),1000), '-')
hold on
end 
clear mm 
xlabel 'Field [T]'; ylabel (compose("Smoothed, differentiated \nnormalised area"))
set(gca,'YTickLabel',[]); thesis_fig_gen(h6.Number)
title 'Dynamic measurement'
clear s1 s2 h6 theta KRV Lengths pm_cl RES s_rad con Yin Zin theta ise isee



%% PLOT NVC DATA FOR SINGLE RUN (ALREADY RUN ABOVE)

h4  = figure; 

for mm = 1:size(tester1.masterNVC,1)
plot(tester1.SWres(mm).*cos((tester1.varst.theta)), tester1.masterNVC(mm,:), '-')
hold on
end 
clear mm 

xlabel 'Field [T]'
ylabel (compose("Normalised sample area\nabove switching field"))
thesis_fig_gen(h4.Number)

%% PLOT SMOOTHED DIFFERENTIAL DATA FOR SINGLE RUN (ALREADY RUN ABOVE)

h5  = figure; 

for mm = 1:size(tester1.masterNVC,1)
plot(tester1.SWres(mm).*cos((tester1.varst.theta(2:end))), smooth(diff(tester1.masterNVC(mm,:)),700), '-')
hold on
end 
clear mm 

xlabel 'Field [T]'
% ylabel 'Channel response'
ylabel (compose("Smoothed, differentiated \nnormalised area"))
set(gca,'YTickLabel',[]);
thesis_fig_gen(h5.Number)

%% Akoun validation code

% datafile C:\Users\JDZ\Documents\MuMax\V3

path =  'C:\Users\JDZ\Documents\MATLAB\GIT\stray-field-CMC';
oldFolder = cd (path);
box_input_test
cd(oldFolder);
h = gcf;thesis_fig_gen(h.Number);subplot(3,1,3);thesis_fig_gen(h.Number); 
clear path oldFolder h;

%% Caciagli - Mumax validation, cylinders including angles

% select the data for 0, 23, 67 degrees respectively. folder here >>
%
% >>  C:\Users\JDZ\Documents\MuMax\thesis stuff\Cylinder_angular_tests.out
%

validation_Cac_Mumax

%% Akoun - Mumax validation

% folder name >> C:\Users\JDZ\Documents\MuMax\Particle_Jake_V6_thesis.out\
% file name >> Particle_Jake_V6_thesis.mat
difference_plots_Mumax_Akoun


%% graph plotter for SV22p1. Shows max possible channels for a linescan in OD

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p1.mat')
ist = SaveVar22p1;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist
%% graph plotter for SV22p2. Shows max possible channels for a linescan in L

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p2.mat')
ist = SaveVar22p2;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'L [mm]'
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%% graph plotter for SV22p4. Shows max possible channels for a linescan in Start field

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p4.mat')
ist = SaveVar22p4;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; 
plot(xs, plt1)
xlabel 'Start Field [T]'
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%%

%% graph plotter for SV22p6. Shows max possible channels for a linescan in Start field

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p6.mat')
ist = SaveVar22p6;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad;
j = figure; 
plot(xs.*1e3, plt1)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p3.mat')
ist = SaveVar22p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

hold on
xs = ist.varst.s_rad;
plot(xs.*1e3, plt1)

xlabel 'Sample radius [mm]'
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend('~8000 point resolution','~2000 point resolution', 'Location', 'Southeast')
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%% Static vs dynamic idea 

x = 0:20;
b_0 = 0.4;
TH = deg2rad(12.5);
MK = deg2rad(20);

y1 = b_0.*cos(TH+MK).^x;
y2 = b_0.*cos((x.*TH)+MK);
y2(1) = b_0;
kk = figure;
plot(x,y1,'b-+',x(1:7),y2(1:7),'r-+')
legend ({['Dynamic' newline 'B_n = B_0cos^n(\theta_J+\theta)'],...
    ['Static' newline 'B_0 = B_0' newline 'B_n = B_0cos(n(\theta_J+\theta))' 
    ]}, 'Location' , 'Northeast')
xlabel 'Channel number (n)'
ylabel 'B_n [T]'
axis([0,20,0,0.4])
thesis_fig_gen(kk.Number)

clear x b_0 kk y1 y2 TH 

%% section 5.5 plots - Linescan OD explanation

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p1.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist =SaveVar22p1;

% Start with defining the OD array. 
OD = ist.varst.PM;

% Now the trickier bit, extracting p(B_0). The field value will be found in
% the definitions.
B0 = ist.varst.RES;

% Correlate this to the MxB probe array, for each magnet OD.
PB0 = zeros(1,size(OD,2));
for cnt = 1:size(OD,2)
    PB0(cnt) = ist.probe_line(cnt,find(ist.MxB(cnt,:) >= B0, 1, 'last'))-(OD(cnt)/2);
end 

theta_s = atan(ist.varst.s_rad./(PB0+OD/2));

ff = figure;
plot(OD.*1e3,PB0.*1e3)
yyaxis left; ylabel 'p(B_0,OD) [mm]'; hold on
yyaxis right; plot(OD.*1e3,rad2deg(theta_s));
ylabel '\theta_s [deg]'; xlabel 'OD [mm]'
h1 = legend ('$p(B_0,OD$)','$\theta_s = tan^{-1}(\frac{s_{rad}}{(p(B_0,OD)+(OD/2)}$)');
set(h1 ,'Interpreter','latex'); set(h1 ,'Location','East                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        '); set(h1 ,'Fontsize',14)
thesis_fig_gen(ff.Number)

%% section 5.5 plots - Linescan L explanation

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p2.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist =SaveVar22p2;

% Start with defining the OD array. 
L = ist.varst.Lengths;
OD = 4e-2;

% Now the trickier bit, extracting p(B_0). The field value will be found in
% the definitions.
B0 = ist.varst.RES;

% Correlate this to the MxB probe array, for each magnet OD.
PB0 = zeros(1,size(L,2));
for cnt = 1:size(L,2)
    PB0(cnt) = ist.probe_line(1,find(ist.MxB(1,:,cnt) >= B0, 1, 'last'))-(OD/2);
end 

theta_s = atan(ist.varst.s_rad./(PB0+OD/2));

ff = figure;
plot(L.*1e3,PB0.*1e3)
yyaxis left; ylabel 'p(B_0,L) [mm]'; hold on
yyaxis right; plot(L.*1e3,rad2deg(theta_s));
ylabel '\theta_s [deg]'; xlabel 'L [mm]'
h1 = legend ('$p(B_0,L$)','$\theta_s = tan^{-1}(\frac{s_{rad}}{(p(B_0,OD)+(OD/2)}$)');
set(h1 ,'Interpreter','latex'); set(h1 ,'Location','East'); set(h1 ,'Fontsize',14)
thesis_fig_gen(ff.Number)


%% STATIC VS DYNAMIC MEASUREMENT 


ise = evalin( 'base', 'exist(''tester1'',''var'') == 1' );
isee = evalin( 'base', 'exist(''tester2'',''var'') == 1' );
    if ise && isee 
    else

        % Set variable space
        theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.
        KRV = 5; % Key ratio values, how strict of a condition do we want 
        RES = 0.4; % Start field values. 
        pm_cl = 4.*1e-2; % Magnet outer diameters.
        s_rad = 1e-3; % define the sample radius (where the particles will actually be
        con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
        Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
        Zin = Yin(1:26); % Probe plane points in Z 
        Lengths = 4.*1e-2; % Magnet lengths

        %Save outputs
        [tester1] = search_tool_Caciagli_single_7p2(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
        [tester2] = search_tool_Caciagli_single_7p2p1_allatonce(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con);
    end 

plt1 = nonzeros(tester1.SWres);
x1 = 0:length(plt1)-2;
plt2 = nonzeros(tester2.SWres);
x2 = 0:length(plt2)-2;        

        
x = 0:20;
b_0 = 0.4;
TH = deg2rad(20);
MK = deg2rad(12);

y1 = b_0.*cos(TH+MK).^x;
y2 = b_0.*cos((x.*TH)+MK);
y2(1) = b_0;
kk = figure;
plot(x1, plt1(1:end-1),'b+:',x2, plt2(1:end-1),'r+:',x,y1,'b:o',x(1:7),y2(1:7),'r:o')
legend ({'Method 2 results', 'Method 1 results',...
    'B_n = B_0cos^n(\theta_J+\theta_F)','B_n = B_0cos(n\theta_J+\theta_F)'...
    }, 'Location' , 'Northeast')
xlabel 'Channel number (n)'
ylabel 'B_n [T]'
axis([0,20,0,0.42])
thesis_fig_gen(kk.Number)

clear x b_0 kk y1 y2 TH 


%%


load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p1.mat')

ist = SaveVar22p1;

kk = figure;

ind = [6,31,56,66,76];

for pp = 1:5
    
   plt1 = nonzeros(squeeze(ist.SWres(1,:,ind(pp))));
   semilogy(0:length(plt1)-2,plt1(1:end-1)'),'+:'; hold on 
    
end

xlabel 'Channel number (n)'
ylabel 'Channel field (B_n)'

legendCell = cellstr(num2str(ist.varst.PM(ind)', 'OD = %-g [mm]')); 
legend(legendCell, 'Location', 'Southeast')
thesis_fig_gen(kk.Number)

clear pp kk ist plt1 legendCell

%%

tic
theta = linspace(0,pi/2,90001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.
KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = linspace(0.6,0.42,19); % Start field values. 
pm_cl = 6.*1e-2; % Magnet outer diameters.
s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 
Lengths = 2.*1e-2; % Magnet lengths
D_prac = 10e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 10001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
% Find the maximum field (theta = 0) at each z probe point, for each set of
% magnet parameters (L,OD)
[MxB, probe_line] = MxBProbeMulti_V2(M,pm_cl, Lengths,D_prac,N_probe, IB); 
% Initialisation parameter, to set a large number for max channels (to
% fill)
ntestmax = 100;masterNVC = zeros(ntestmax, length(theta));
% Initialise all of the working variables. Will have sizes defined by input
% sizes (as they simply cache previous results)
SWres = zeros(size(KRV,2),ntestmax,length(pm_cl),length(RES),length(Lengths)); 
SHo = SWres; FWHMres = SWres; ind1res = SWres; ind2res = SWres; Bset = SWres; MLOCa = SWres;
% Figure out where the sample sits within the probe plane, to convolute
% with the moment. 
[particle_loc1] = plane_mask(Yin,Zin,s_rad);
% Completed for positive half only, so flip and add to array (skip middle)
particle_loc = [particle_loc1, fliplr(particle_loc1(:, 1:(size(particle_loc1,2)-1)))];
% create a control variable - total cells within the sample area (all 'on')
control = sum(sum(particle_loc));
% Make sure the first switching field used is the initialiser value (for
% all)
for gg = 1:length(RES)
    SWres(:,1,:,gg,:,:) = RES(gg);
end
% Now looking for the main logic. Will be looping over all values, so multi
% level loop here (make sure you're being careful in indexing). 
    for Lcount = 1:length(Lengths)
        L = Lengths(Lcount);
        for rescount = 1:length(RES)
            res = RES(rescount);
            for pmcount = 1:length(pm_cl)
                PM = pm_cl(pmcount);
                for  count2 = 1:size(KRV,2)
                    % Define the initial conditions
                    SH0 = res; % start slightly higher than the switch value. This will be what is looked for as the first 'max' field value at theta = 0.
                    swinit = 0.4; % What's the max channel value?
                    count = 1; % counter variable to index with
                    tmps = [0,1]; % reassign temporary variable each iteration of the loop 
                    %------------------------------------------------------
                    % moved from the loop to only run once (all values)
                    pzcut =  find(MxB(pmcount,:,Lcount) >= SH0, 1, 'last');
                    [XunitX,YunitX] = Bandit_Cac_UVs(probe_line(pmcount,pzcut),...
                        Yin,Zin,L./2,PM./2,M);
                    % Now we need to take the internal bore and subtract
                    % this to get the proper field values.
                    [IBx, IBy] = Bandit_Cac_UVs(probe_line(pmcount,pzcut),...
                        Yin,Zin,L./2,IB./2,M);
                    % Create the real unit vectors, subtractions of the
                    % magnet with the internal bore.
                    Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;
                    % Initialise the variables you're going to want 
                        NVC = zeros(2,length(theta)); % Normalised volume comparison
                        FWHMX = [0,0]; MLOC = [0,0]; % Full width half max and Maxima location
                        for pull = 1:length(theta) 
                           % Use rotation matricies to find the Z component 
                           Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 
                           new.Bxnew = Bxnew;
                           % Use this data to flip the field about the
                           % symmetry axis. Allows for 2x faster code.
                           new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2))-1);
                           new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
                           new.temp = fliplr(new.Bxnew); new.temp(:,1) = [];
                           new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))-1) = new.temp;
                           % feed this back into the old variable 
                           Bxnew = new.newBxnew;
                           %Find out how much of this areas is above or below the threshold
                           BZM = (Bxnew >= swinit) - (Bxnew <= -swinit);
                           % Correlate with where the particles actually are in the world
                            CM = BZM .* particle_loc;
                           % Find a qualitative number for how much is 'on'
                           vc = sum(sum(CM));
                           % Compare this to how many are in the sample space 
                           NVC(1,pull) = vc./control;
                        end
                        masterNVC(count,:) = NVC(1,:);
                        [FWHMX(1),MLOC(1),indout] = FWHMNVC(NVC(1,:),theta,con);
                        SWnextpos = MLOC(1)+(KRV(count2)*FWHMX(1));  
                        SWnext = swinit*cos(SWnextpos);
                        SWres(count2,count+1,pmcount,rescount,Lcount) = SWnext;
                        FWHMres(count2,count,pmcount,rescount,Lcount) = FWHMX(1); % if +1 not needed then can use FWHMres(:,1,:,:) = [];
                        ind1res(count2,count,pmcount,rescount,Lcount)= indout(1);
                        ind2res(count2,count,pmcount,rescount,Lcount) = indout(2);
                        Bset(count2,count,pmcount,rescount,Lcount) = MxB(pmcount,pzcut,Lcount);
                        SHo(count2,count,pmcount,rescount,Lcount) = SH0;
                        MLOCa(count2,count,pmcount,rescount,Lcount) = MLOC(1);
                        % manipulate the results to run the next leg
                        tmps(1) = swinit; 
                            if SWnextpos >= pi/2
                                 tmps(2) = 0;
                            else
                                tmps(2) = SWnext;
                            end
                        SH0 = (tmps(1)+tmps(2))/2;  swinit = tmps(2); count = count +1;
                        disp (['count = ', num2str(count),', range = ', num2str(tmps)])
                end
            end
        end 
    end 
    g = figure; plot(RES, squeeze(rad2deg(FWHMres(1,1,1,:))),'+');ga = gca;
    g1 = lsline(ga);set(g1,'LineStyle', ':'); xlabel 'B_s_t_a_r_t [T]'; 
    ylabel 'FWHM [deg]';    yyaxis right ; hold on 
    plot(RES, squeeze(rad2deg(MLOCa(1,1,1,:)))); ylabel '\theta_J [deg]'
    legend ('FWHM vs B_s_t_a_r_t','fit, to guide the eye',...
        '\theta_J vs B_s_t_a_r_t', 'Location', 'Southeast')
    thesis_fig_gen(g.Number)
    
