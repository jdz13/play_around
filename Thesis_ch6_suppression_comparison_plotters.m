%% graph plotter for SV22p1. Shows max possible channels for a linescan in OD

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV32p1.mat')
ist = SaveVar32p1;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; yyaxis left
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta - unsupressed model'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);


load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p1.mat')
ist = SaveVar30p1;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM; yyaxis right
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta - supressed model'
legend ('unsupressed model', 'Working range and minimum separation applied')

thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%%

%% graph plotter for SV22p2. Shows max possible channels for a linescan in L

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV32p2.mat')
ist = SaveVar32p2;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'L [mm]'
ylabel '\eta - unsupressed model'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);



load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p2.mat')
ist = SaveVar30p2;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths; yyaxis right 
plot(xs.*1000, plt1)
ylabel '\eta - supressed model'
legend ('unsupressed model', 'Working range and minimum separation applied')
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%%
%% graph plotter for SV22p4. Shows max possible channels for a linescan in Start field

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV32p4.mat')
ist = SaveVar32p4;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; yyaxis left
plot(xs, plt1)
xlabel 'B_0 [T]'
ylabel '\eta - unsupressed model'



load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p4.mat')
ist = SaveVar30p4;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;yyaxis right
plot(xs, plt1)
xlabel 'B_0 [T]'
ylabel '\eta - supressed model'
jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('unsupressed model', 'Working range and minimum separation applied')
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%%

%% graph plotter for SV22p6. Shows max possible channels for a linescan in Start field

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV32p3.mat')
ist = SaveVar32p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.s_rad;
j = figure; yyaxis left
plot(xs(5:end).*1e3, plt1(5:end))
ylabel '\eta - unsupressed model'

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\matlab_SV30p3.mat')
ist = SaveVar30p3;
plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

yyaxis right
xs = ist.varst.s_rad;
plot(xs(5:end).*1e3, plt1(5:end))

xlabel 'Sample radius [mm]'
ylabel '\eta - supressed model'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
legend ('unsupressed model', 'Working range and minimum separation applied')
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist