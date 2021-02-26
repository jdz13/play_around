

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

%% Single layer CoFeB studies - MOKE. 

t_CoFeB = [0.7,0.8,1.1,1.3];
H_k = [7200,5400,2998,1797];% [7200, 5800, 3397, 2197];
H_c = [92, 76.5, 71, 62.4];
Ms = 1.05e6;

Hk_t = (H_k./1e4).*(t_CoFeB./1e9).*Ms./2;

h1 = figure;
plot(t_CoFeB, Hk_t.*1e3,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'K_e_f_f\cdott_C_o_F_e_B [mJ\cdotm^-^2]'
lsline 
% title 'H_K analysis - Single CoFeB layers'


h2 = figure;
plot(t_CoFeB, H_c,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'H_C [Oe]'
lsline
% title 'H_C analysis - Single CoFeB layers'

thesis_fig_gen([h2.Number, h1.Number])

clear H_k H_c Ms Hk_t h1 h2

% additional data and changes to make the new plot. 
SP7816 = [102.1,103.3,103.3,103.3,96.9,106.9,105.1,93.4,106.2,101.0];
SP7817 = [83.3,84.4,81.1,84.6,88.8,84.5,92.4,90.8,91.4,87.9];
SP7818 = [68.8,68.1,67.8,73.6,74.2,66.9,71.9,71.9,71.9,76.4];
SP7819 = [59.6,61.6,63.2,58.4,62.7,60.6,60.0,60.2,60.4,60.3];

S6 = mean(SP7816);
S7 = mean(SP7817);
S8 = mean(SP7818);
S9 = mean(SP7819);
P1 = [S6 S7 S8 S9];

Sd6 = std(SP7816);
Sd7 = std(SP7817);
Sd8 = std(SP7818);
Sd9 = std(SP7819);
P2 = [Sd6 Sd7 Sd8 Sd9];

h3 = figure;
plot(t_CoFeB, P1,'+b'); axis([0.6,1.4,55,110])
hold on; lsline
errorbar(t_CoFeB, P1,P2,'+b')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'H_C [Oe]'

% title 'H_C analysis - Single CoFeB layers'

thesis_fig_gen(h3.Number)


clear t_CoFeB h3 S6 S7 S8 S9 Sd6 Sd7 Sd9 Sd8 h3

%% SW Astroid plotting 

openfig 'C:\Users\JDZ\Documents\Thesis\Figures\Chapter 4 - Particle studies\SW_Astroid figure.fig';
h1 = gcf; 
subplot(2,3,1);ax1 = gca;
subplot(2,3,2);ax2 = gca;
subplot(2,3,3);ax3 = gca;
subplot(2,3,4);ax4 = gca;
subplot(2,3,5);ax5 = gca;
subplot(2,3,6);ax6 = gca;
h11 = figure; %create new figure
s2 = subplot(2,2,1); %create and get handle to the subplot axes
fig2 = get(ax2,'children'); %get handle to all the children in the figure
copyobj(fig2,s2); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal; 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'a)'; 
s3 = subplot(2,2,2);
fig3 = get(ax3,'children'); %get handle to all the children in the figure
copyobj(fig3,s3); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal; 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top');
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'b)'; 
s5 = subplot(2,2,3);
fig5 = get(ax5,'children'); %get handle to all the children in the figure
copyobj(fig5,s5); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal;
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'c)'; 
s6 = subplot(2,2,4);
fig6 = get(ax6,'children'); %get handle to all the children in the figure
copyobj(fig6,s6); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin';  axis equal;
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'd)'; 
polarmap

h12 = figure; %create new figure
s1 = gca;%create and get handle to the subplot axes
fig1 = get(ax1,'children'); %get handle to all the children in the figure
copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; set(s1, 'Xlim', s1.YLim); 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); polarmap
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'a)'; axis equal; 
axis(ax,[-750,750,-750,750])
h13 = figure; %create new figure
s4 = gca; fig4 = get(ax4,'children'); %get handle to all the children 
copyobj(fig4,s4); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; set(s4, 'Xlim', s4.YLim); 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); polarmap
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'b)'; axis equal; 
axis(ax,[-750,750,-750,750])

clear h1 h11 h12 h13 ax ax1 ax2 ax3 ax4 ax5 ax6 h11 s1 s2 s3 s4 s5 ...
    s6 fig1 fig2 fig3 fig4 fig5 fig6

%% Transitions for series and J vs T_Pt plotting

% C:\Users\JDZ\Documents\MOKE\2019 NOV\Films redo
[SiF, SiFfitting] = MOKE_data_in2(50, [200,800], [3:10]);
thesis_fig_gen(50:52)
figure(50); xlim([-1000, 10300]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 500]); title 'P-AP (H_4) transition - Si films'
figure(52); xlim([-1000, 7000]); ylim([-0.55,0.05])

% C:\Users\JDZ\Documents\MOKE\DEC 2019\New folder
[SiP, SiPfitting] = MOKE_data_in2(47, [300,820], [3,5:9]);
thesis_fig_gen(47:49)
figure(47); xlim([-1000, 9000]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 450]); title 'P-AP (H_4) transition - Si Particles'
figure(49); xlim([-1000, 6000]); ylim([-0.9,0.05])

