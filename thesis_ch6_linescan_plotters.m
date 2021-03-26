%% graph plotter for SV30p1. Shows max possible channels for a linescan in OD

clear plt1 plt11
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p1.mat')
ist = SaveVar30p1;
plt1 = zeros(1, size(ist.varst.PM,2));
plt11 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = sum(lp(:,kk)>ist.MxB(kk,end));
end 

for kk = 1:size(lp,2)
    plt11(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1,xs.*1000, plt11,':')
xlabel 'OD [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Location','Southeast')
thesis_fig_gen(j.Number)
clear xs tt j jj kk lp ist


%% graph plotter for SV30p2. Shows max possible channels for a linescan in L
clear plt2 plt22
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p2.mat')
ist = SaveVar30p2;
plt2 = zeros(1, size(ist.varst.Lengths,2));
plt22 = zeros(1, size(ist.varst.Lengths,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt2(kk) = sum(lp(:,kk)>ist.MxB(1,end,kk));
end 

for kk = 1:size(lp,2)
    plt22(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt2,xs.*1000, plt22,':')
xlabel 'L [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Location','Southwest')
 axis([20,100,7.9,9.1])
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%%

mxFOD = SaveVar30p1.MxB(:,end);
mxFL = squeeze(SaveVar30p2.MxB(1,end,:));
hh = figure;
plot(SaveVar30p1.varst.PM.*1e3, mxFOD.*1e3, SaveVar30p2.varst.Lengths.*1e3, mxFL.*1e3)
ylabel 'Field at working range (10cm) [mT]'
xlabel 'OD or L [mm]'
legend ('Changing OD', 'Changing L','Location','Southeast')
thesis_fig_gen(hh.Number)


%% Comparison of start field runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p4.mat')
ist = SaveVar30p4;
plt3 = zeros(1, size(ist.varst.RES,2));
plt33 = zeros(1, size(ist.varst.RES,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt3(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

for kk = 1:size(lp,2)
    plt33(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; 
plot(xs, plt3,xs, plt33,'--')
xlabel 'Start Field [T]'
ylabel '\eta'
jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Location','South')
ylim([4,9.2])
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%% Comparison of s_rad runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p3.mat')
ist = SaveVar30p3;
plt4b = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt4b(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

xs = ist.varst.s_rad.*1e3;
j = figure; 
plot(xs, plt4b)
xlabel 's_r_a_d [mm]'
ylabel '\eta'
jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);

hold on  

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p5.mat')
ist = SaveVar30p5;
plt4 = zeros(1, size(ist.varst.s_rad,2));
plt44 = zeros(1, size(ist.varst.s_rad,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt4(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

for kk = 1:size(lp,2)
    plt44(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad.*1e3;
plot(xs, plt4,'--', xs, plt4,':')
legend('2000 point resolution', '8000 point resolution', '8000 points - no working range limit', 'Location', 'Southwest')
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist


%%

%%

%%

%% graph plotter for SV30p1. Shows max possible channels for a linescan in OD

clear plt1 plt11
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p1.mat')
ist = SaveVar30p1;
plt1 = zeros(1, size(ist.varst.PM,2));
plt11 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = sum(lp(:,kk)>ist.MxB(kk,end));
end 

for kk = 1:size(lp,2)
    plt11(kk) = nnz(lp(:,kk))-1;
end

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1,xs.*1000, plt11,':')
xlabel 'OD [mm]'
ylabel '\eta'

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p1.mat')
ist = SaveVar29p1;
plt1old = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1old(kk) = sum(lp(:,kk)>ist.MxB(kk,end));
end

yyaxis right
plot(ist.varst.PM.*1000, plt1old)
ylabel '\eta, ideal model'

jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Ideal model','Location','Southeast')
thesis_fig_gen(j.Number)
clear xs tt j jj kk lp ist

%% graph plotter for SV30p2. Shows max possible channels for a linescan in L
clear plt2 plt22
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p2.mat')
ist = SaveVar30p2;
plt2 = zeros(1, size(ist.varst.Lengths,2));
plt22 = zeros(1, size(ist.varst.Lengths,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt2(kk) = sum(lp(:,kk)>ist.MxB(1,end,kk));
end 

for kk = 1:size(lp,2)
    plt22(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt2,xs.*1000, plt22,':')
xlabel 'L [mm]'
ylabel '\eta'
axis([20,100,7.9,9.1])

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p2.mat')
ist = SaveVar29p2;
plt1old = zeros(1, size(ist.varst.Lengths,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1old(kk) = sum(lp(:,kk)>ist.MxB(1,end,kk));
end

yyaxis right
plot(ist.varst.Lengths.*1000, plt1old)
ylabel '\eta, ideal model'
axis([20,100,18.7,22.3])

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Ideal model','Location','Southwest')

thesis_fig_gen(j.Number)
clear tt j jj kk lp ist


%% Comparison of start field runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p4.mat')
ist = SaveVar30p4;
plt3 = zeros(1, size(ist.varst.RES,2));
plt33 = zeros(1, size(ist.varst.RES,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt3(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

for kk = 1:size(lp,2)
    plt33(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; 
plot(xs, plt3,xs, plt33,'--')
xlabel 'Start Field [T]'
ylabel '\eta'
ylim([4,9.2])

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p4.mat')
ist = SaveVar29p4;
plt1old = zeros(1, size(ist.varst.RES,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1old(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end

yyaxis right
plot(ist.varst.RES, plt1old)
ylabel '\eta, ideal model'
ylim([17,22.2])

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('Working range limited','No working range limit','Ideal model','Location','South')

thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%% Comparison of s_rad runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p3.mat')
ist = SaveVar30p3;
plt4b = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt4b(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

xs = ist.varst.s_rad.*1e3;
j = figure; 
plot(xs, plt4b)
xlabel 's_r_a_d [mm]'
ylabel '\eta'
jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);

hold on  

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p5.mat')
ist = SaveVar30p5;
plt4 = zeros(1, size(ist.varst.s_rad,2));
plt44 = zeros(1, size(ist.varst.s_rad,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt4(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end 

for kk = 1:size(lp,2)
    plt44(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad.*1e3;
plot(xs, plt4,'--')

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p5.mat')
ist = SaveVar29p5;
plt1old = zeros(1, size(ist.varst.s_rad,2));
lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1old(kk) = sum(lp(:,kk)>ist.MxB(1,end));
end

yyaxis right
plot(ist.varst.s_rad.*1e3, plt1old)
ylabel '\eta, ideal model'
ylim([20,73])
 
yyaxis left
plot( xs, plt4,':')

legend('2000 point resolution', '8000 point resolution', '8000 points - no working range limit', 'Ideal model - 8000 point resolution', 'Location', 'Southwest')
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%%

%% graph plotter for SV30p1. Shows max possible channels for a linescan in OD

clear plt1 plt11
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p1.mat')
ist = SaveVar30p1;
plt1 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.SWres);
df = diff(lp,1,1);

for kk = 1:size(lp,2)
    tmp = nonzeros(df(:,kk));
    plt1(kk) = min(abs(tmp(1:end-1)));
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1e3, plt1.*1e4)
xlabel 'OD [mm]'
ylabel 'Smallest channel separation in the series [Oe]'
% jj = gca;
% tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
% text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);

plt11 = zeros(1, size(ist.varst.PM,2));
plt111 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.FWHMres);

for kk = 1:size(lp,2)
    tmp = nonzeros(lp(:,kk));
    plt11(kk) = rad2deg(mean(abs(tmp(1:end-1))));
    plt111(kk) = rad2deg(min(abs(tmp(1:end-1))));
end 

yyaxis right 
plot(xs.*1e3, plt11, xs.*1e3,plt111)
ylabel 'Transition width [deg]'
legend ('Smallest channel separation', 'Mean transition width', ...
    'Minimum transition width')
thesis_fig_gen(j.Number)
% hline(200)
% clear xs tt j jj kk lp ist tmp df

%% graph plotter for SV30p2. Shows max possible channels for a linescan in L

clear plt1 plt11
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p2.mat')
ist = SaveVar30p2;
plt1 = zeros(1, size(ist.varst.Lengths,2));
lp = squeeze(ist.SWres);
df = diff(lp,1,1);

for kk = 1:size(lp,2)
    tmp = nonzeros(df(:,kk));
    plt1(kk) = min(abs(tmp(1:end-1)));
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1e3, plt1.*1e4)
xlabel 'Length [mm]'
ylabel 'Smallest channel separation in the series [Oe]'
% jj = gca;
% tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
% text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);

plt11 = zeros(1, size(ist.varst.PM,2));
plt111 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.FWHMres);

for kk = 1:size(lp,2)
    tmp = nonzeros(lp(:,kk));
    plt11(kk) = rad2deg(mean(abs(tmp(1:end-1))));
    plt111(kk) = rad2deg(min(abs(tmp(1:end-1))));
end 

yyaxis right 
plot(xs.*1e3, plt11,xs.*1e3, plt111)
ylabel 'Transition width [deg]'
legend ('Smallest channel separation', 'Mean transition width', ...
    'Minimum transition width')
thesis_fig_gen(j.Number)
% hline(200)
% clear xs tt j jj kk lp ist tmp df

%%

%% Evaluating channel widths for different start fields

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p5.mat')
ist = SaveVar30p5;
in = '+--';
%%
ff = figure;
pt = nonzeros(ist.SWres(1,:,1,1)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,1,1,1)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,11)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,1,1,11)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,21)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,1,1,21)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,31)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,1,1,31)));
plot(pt(1:length(pt1))', pt1,in); hold on
xlabel 'Channel field [T]'; ylabel 'W_0_._3_-_0_._7 [deg]'
legend ('s_r_a_d = 0.25 [mm]','s_r_a_d = 0.5 [mm]','s_r_a_d = 0.75 [mm]','s_r_a_d = 1 [mm]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)

%% Evaluating channel widths for different start fields

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p4.mat')
ist = SaveVar30p4;
in = '+--';

ff = figure;
pt = nonzeros(ist.SWres(1,:,1,1)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,1)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,11)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,11)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,21)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,21)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,31)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,31)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,41)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,41)));
plot(pt(1:length(pt1))', pt1,in); hold on
pt = nonzeros(ist.SWres(1,:,1,51)); pt1 = rad2deg(nonzeros(ist.FWHMres(1,:,1,51)));
plot(pt(1:length(pt1))', pt1,in); hold on
xlabel 'Channel field [T]'; ylabel 'W_0_._3_-_0_._7 [deg]'
legend ('B_s_t_a_r_t = 0.6 [T]','B_s_t_a_r_t = 0.5 [T]','B_s_t_a_r_t = 0.4 [T]','B_s_t_a_r_t = 0.3 [T]','B_s_t_a_r_t = 0.2 [T]','B_s_t_a_r_t = 0.1 [T]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)


%%
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p5.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist = SaveVar30p5;

% Start with defining the OD array. 
s_rad = ist.varst.s_rad;
OD = ist.varst.PM;

% Now the trickier bit, extracting p(B_0). The field value will be found in
% the definitions.
B0 = ist.varst.RES;

% Correlate this to the MxB probe array, for each magnet OD.
PB01 = squeeze(ist.FWHMres);
PB1 = rad2deg(PB01(1,:));
PB3 = rad2deg(PB01(3,:));
PB5 = rad2deg(PB01(5,:));
PB7 = rad2deg(PB01(7,:));
ff = figure;
plot(s_rad.*1e3,PB1,s_rad.*1e3,PB3,s_rad.*1e3,PB5,s_rad.*1e3,PB7)
ylabel 'W_0_._3_-_0_._7 [deg]'; hold on
xlabel 'S_r_a_d [mm]'
h1 = legend ('1^s^t channel', '3^r^d channel', '5^t^h channel',...
    '7^t^h channel'); set(h1 ,'Location','Northwest');
thesis_fig_gen(ff.Number)

%% graph plotter for SV30p1. Shows max possible channels for a linescan in OD

clear plt1 plt11
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p1.mat')
ist = SaveVar30p1;
plt1 = zeros(1, size(ist.varst.PM,2));
lp = squeeze(ist.FWHMres);

for kk = 1:size(lp,2)
    tmp = nonzeros(lp(:,kk));
    plt1(kk) = rad2deg(mean(abs(tmp(1:end-1))));
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1e3, plt1)
xlabel 'OD [mm]'
ylabel 'Average transition width [deg]'
jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)
% clear xs tt j jj kk lp ist tmp df


%% 2D data (OD,L)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p6.mat')

ist = SaveVar30p6;
plotter = zeros(length(ist.varst.Lengths),length(ist.varst.PM));
for ff = 1:length(ist.varst.Lengths)
    for gg = 1:length(ist.varst.PM)
        
        plotter(ff,gg) = nnz(ist.SWres(1,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(ist.varst.Lengths.*100,ist.varst.PM.*100,plotter') 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar; set(gca,'YDir','normal')
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%%

%% Proper 2D scan data 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p10.mat')

ist = SaveVar30p10;
plotter = zeros(length(ist.varst.Lengths),length(ist.varst.PM));
for ff = 1:length(ist.varst.Lengths)
    for gg = 1:length(ist.varst.PM)
        
        plotter(ff,gg) = nnz(ist.SWres(1,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(ist.varst.Lengths.*100,(ist.varst.PM).*100,(plotter')) 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar
set(gca,'YDir','normal')
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%% KRV data

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p7.mat')

ist = SaveVar30p7;
plotter = zeros(1,length(ist.varst.KRV));
for ff = 1:length(ist.varst.KRV)
    
    plotter(ff) = nnz(ist.SWres(ff,:,1,1,1,1,1))-1;
    
end

pp = figure; 
plot(ist.varst.KRV,plotter) 
xlabel 'KRV'; ylabel '\eta'; 
jj = gca;
tt = compose(['OD = ', num2str(ist.varst.PM*1000),' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(pp.Number);
 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p7.mat')

ist = SaveVar29p7;
plotter = zeros(1,length(ist.varst.KRV));
for ff = 1:length(ist.varst.KRV)
    
    plotter(ff) = nnz(ist.SWres(ff,:,1,1,1,1,1))-1;
    
end

yyaxis right  
plot(ist.varst.KRV,plotter) 
ylabel '\eta'; 
jj = gca;
tt = compose(['OD = ', num2str(ist.varst.PM*1000),' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
legend ('Non-ideal model','Ideal model','Location','Northeast')
thesis_fig_gen(pp.Number);
 
 %% a data

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p11.mat')

ist = SaveVar30p11;
plotter = zeros(1,length(ist.varst.a));
for ff = 1:length(ist.varst.a)
    
    plotter(ff) = nnz(ist.SWres(1,:,1,1,1,1,ff))-1;
    
end

ff = figure; 
semilogx(ist.varst.a,plotter) 
xlabel 'a [Oe^-^1]'; ylabel '\eta'; 
jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000),' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(ff.Number);