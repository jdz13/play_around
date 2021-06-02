%%
%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist  = SaveVar24p2;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

cnt = 0;

[particle_loc] = plane_mask(Yin,Zin,ist.varst.s_rad);

hh = figure; 
for tt = [1,41,81] 
    cnt = cnt + 1;
    r = ist.probe_line(find(ist.MxB(1,:,tt) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    Bxnew = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)) +Yunitx.*sin(ist.MLOC(1,1,1,1,tt));
    BZM = (Bxnew >= ist.varst.RES) - (Bxnew <= -ist.varst.RES);
    CM = BZM .* particle_loc; 
    
    subplot(3,3,cnt)
    imagesc(Yin.*1e3,Zin.*1e3, Bxnew)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose(['B_z for L = ', num2str(ist.varst.Lengths(tt).*100),...
        ' [cm]\n at p = ', num2str((r-(ist.varst.PM/2)).*1e3), ...
        ' [mm] and at ', num2str(rad2deg(ist.MLOC(1,1,tt))),' [deg]']))
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
    
        
    subplot(3,3,cnt+3)
    plot(Yin.*1e3, Bxnew(:,26))
    xlabel 'distance across the sample (x,y) [mm]'
    ylabel 'Field across X = 0,  [T]'
    yyaxis right; plot(Yin.*1e3, Bxnew(26,:))
    ylabel 'Field across Y = 0,  [T]'
    legend ('field at x = 0', 'field at y = 0')
    thesis_fig_gen(hh.Number)
    
    dd(:,:,1) = Bxnew;
    dd(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)-deg2rad(1)) +Yunitx.*sin(ist.MLOC(1,1,1,1,tt)-deg2rad(1));
        
    subplot(3,3,cnt+6)
    imagesc(Yin.*1e3, Zin.*1e3, diff(dd,1,3).*1e3)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title ('dB_z/d\theta_M across the transition')
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
    
end 

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

cnt = 0;

[particle_loc] = plane_mask(Yin,Zin,ist.varst.s_rad);

hh = figure; 

for tt = [1,41,81]
    cnt = cnt + 1;
    r = ist.probe_line(tt,find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
        
    Bxnew = Xunitx.*cos(ist.MLOC(1,1,tt)) +Yunitx.*sin(ist.MLOC(1,1,tt));
    BZM = (Bxnew >= ist.varst.RES) - (Bxnew <= -ist.varst.RES);
    CM = BZM .* particle_loc; 
    
    subplot(3,3,cnt)
    imagesc(Yin.*1e3,Zin.*1e3, Bxnew)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose(['B_z for OD = ', num2str(ist.varst.PM(tt).*100),...
        ' [cm]\n at p = ', num2str((r-(ist.varst.PM(tt)./2)).*1e3), ...
        ' [mm] and at ', num2str(rad2deg(ist.MLOC(1,1,tt))),' [deg]']))
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
    
    subplot(3,3,cnt+3)
    plot(Yin.*1e3, Bxnew(:,26))
    xlabel 'distance across the sample (x,y) [mm]'
    ylabel 'Field across X = 0,  [T]'
    yyaxis right; plot(Yin.*1e3, Bxnew(26,:))
    ylabel 'Field across Y = 0,  [T]'
    legend ('field at x = 0', 'field at y = 0')
    thesis_fig_gen(hh.Number)
    
    dd(:,:,1) = Bxnew;
    dd(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,tt)-deg2rad(1)) +Yunitx.*sin(ist.MLOC(1,1,tt)-deg2rad(1));
        
    subplot(3,3,cnt+6)
    imagesc(Yin.*1e3, Zin.*1e3, diff(dd,1,3).*1e3)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title ('dB_z/d\theta_M across the transition')
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
 
end 


%%
%%

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y  
Zin = 0;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.PM));
BzvX = zeros(1, length(ist.varst.PM));
BzvY = zeros(1, length(ist.varst.PM));
cnt = -1;
hh = figure;
dfp = zeros(1,length(ist.varst.PM));
dfm = zeros(1,length(ist.varst.PM));
clear Bxnew

for tt =  1:length(ist.varst.PM)
    cnt = cnt + 2;
    r = ist.probe_line(tt,find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    Bxnew(:,:,1) = Xunitx.*cos(ist.MLOC(1,1,tt)-deg2rad(1)) + Yunitx.*sin(ist.MLOC(1,1,tt)-deg2rad(1));
    Bxnew(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,tt)) + Yunitx.*sin(ist.MLOC(1,1,tt));
    df = diff(Bxnew,1,3);
    dfp(tt) = df(1)-df(end);
    dfm(tt) = mean(df,'all');
    