% C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge particles redo
[GeP, GePfitting] = MOKE_data_in2(44, [300,820], [4:10]);
thesis_fig_gen(44:47)
figure(44); xlim([-1000, 6700]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 450]); title 'P-AP (H_4) transition - Ge Particles'
figure(46); xlim([-1000, 6500]); ylim([-0.35,0.05])

J_vs_TPt_plotting

%% plotter for all single sample measurements, major and minor. 

thesis_MOKE_single_SP8313_plotter

%% interaction energy plotter 

xline = linspace(-5e-5,5e-5,251);
yline = xline;
zline = logspace(-8,-6,100);
HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; tic; 
Msat = 1e6; mu0 = 4*pi*1e-7;
magD = [2e-5, 2e-5, 2e-9]; 
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)]...
                = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end
end 

HzAkoun_interaction = HzAkoun*Msat*mu0/4/pi;
HzAvInt = zeros(1,size(zline,2));
HzMaxInt = zeros(1,size(zline,2));

for pp = 1:size(zline,2)
    HzAvInt(pp) = mean(HzAkoun_interaction(:,:,pp), 'all');
    HzMaxInt(pp) = max(HzAkoun_interaction(:,:,pp),[], 'all');
end 

pp = figure(); loglog(zline, HzAvInt); ylabel 'Mean field in XY plane [T]'
yyaxis right; loglog(zline, HzMaxInt)
ylabel 'Max field in XY plane [T]'; xlabel 'Distance from particle [m]'
legend('Mean field in XY plane','Max field in XY plane', ...
    'Location', 'Southwest'); thesis_fig_gen(pp.Number)

%% plotting the high res rotational switches.

roational_high_res_switches.m
% data folder first
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\Si particles High res V2
% data folder second
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\SP8313_rotational_switching_as

%% IP - OOP comparison 

xline = linspace(-5e-5,5e-5,251);
yline = xline;
zline = logspace(-8,-6,100);
HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; tic; 
Msat = 1e6; mu0 = 4*pi*1e-7;
magD = [2e-5, 2e-5, 2e-9]; 
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)]...
                = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end
end 

HzAkoun_OOP = HzAkoun*Msat*mu0/4/pi;
HzAvOOP = zeros(1,size(zline,2));
HzMaxOOP = zeros(1,size(zline,2));

for pp = 1:size(zline,2)
    HzAvOOP(pp) = mean(HzAkoun_OOP(:,:,pp), 'all');
    HzMaxOOP(pp) = max(abs(HzAkoun_OOP(:,:,pp)),[], 'all');
end 


pp = figure();
subplot(1,2,1);
loglog(zline, HzAvOOP); ylabel 'Mean field in XY plane [T]'
yyaxis right; loglog(zline, HzMaxOOP)
ylabel 'Max field in XY plane [T]'; xlabel 'Distance from particle [m]'
legend('Mean field in XY plane - OOP','Max field in XY plane - OOP', ...
          'Location', 'Southwest')
thesis_fig_gen(pp.Number)


