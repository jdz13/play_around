%% Chapter 6 thesis figure generators


%% graph plotter for SV23p1. Shows max possible channels for a linescan in OD

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p1.mat')
ist = SaveVar23p1;
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
axis([20,100,6.5,16.5]);thesis_fig_gen(j.Number)

clear tt j jj kk lp ist plt1

%% graph plotter for SV23p2. Shows max possible channels for a linescan in L

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p2.mat')
ist = SaveVar23p2;
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
axis([20,100,11.9,13.1])
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist plt1


%% graph plotter for SV23p3. Shows max possible channels for a linescan in sample radius

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p3.mat')

ist = SaveVar23p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

j = figure; 
xs = ist.varst.s_rad;
plot(xs.*1000, plt1)

xlabel 'Sample radius [mm]'
ylabel 'Number of possible channels'

jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
% legend('5100 point resolution','1300 point resolution', 'Location', 'Southeast')
ylim([12.5,17.5]); xlim ([0.25,1.0])
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist plt1


%% graph plotter for SV23p4. Shows max possible channels for a linescan in Start field

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p3.mat')
ist = SaveVar23p4;
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
axis([0.1,0.6,7.8,13.2]); thesis_fig_gen(j.Number)

clear tt j jj kk lp ist plt1


%% Combining all of the above plots to one unit
% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p1.mat')
% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p2.mat')
% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p3.mat')
% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p4.mat')

ist = SaveVar23p1;plt1 = zeros(1, size(ist.varst.PM,2));lp = squeeze(ist.SWres);
for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 
xs = ist.varst.PM;j = figure; subplot(2,2,1); plot(xs.*1000, plt1)
xlabel 'OD [mm]';ylabel 'Number of possible channels';jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
axis([20,100,6.5,16.5]);thesis_fig_gen(j.Number);clear tt jj kk lp ist plt1

ist = SaveVar23p2; plt1 = zeros(1, size(ist.varst.Lengths,2));lp = squeeze(ist.SWres);
for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 
xs = ist.varst.Lengths; subplot(2,2,2); plot(xs.*1000, plt1)
xlabel 'L [mm]';ylabel 'Number of possible channels'; jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);axis([20,100,11.9,13.1])
thesis_fig_gen(j.Number); clear tt jj kk lp ist plt1

ist = SaveVar23p3; plt1 = zeros(1, size(ist.varst.s_rad,2)); lp = squeeze(ist.SWres);
for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 
subplot(2,2,3); xs = ist.varst.s_rad; plot(xs.*1000, plt1)
xlabel 'Sample radius [mm]';ylabel 'Number of possible channels'; jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
% legend('5100 point resolution','1300 point resolution', 'Location', 'Southeast')
ylim([12.5,17.5]); xlim ([0.25,1.0]); thesis_fig_gen(j.Number);clear tt jj kk lp ist plt1

ist = SaveVar23p4; plt1 = zeros(1, size(ist.varst.Lengths,2));lp = squeeze(ist.SWres);
for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 
xs = ist.varst.RES; subplot(2,2,4); plot(xs, plt1)
xlabel 'Start Field [T]'; ylabel 'Number of possible channels';jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
axis([0.1,0.6,7.8,13.2]); thesis_fig_gen(j.Number); clear tt j jj kk lp ist plt1

%% testing the decay from our dried particle solution. Field at a distance.

xline= 0; yline = xline;
zline = logspace(-9,-2,1000);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun1 = HxAkoun;

magD = [1e-3, 1e-3, 2e-9]; Msat = 1.27e5; mu0 = 4*pi*1e-7;

for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun1(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[HxAkoun, HyAkoun, HzAkoun1] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun1);

jj = figure; loglog(zline,squeeze(HzAkoun1));
xlabel 'Distance from sample [m]'; ylabel 'Field [T]'; vline(magD(1))
thesis_fig_gen(jj.Number)

clear jj kk pp

%%

<<<<<<< HEAD
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV23p5.mat')

ist = SaveVar23p5;
plotter = zeros(length(ist.varst.Lengths),length(ist.varst.PM));
for ff = 1:length(ist.varst.Lengths)
    for gg = 1:length(ist.varst.PM)
        
        plotter(ff,gg) = nnz(ist.SWres(1,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(ist.varst.Lengths.*100,ist.varst.PM.*100,plotter') 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%%

=======
x = linspace(0, 90,181);
y = cosd(x);
h1 = figure; subplot(1,2,1); plot(x,y)
vline(30)
vline(50)
hline(cosd(30))
hline(cosd(50))
hline(mean([cosd(50), cosd(30)]))
h = gca; 
set(h,'Ytick', [0,cosd(50), mean([cosd(50), cosd(30)]), cosd(30),1])
set(h, 'YTickLabel',{'0','B_n_+_1','B_s_t_a_r_t_,_n_+_1','B_n','B_0'})
ylabel 'B_x'; xlabel '\theta_M'
set(h,'Xtick', [0,30,50,90])
set(h, 'XTickLabel',{'0','\theta_J','\theta_F+\theta_J','\pi/2'})
thesis_fig_gen(h1.Number)

tic

% defining input space
theta = linspace(0,pi/2,9001); % define the angular resolution....
% Only up to 90 degrees, symmetry conditions help after.
KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 
Lengths = 4e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3; % define  sample radius (where the particles actually are)
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
D_prac = 10e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 10001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 
%Save outputs
[tester6] = search_tool_Caciagli_single_7p2(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con);
tester6.timer = toc; tester6.comments = "tester for figure 5.15 and 5.16";

[tester7] = search_tool_Caciagli_single_7p2p1_allatonce(KRV,RES,pm_cl,...
    Lengths,theta,Yin,Zin,s_rad,con);
tester7.timer = toc; tester7.comments = "eq for tester 6";
subplot(1,2,2)
plot(rad2deg(tester6.varst.theta), tester6.masterNVC(1,:),'b'); hold on
plot(rad2deg(tester6.varst.theta(1784)), tester6.masterNVC(1,1784),'ro')
xlabel '\theta_M'; ylabel 'NSA'
h = gca; xlim([10,25])
hline([0.3,0.5,0.7])
vline([16.63,17.83,18.97])
set(h,'Xtick', [16.63,17.83,18.97])
set(h, 'XTickLabel',{'\theta_0_._7','\theta_J','\theta_0_._3'})
set(h,'Ytick', [0,0.3,0.5,0.7,1])
annotation('arrow',[0.59,0.48],[0.85,0.85])
annotation('arrow',[0.48,0.59],[0.85,0.85])
text (17.2,0.82,'FWHM')


%%
>>>>>>> 36dd8f2c88d50a79b62a05998dba0f17cb935a6c