end 

    figure(hh)
    plot(ist.varst.PM.*100 ,dfm.*1e3); xlabel 'OD [cm]';
    ylabel 'mean dB_z/d\theta [mT/deg]'; 
    title 'dB_z/d\theta range across the transition centre for varying OD'
    thesis_fig_gen(hh.Number)
    
%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist  = SaveVar24p2;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y  
Zin = 0;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.Lengths));
BzvX = zeros(1, length(ist.varst.Lengths));
BzvY = zeros(1, length(ist.varst.Lengths));
cnt = -1;
hh = figure;
dfp = zeros(1,length(ist.varst.Lengths));
dfm = zeros(1,length(ist.varst.Lengths));
clear Bxnew

for tt =  1:length(ist.varst.Lengths)
    cnt = cnt + 2;
    r = ist.probe_line(find(ist.MxB(1,:,tt) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    Bxnew(:,:,1) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)-deg2rad(1)) + Yunitx.*sin(ist.MLOC(1,1,1,1,tt)-deg2rad(1));
    Bxnew(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)) + Yunitx.*sin(ist.MLOC(1,1,1,1,tt));
    df = diff(Bxnew,1,3);
    dfp(tt) = df(1)-df(end);
    dfm(tt) = mean(df,'all');
    
end 

    figure(hh)
    plot(ist.varst.Lengths.*100 ,dfm.*1e3); xlabel 'L [cm]';
    ylabel 'mean dB_z/d\theta [mT/deg]'
    title 'dB_z/d\theta range across the transition centre for varying L'
    thesis_fig_gen(hh.Number)
    
%%

%% graph plotter for SV22p1. Shows max possible channels for a linescan in L

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p2.mat')
ist = SaveVar31p2;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta - unsupressed model'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);


gg = figure;

legendstr = cell(5,1); %  five positions 

for t = 0:4
    
%     yyaxis left
%     plot(lp(1:length(nonzeros(lp(:,(20*t+1))))-1,(20*t+1)))
%     hold on 
%     yyaxis right 
%     semilogy(-diff(lp(:,(20*t+1))))
%     f = gca;
%     set(f,'yscale','log')

    subplot(1,2,1)
    semilogy(0:50, lp(1:51,(20*t+1)).*1e4)
    hold on 
    subplot(1,2,2)
    semilogy(0:50,-diff(lp(1:52,(20*t+1))).*1e4)
    hold on
    legendstr{t+1} = ['L = ', num2str(ist.varst.Lengths(20*t+1).*1e2), ' [cm]'] ;

end 
hline(50, 'r:','50 [Oe]')
ylabel 'Difference between ajacent channels [Oe]'
for t = [2,1] 
    subplot(1,2,t)
    xlim ([0,50])
    xlabel 'Channel number n'
    legend (legendstr, 'Location','Northeast')
    thesis_fig_gen(gg.Number)
end 
ylabel 'Channel field B_n [Oe]'

%% graph plotter for SV22p1. Shows max possible channels for a linescan in OD

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p1.mat')
ist = SaveVar31p1;
plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta - unsupressed model'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);

gg = figure;

legendstr = cell(5,1); %  five positions 

for t = 0:4
    
%     yyaxis left
%     plot(lp(1:length(nonzeros(lp(:,(20*t+1))))-1,(20*t+1)))
%     hold on 
%     yyaxis right 
%     semilogy(-diff(lp(:,(20*t+1))))
%     f = gca;
%     set(f,'yscale','log')

    subplot(1,2,1)
    semilogy(0:50, lp(1:51,(20*t+1)).*1e4)
    hold on 
    subplot(1,2,2)
    semilogy(0:50,-diff(lp(1:52,(20*t+1))).*1e4)
    hold on
    legendstr{t+1} = ['OD = ', num2str(ist.varst.PM(20*t+1).*1e2), ' [cm]'] ;

end 
hline(50, 'r:','50 [Oe]')
ylabel 'Difference between ajacent channels [Oe]'
for t = [2,1] 
    subplot(1,2,t)
    xlim ([0,50])
    xlabel 'Channel number n'
    legend (legendstr, 'Location','Northeast')
    thesis_fig_gen(gg.Number)
end 
ylabel 'Channel field B_n [Oe]'

%%

%%

