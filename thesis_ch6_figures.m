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