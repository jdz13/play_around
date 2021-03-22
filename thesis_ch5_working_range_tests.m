%% graph plotter for SV22p1. Shows max possible channels for a linescan in OD

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p1.mat')
ist = SaveVar29p1;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p1.mat')
ist = SaveVar28p1;
plt11 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt11(kk) = nnz(lp(:,kk))-1;
end 

hold on 
plot(xs.*1000, plt11,':')
legend ('Working range limited','No working range limit','Location','Southeast')
thesis_fig_gen(j.Number)
clear xs tt j jj kk lp ist


%% graph plotter for SV22p2. Shows max possible channels for a linescan in L

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p2.mat')
ist = SaveVar29p2;
plt2 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt2(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt2)
xlabel 'L [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p2.mat')
ist = SaveVar28p2;
plt22 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt22(kk) = nnz(lp(:,kk))-1;
end 

hold on 
plot(xs.*1000, plt22,':')
legend ('Working range limited','No working range limit','Location','South')
axis([20,100,18.8,22.2])
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%%
ist = SaveVar24p2;
hh = figure;
plot(ist.varst.Lengths.*1000,plt22,ist.varst.Lengths.*1000,plt2)
ylabel '\eta'
xlabel 'L [mm]'
yyaxis right
plot(ist.varst.Lengths.*1000, plt2 - plt22,'--')
ylabel 'Difference between runs'
legend ('initial results', 'new results','difference')
thesis_fig_gen(hh.Number)
clear hh ist
%%
ist = SaveVar28p1;
hh = figure;
plot(ist.varst.PM.*1000,plt1,ist.varst.PM.*1000,plt11)
ylabel '\eta'
xlabel 'OD [mm]'
yyaxis right
plot(ist.varst.PM.*1000, plt11 - plt1,':')
ylabel 'Difference between runs'
legend ('initial results', 'new results','difference')
thesis_fig_gen(hh.Number)
clear hh ist
%%

mxFOD = SaveVar28p1.MxB(:,end);
mxFL = squeeze(SaveVar28p2.MxB(1,end,:));
hh = figure;
plot(SaveVar28p1.varst.PM.*1e3, mxFOD.*1e3, SaveVar28p2.varst.Lengths.*1e3, mxFL.*1e3)
ylabel 'Field at working range (10cm) [mT]'
xlabel 'OD or L [mm]'
legend ('Changing OD', 'Changing L','Location','Southeast')
thesis_fig_gen(hh.Number)

%%
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p1.mat')
figure
subplot(1,3,1)
plot(nonzeros(SaveVar24p1.SWres(1,:,1)),'bo-'); hold on
plot(nonzeros(SaveVar28p1.SWres(1,:,1)),'rx-');
xlabel 'n(OD)'; ylabel '\eta'; legend ('old','new')
subplot(1,3,2)
plot(nonzeros(SaveVar24p1.SWres(1,:,41)),'bo-'); hold on
plot(nonzeros(SaveVar28p1.SWres(1,:,41)),'rx-');
xlabel 'n(OD)'; ylabel '\eta'; legend ('old','new')
subplot(1,3,3)
plot(nonzeros(SaveVar24p1.SWres(1,:,81)),'bo-'); hold on
plot(nonzeros(SaveVar28p1.SWres(1,:,81)),'rx-');
xlabel 'n(OD)'; ylabel '\eta'; legend ('old','new')
%%
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p2.mat')
figure
subplot(1,3,1)
plot(nonzeros(SaveVar24p2.SWres(1,:,1,1,1)),'bo-'); hold on
plot(nonzeros(SaveVar28p2.SWres(1,:,1,1,1)),'rx-');
xlabel 'n(L)'; ylabel '\eta'; legend ('old','new')
subplot(1,3,2)
plot(nonzeros(SaveVar24p2.SWres(1,:,1,1,41)),'bo-'); hold on
plot(nonzeros(SaveVar28p2.SWres(1,:,1,1,41)),'rx-');
xlabel 'n(L)'; ylabel '\eta'; legend ('old','new')
subplot(1,3,3)
plot(nonzeros(SaveVar24p2.SWres(1,:,1,1,81)),'bo-'); hold on
plot(nonzeros(SaveVar28p2.SWres(1,:,1,1,81)),'rx-');
xlabel 'n(L)'; ylabel '\eta'; legend ('old','new')

%%
%--------------------------------------------------------------------------
%%
%--------------------------------------------------------------------------
%%
%--------------------------------------------------------------------------
%% Comparison of start field runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p4.mat')
ist = SaveVar29p4;
plt1 = zeros(1, size(ist.varst.RES,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; 
plot(xs, plt1)
xlabel 'Start Field [T]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);


hold on  

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p4.mat')
ist = SaveVar28p4;
plt2 = zeros(1, size(ist.varst.RES,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt2(kk) = nnz(lp(:,kk))-1;
end 
plt2([10,41]) = 21;
xs = ist.varst.RES;
hold on
plot(xs, plt2,'--')
legend ('Working range limited','No working range limit','Location','South')
ylim([17,22.2])
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%% Comparison of s_rad runs with and without the suppression (working range)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p3.mat')
ist = SaveVar29p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad.*1e3;
j = figure; 
plot(xs, plt1)
xlabel 's_r_a_d [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);


hold on  

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p5.mat')
ist = SaveVar29p5;
plt2 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt2(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad.*1e3;
plot(xs, plt2)

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV28p5.mat')
ist = SaveVar28p5;
plt3 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt3(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad.*1e3;
plot(xs, plt2,'--')

legend('2000 point resolution', '8000 point resolution', '8000 points - no working range limit', 'Location', 'Southwest')
thesis_fig_gen(j.Number)
clear tt j jj kk lp ist

%%

figure
subplot(1,3,1)
plot(nonzeros(SaveVar24p3.SWres(1,:,1,1,1,1)),'bx-'); hold on
plot(nonzeros(SaveVar28p3.SWres(1,:,1,1,1,1)),'rx-');
xlabel 's_r_a_d [mm]'; ylabel '\eta'; legend ('old','new')
subplot(1,3,2)
plot(nonzeros(SaveVar24p3.SWres(1,:,1,1,1,16)),'bx-'); hold on
plot(nonzeros(SaveVar28p3.SWres(1,:,1,1,1,16)),'rx-');
xlabel 's_r_a_d [mm]'; ylabel '\eta'; legend ('old','new')
subplot(1,3,3)
plot(nonzeros(SaveVar24p3.SWres(1,:,1,1,1,31)),'bx-'); hold on
plot(nonzeros(SaveVar28p3.SWres(1,:,1,1,1,31)),'rx-');
xlabel 's_r_a_d [mm]'; ylabel '\eta'; legend ('old','new')