%%
clear 
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p1.mat')
ist = SaveVar31p1;
legendstr = cell(5,1); %  five positions 

gg = figure; 
for t = 0:4
    semilogy((ist.probe_line(20*t+1,:)-ist.varst.PM(20*t+1)./2).*1e3,ist.MxB(20*t+1,:))
    hold on
    legendstr{t+1} = ['OD = ', num2str(ist.varst.PM(20*t+1).*1e2), ' [cm]'] ;
end 
xlabel 'p [mm]'
ylabel 'B_z [T]'
legend(legendstr)
thesis_fig_gen(gg.Number)
axes('Position',[.19 .175 .25 .25])
box on
for t = 0:4
    semilogy((ist.probe_line(20*t+1,1:301)-ist.varst.PM(20*t+1)./2).*1e3,ist.MxB(20*t+1,1:301))
    hold on
    legendstr{t+1} = ['OD = ', num2str(ist.varst.PM(20*t+1).*1e2), ' [cm]'] ;
end 
% thesis_fig_gen(gg.Number)

%%
clear 
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p2.mat')
ist = SaveVar31p2;
legendstr = cell(5,1); %  five positions 

gg = figure; 
for t = 0:4
    semilogy((ist.probe_line-ist.varst.PM./2).*1e3,squeeze(ist.MxB(1,:,20*t+1)))
    hold on
    legendstr{t+1} = ['L = ', num2str(ist.varst.Lengths(20*t+1).*1e2), ' [cm]'] ;

end 
xlabel 'p [mm]'
ylabel 'B_z [T]'
legend(legendstr)
thesis_fig_gen(gg.Number)

axes('Position',[.19 .175 .28 .28])
box on
for t = 0:4
    semilogy((ist.probe_line(1:301)-ist.varst.PM./2).*1e3,squeeze(ist.MxB(1,1:301,20*t+1)))
    hold on
end  


%%

%%

%%

%%

clear 

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
pm_cl = 4e-2;

theta = deg2rad(linspace(15,20,501));
L = [2,6,10].*1e-2;
[MxB, probe_line] = MxBProbeMulti_V2(M,pm_cl, L,1e-1,10001, IB); 

B0 = 0.1;
s_rad = 1e-3;

cnt = 0;

[particle_loc] = plane_mask(Yin,Zin,s_rad);
control = sum(sum(particle_loc));