xline = linspace(-5e-5,5e-5,251);
yline = xline;
zline = 0;
xzline = logspace(-8,-6,100);
HxAkoun = zeros(size(xline,2), size(yline,2), size(xzline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; tic; 
Msat = 1e6; mu0 = 4*pi*1e-7;
magD = [2e-9, 2e-5, 2e-5]; 
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for ppk = 1:size(xzline,2)
            xinput = xline + xzline(ppk) + 5e-5;
            [HxAkoun(kk,jj,ppk), HyAkoun(kk,jj,ppk), HzAkoun(kk,jj,ppk)]...
                = Jannsen(xinput(ppk),yline(jj),zline,magD);
        end
    end
end 

HzAkoun_xzlineIP = HzAkoun*Msat*mu0/4/pi;
HzAvIP = zeros(1,size(xzline,2));
HzMaxIP = zeros(1,size(xzline,2));

for ppk = 1:size(xzline,2)
    HzAvIP(ppk) = mean(HzAkoun_IP(:,:,ppk), 'all');
    HzMaxIP(ppk) = max(abs(HzAkoun_IP(:,:,ppk)),[], 'all');
end 

subplot(1,2,2);
loglog(xzline, abs(HzAvIP)); ylabel 'Mean field in XY plane [T]';
yyaxis right; loglog(xzline, HzMaxIP)
ylabel 'Max field in XY plane [T]'; xlabel 'Distance from particle [m]'
legend('Mean field in XY plane - IP','Max field in XY plane - IP', ...
    'Location', 'Southwest')
thesis_fig_gen(pp.Number)



%%

%% Linear high resolution switches - Si particles

% folder path
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\Si particles linear high res
[zz1] = fol_data_ext_function();

fac1 = 4e-8;
fac2 = 7e-8;

AP2Px = zz1(4).data(:,8);
AP2Py = zz1(4).data(:,11);
AP2Py = AP2Py + fac2.* AP2Px;

P2APx = zz1(5).data(:,8);
P2APy = zz1(5).data(:,11);
P2APy = P2APy + fac1.* P2APx;

gg = figure;
subplot(2,1,1)
plot(P2APx(1:floor(length(P2APx)/2)), P2APy(1:floor(length(P2APx)/2)).*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
legend ('P-AP, Si particles', 'Location', 'Southeast')
xlim([700,1600])
thesis_fig_gen(gg.Number)

subplot(2,1,2)
plot(AP2Px(1:floor(length(AP2Px)/2)), AP2Py(1:floor(length(AP2Px)/2)).*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
legend ('AP-P, Si particles', 'Location', 'Southeast')
xlim([-2100,-1200])
thesis_fig_gen(gg.Number)

%% linear switching at high resolution - Si Films

folpath = 'C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\SP8313_rotational_switching_as\Output';
filename = 'SP8313_P2AP_checker.txt';

name = [folpath,'\',filename];

formatSpec = '%f %f %f %f %f %f %f %f %f %f %f';

sizeA = [11 Inf];
fileID = fopen(name,'r');
letsC = fgets(fileID);
P2AP_linear = fscanf(fileID,formatSpec,sizeA)';
fclose('all');

P2AP_linear((floor(size(P2AP_linear,1)/2)+1):end,:) = [];
P2AP_linear(1,:) = [];

datax = P2AP_linear(:,6);
datay = P2AP_linear(:,11);

fac = -4e-8;
datayf = datay + (fac.*datax);

hh = figure; 
subplot(2,1,1)
plot(datax,datayf.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
title 'Linear field - P-AP transition, Si Films'
xlim([800,1100])
points = [933,983];
vline(points)
legend(['Transition over ', num2str(diff(points)), ' [Oe]'], 'Location', 'Northwest')
thesis_fig_gen(hh.Number)

filename = 'SP8313_AP2P_checkerV2.txt';
name = [folpath,'\',filename];

fileID = fopen(name,'r');
letsC = fgets(fileID);
AP2P_linear = fscanf(fileID,formatSpec,sizeA)';
fclose('all');

AP2P_linear((floor(size(AP2P_linear,1)/2)+1):end,:) = [];

datax1 = AP2P_linear(:,6);
datay1 = AP2P_linear(:,11);

fac = 2.4e-7;
datay1f = datay1 + (fac.*datax1);

subplot(2,1,2)
plot(datax1,datay1f.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
title 'Linear field - AP-P transition, Si Films'
xlim([-1450, -1150])
points = [-1322, -1252];
vline(points)
legend(['Transition over ', num2str(diff(points)), ' [Oe]'], 'Location', 'Northwest')
thesis_fig_gen(hh.Number)

clear hh


%% plotting all of the CoFeB single layers on the same plot. 

folpath = 'C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\CoFeB Single layers';
filename = 'sp7616.txt';
name = [folpath,'\',filename];

formatSpec = '%f %f';
sizeA = [2 Inf];

fileID = fopen(name,'r');letsC = fgets(fileID);
SP7616 = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

filename = 'sp7617.txt'; name = [folpath,'\',filename];
fileID = fopen(name,'r'); letsC = fgets(fileID);
SP7617 = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

filename = 'sp7618.txt'; name = [folpath,'\',filename];
fileID = fopen(name,'r'); letsC = fgets(fileID); 
SP7618 = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

filename = 'sp7619.txt'; name = [folpath,'\',filename];
fileID = fopen(name,'r'); letsC = fgets(fileID);
SP7619 = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

x1 = normalize(SP7616(:,2), 'range', [0 1]);
x2 = normalize(SP7617(:,2), 'range', [0 1]);
x3 = normalize(SP7618(:,2), 'range', [0 1]);
x4 = normalize(SP7619(:,2), 'range', [0 1]);

hh = figure;
plot(SP7616(:,1),x1,SP7617(:,1),x2, SP7618(:,1),x3, SP7619(:,1),x4);
xlabel('Field [Oe]')
ylabel 'Normalised Kerr signal'
legend ('t_C_o_F_e_B = 0.7 [nm]', 't_C_o_F_e_B = 0.8 [nm]', ...
    't_C_o_F_e_B = 1.1 [nm]', 't_C_o_F_e_B = 1.3 [nm]', ...
    'Location' , 'West')
ylim([-0.02, 1.02])
hline([1,0])
thesis_fig_gen(hh.Number)


%%

kk = figure; 
errorbar(mean(SiF.a), 1, (std(SiF.a)) , (std(SiF.a)),  'horizontal', 'rx'); 
hold on;
errorbar(mean(SiP.a), 2, (std(SiP.a)) , (std(SiP.a)),  'horizontal', 'kx');
errorbar(mean(GeP.a), 3, (std(GeP.a)) , (std(GeP.a)),  'horizontal', 'bx');
ylim([0,4])
legend('Si films' , 'Ge particles', 'Si particles')
xlabel 'a [Oe^-^1]'
title 'Comparison of decay constant'
thesis_fig_gen(kk.Number)

