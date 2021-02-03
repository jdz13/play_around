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
plot(xs, plt1)

ist = SaveVar22p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

hold on
xs = ist.varst.s_rad;
plot(xs, plt1)

xlabel 'Sample radius [mm]'
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend('5100 point resolution','1300 point resolution', 'Location', 'Southeast')
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

%%