hh = figure; 
for tt = 1:length(L) 
    cnt = cnt + 1;
    r = probe_line(find(MxB(1,:,tt) > B0*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,L(tt)./2,pm_cl./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,L(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    NVC = zeros(2,length(theta)); % Normalised volume comparison
    
    for pull = 1:length(theta) 
       % Use rotation matricies to find the Z component 
       Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 

       %Find out how much of this areas is above or below the threshold
       BZM = (Bxnew >= B0) - (Bxnew <= -B0);
       % Correlate with where the particles actually are in the world

       CM = BZM .* particle_loc;
       % Find a qualitative number for how much is 'on'
       vc = sum(sum(CM));
       % Compare this to how many are in the sample space 
       NVC(1,pull) = vc./control;

    end
    
    MLOC = theta(find(NVC(1,:) <= 0.5 ,1,'first'));
    
    Bxnew = Xunitx.*cos(MLOC) +Yunitx.*sin(MLOC);
    BZM = (Bxnew >= B0) - (Bxnew <= -B0);
    CM = BZM .* particle_loc; 
    
    subplot(3,3,cnt)
    imagesc(Yin.*1e3,Zin.*1e3, Bxnew)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose(['B_z for L = ', num2str(L(tt).*100),...
        ' [cm]\n at p = ', num2str((r-(pm_cl/2)).*1e3), ...
        ' [mm] and at ', num2str(rad2deg(MLOC)),' [deg]']))
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
    
        
    subplot(3,3,cnt+3)
    plot(Yin.*1e3, Bxnew(:,26))
    xlabel 'distance across the sample (x,y) [mm]'
    ylabel 'Field across X = 0,  [T]'
    yyaxis right; plot(Yin.*1e3, Bxnew(26,:))
    ylabel 'Field across Y = 0,  [T]'
    legend ('field at x = 0', 'field at y = 0')
    thesis_fig_gen(hh.Number)
    
    dd(:,:,1) = Bxnew;
    dd(:,:,2) = Xunitx.*cos(MLOC-deg2rad(1)) +Yunitx.*sin(MLOC-deg2rad(1));
        
    subplot(3,3,cnt+6)
    imagesc(Yin.*1e3, Zin.*1e3, diff(dd,1,3).*1e3)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title ('dB_z/d\theta_M across the transition')
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
    axis equal; axis([-1,1,-1,1])
    thesis_fig_gen(hh.Number)
    
end 


%%

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist  = SaveVar24p2;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
s_rad = 1e-3;

BzuX = zeros(1, length(ist.varst.Lengths));
BzvX = zeros(1, length(ist.varst.Lengths));
BzvY = zeros(1, length(ist.varst.Lengths));
cnt = -1;

B0 = 0.3; % adjustable parameter. Use to check. 
theta = deg2rad(linspace(15,20,501));

[particle_loc] = plane_mask(Yin,Zin,s_rad);
control = sum(sum(particle_loc));

% figure
for tt = 1:length(ist.varst.Lengths) 
    cnt = cnt + 2;
    r = ist.probe_line(find(ist.MxB(1,:,tt) > B0.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    NVC = zeros(2,length(theta)); % Normalised volume comparison
    
    for pull = 1:length(theta) 
       % Use rotation matricies to find the Z component 
       Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 

       %Find out how much of this areas is above or below the threshold
       BZM = (Bxnew >= B0) - (Bxnew <= -B0);
       % Correlate with where the particles actually are in the world

       CM = BZM .* particle_loc;
       % Find a qualitative number for how much is 'on'
       vc = sum(sum(CM));
       % Compare this to how many are in the sample space 
       NVC(1,pull) = vc./control;

    end
    
    MLOC = theta(find(NVC(1,:) <= 0.5 ,1,'first'));
        
    Bxnew = Xunitx.*cos(MLOC) +Yunitx.*sin(MLOC);
     
    BzX(tt) = abs(Bxnew(26,1) - Bxnew(26,51));
    BzY(tt) = abs(Bxnew(1,26) - Bxnew(26,26));
    
end 

hh = figure;
subplot(1,2,1)
plot(ist.varst.Lengths.*1e3, BzX.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in X'
xlim([20,100])
thesis_fig_gen(hh.Number)
subplot(1,2,2)
plot(ist.varst.Lengths.*1e3, BzY.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in Y'
xlim([20,100])
thesis_fig_gen(hh.Number)

%%
%%
%%
%%
%%
%%
%%
%%
%%


%% looking at how the homogeneity profile changes below 500 [Oe] for different L 

figno = 2; figure(figno); clf;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\homog_outputs_L.mat')

thesis_homog_str_plotter(outstr1, figno, 'multi')
thesis_homog_str_plotter(outstr2, figno, 'multi')
thesis_homog_str_plotter(outstr3, figno, 'multi')
thesis_homog_str_plotter(outstr4, figno, 'multi')
ylim ([-0.5,1]); hline(0,':k')
clear hh tt figno
%% 500 [Oe] data on its own - L study.

thesis_homog_str_plotter(outstr1, 3, 'single')

%% looking at how the homogeneity profile changes below 500 [Oe] for different OD 

figno = 2; figure(figno); clf;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\homog_outputs_OD.mat')

thesis_homog_str_plotter(outstr11, figno, 'multi')
thesis_homog_str_plotter(outstr12, figno, 'multi')
thesis_homog_str_plotter(outstr13, figno, 'multi')
thesis_homog_str_plotter(outstr14, figno, 'multi')
ylim ([-0.5,1]); hline(0,':k')
clear hh tt figno
%% 500 [Oe] data on its own - L study.

thesis_homog_str_plotter(outstr11, 3, 'single')

%% looking at how the homogeneity profile changes above 500 [Oe] for different OD and L 

figno = 2; figure(figno); clf;
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\homog_outputs_L_OD_higher_field.mat')

thesis_homog_str_plotter(L_outstr_4000, figno, 'multi')
thesis_homog_str_plotter(L_outstr_3000, figno, 'multi')
thesis_homog_str_plotter(L_outstr_2000, figno, 'multi')
thesis_homog_str_plotter(L_outstr_1000, figno, 'multi')

figno = 3; figure(figno); clf;
thesis_homog_str_plotter(OD_outstr_4000, figno, 'multi')
thesis_homog_str_plotter(OD_outstr_3000, figno, 'multi')
thesis_homog_str_plotter(OD_outstr_2000, figno, 'multi')
thesis_homog_str_plotter(OD_outstr_1000, figno, 'multi')

%%
%%
%%
%%
%%
%%
%%
%%
%%

