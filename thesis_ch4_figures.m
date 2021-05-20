

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
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin')
axis([-0.3,2.4,-0.05,0.5])
lsline 
arrow
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

% C:\Users\JDZ\Documents\Thesis\Data\Usable J vs t_Pt data\Si Films
[SiF, SiFfitting] = MOKE_data_in2(50, [200,800], [3:10]);
thesis_fig_gen(50:52)
figure(50); xlim([-1000, 10300]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 500]); title 'P-AP (H_4) transition - Si films'
figure(52); xlim([-1000, 7000]); ylim([-0.7,0.05])

% C:\Users\JDZ\Documents\Thesis\Data\Usable J vs t_Pt data\Si Particles
[SiP, SiPfitting] = MOKE_data_in2(47, [300,820], [3,5:9]);
thesis_fig_gen(47:49)
figure(47); xlim([-1000, 9000]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 450]); title 'P-AP (H_4) transition - Si Particles'
figure(49); xlim([-1000, 6000]); ylim([-0.27,0.05])

% C:\Users\JDZ\Documents\Thesis\Data\Usable J vs t_Pt data\Ge Particles
[GeP, GePfitting] = MOKE_data_in2(44, [300,820], [4:10]);
thesis_fig_gen(44:47)
figure(44); xlim([-1000, 6700]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 450]); title 'P-AP (H_4) transition - Ge Particles'
figure(46); xlim([-1000, 5000]); ylim([-0.5,0.05])

J_vs_TPt_plotting

%% plotter for all single sample measurements, major and minor. 

thesis_MOKE_single_SP8313_plotter

%% interaction energy plotter 

xline = linspace(-1e-5,1e-5,251);
yline = xline;
zline = logspace(-8,-6,100);
HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; tic; 
Msat = 1e6; mu_0 = 4*pi*1e-7;
magD = [2e-5, 2e-5, 2e-9]; 
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)]...
                = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end
end 

HzAkoun_interaction = HzAkoun*Msat*mu_0/4/pi;
HzAvInt = zeros(1,size(zline,2));
HzMaxInt = zeros(1,size(zline,2));

for pp = 1:size(zline,2)
    HzAvInt(pp) = mean(HzAkoun_interaction(:,:,pp), 'all');
    HzMaxInt(pp) = max(HzAkoun_interaction(:,:,pp),[], 'all');
end 

pp = figure(); yyaxis left; loglog(zline, HzAvInt); 
ylabel 'Mean field in XY plane [T]'; yyaxis right; loglog(zline, HzMaxInt)
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
Msat = 1e6; mu_0 = 4*pi*1e-7;
magD = [2e-5, 2e-5, 2e-9]; 
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)]...
                = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end
end 

HzAkoun_OOP = HzAkoun*Msat*mu_0/4/pi;
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
Msat = 1e6; mu_0 = 4*pi*1e-7;
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

HzAkoun_xzlineIP = HzAkoun*Msat*mu_0/4/pi;
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

fileID = fopen(name,'r'); letsC = fgets(fileID);
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
errorbar(mean(1./SiF.a), 1, (std(1./SiF.a)) , (std(1./SiF.a)),  'horizontal', 'rx'); 
hold on;
errorbar(mean(1./SiP.a), 2, (std(1./SiP.a)) , (std(1./SiP.a)),  'horizontal', 'bx');
errorbar(mean(1./GeP.a), 3, (std(1./GeP.a)) , (std(1./GeP.a)),  'horizontal', 'kx');
ylim([0,4])
legend('Si films' , 'Si particles', 'Ge particles')
xlabel 'a [Oe]'
title 'Comparison of decay constant'
thesis_fig_gen(kk.Number)

%% V2

kk = figure; 
errorbar(mean(1./SiF.a(2:end)), 1, (std(1./SiF.a(2:end))) , (std(1./SiF.a(2:end))),  'horizontal', 'rx'); 
hold on;
errorbar(mean(1./SiP.a), 2, (std(1./SiP.a)) , (std(1./SiP.a)),  'horizontal', 'bx');
errorbar(mean(1./GeP.a), 3, (std(1./GeP.a)) , (std(1./GeP.a)),  'horizontal', 'kx');
ylim([0,4])
legend('Si films' , 'Si particles', 'Ge particles')
xlabel 'a [Oe]'
title 'Comparison of decay constant'
thesis_fig_gen(kk.Number)

%%

[zz10] = fol_data_ext_function();
%datafolder: C:\Users\JDZ\Documents\Thesis\Data\VSM data for statistical stuff
figure
subplot(1,3,3)
fac = 6.5e-9;
yyt14 =  zz10(6).data(:,11) - zz10(5).data(:,11) ;
xt14 = zz10(5).data(:,6);

yy14 = yyt14 + (fac.*xt14);
plot(xt14,yy14.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muema]'
title 'SP8314'

subplot(1,3,1)
fac = 1.25e-8;
yyt12 =  zz10(4).data(:,11) - zz10(3).data(:,11) ;
xt12 = zz10(4).data(:,6);

yy14 = yyt12 + (fac.*xt12);
plot(xt12(1:60),yy14(1:60).*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muema]'
title 'SP8312'


%% Schematic to show the sigmoid in rotational SAF astroids

gh = figure;

x = -200:200;
y = zeros(size(x));
y(1:150) = -1;
y(300:end) = 1;
subplot(2,2,1)
plot(x,y,'r', x,-fliplr(y),'b')
xlabel 'Field'
ylabel 'Normalised moment'
h = gca;set(h,'Ytick', []);set(h,'Xtick', []);
thesis_fig_gen(gh.Number)
text(100,0.5,'+H_3','Color','red')
text(-100,-0.5,'-H_2','Color','red')
text(100,0.5,'+H_2','Color','blue')
text(-100,-0.5,'-H_3','Color','blue')

x = rad2deg(linspace(0,pi, 901));
y15= 1500.*cosd(x);
y5= 400.*cosd(x);
y10= 1000.*cosd(x);
mk = [1200,-600];


subplot(2,2,2)
plot((x),y15); ylim([-1600, 1600])
vline(acosd([-1200,600]./1500),'b:')
h = gca;set(h,'Ytick', sort([0,mk,-mk,1500]))
set(h, 'YTickLabel',fliplr({'B_s_e_t','\mu_0H_3','\mu_0H_2','0','-\mu_0H_2','-\mu_0H_3'}))

subplot(2,2,3)
plot((x),y10); ylim([-1600, 1600])
vline(acosd(600/1000),'b:')
h = gca;set(h,'Ytick', sort([0,mk,-mk,1000]))
set(h, 'YTickLabel',fliplr({'\mu_0H_3','B_s_e_t','\mu_0H_2','0','-\mu_0H_2','-\mu_0H_3'}))

subplot(2,2,4)
plot((x),y5); ylim([-1600, 1600])
h = gca;set(h,'Ytick', sort([0,mk,-mk,400]))
set(h, 'YTickLabel',fliplr({'\mu_0H_3','\mu_0H_2','B_s_e_t','0','-\mu_0H_2','-\mu_0H_3'}))


for dd = 2:4
    subplot(2,2,dd)
    hline(mk,'r:')
    hline(-mk,'b:')
    hline(0,'k-')
    xlim([0,180])
    xlabel 'Angle [deg]'
    ylabel 'B_\perp'
    thesis_fig_gen(gh.Number)
end


%%

[gtest] = sigmoidal_mem_funct_gen(1700:2300,2000, 5, 2);
title ''
xlabel 'B_\perp'
ylabel 'M/Msat'
h = gca;
set(h,'Xtick', [])
set(h,'Ytick', [0,0.5,1])
vline(2000,'r:')
hline(0.5, 'k:')
text(2020,0.15,'c','Fontsize',14,'Color','Red')
hold on
plot([gtest.params(1)-(1/gtest.params(2)),gtest.params(1)+(1/gtest.params(2))],[0.5,0.5],'m-')
plot([gtest.params(1)-(1/gtest.params(2)),gtest.params(1)-(1/gtest.params(2))],[0.47,0.53],'m-')
plot([gtest.params(1)+(1/gtest.params(2)),gtest.params(1)+(1/gtest.params(2))],[0.47,0.53],'m-')
text(1950,0.6,'2a','Fontsize',14,'Color','Magenta')
thesis_fig_gen(2)
%% FWHM studies on the series.

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter IV\FWHM for series.mat')
h = figure;
subplot(2,2,1)
scatter(mloc_SiF, -FWHM_SiF,'+'); hold on
scatter(mloc_SiP, -FWHM_SiP,'+')
scatter(mloc_GeP, -FWHM_GeP,'+')
xlabel 'H_J [Oe]'
ylabel 'FWHM [Oe]'
legend ('Si Films','Si Particles', 'Ge Particles')
thesis_fig_gen(h.Number)

dSiF = -[diff(mloc_SiF), mloc_SiF(end)-mloc_SiF(end-1)];
dSiP = -[diff(mloc_SiP), mloc_SiP(end)-mloc_SiP(end-1)];
dGeP = -[diff(mloc_GeP), mloc_GeP(end)-mloc_GeP(end-1)];
subplot(2,2,2)
scatter(mloc_SiF, dSiF,'+'); hold on
scatter(mloc_SiP, dSiP,'+');
scatter(mloc_GeP, dGeP,'+');
xlabel 'H_J [Oe]'
ylabel 'Separation [Oe]'
legend ('Si Films','Si Particles', 'Ge Particles')
thesis_fig_gen(h.Number)

subplot(2,2,3)
scatter(mloc_SiF, dSiF./-FWHM_SiF,'+'); hold on
scatter(mloc_SiP, dSiP./-FWHM_SiP,'+'); 
scatter(mloc_GeP, dGeP./-FWHM_GeP,'+'); 
xlabel 'H_J [Oe]'
ylabel 'Ratio of separation to FWHM [Oe]'
legend ('Si Films','Si Particles', 'Ge Particles')
thesis_fig_gen(h.Number)

subplot(2,2,4)
scatter(mloc_SiF, -FWHM_SiF./dSiF,'+'); hold on
scatter(mloc_SiP, -FWHM_SiP./dSiP,'+'); 
scatter(mloc_GeP, -FWHM_GeP./dGeP,'+'); 
xlabel 'H_J [Oe]'
ylabel 'Ratio of FWHM to separation[Oe]'
legend ('Si Films','Si Particles', 'Ge Particles')
thesis_fig_gen(h.Number)

[mean(-FWHM_SiF), mean(-FWHM_SiP), mean(-FWHM_GeP)]
[mean(dSiF./-FWHM_SiF), mean(dSiP./-FWHM_SiP), mean(dGeP./-FWHM_GeP)]
% % % 
% % % ist = SiF;
% % % isty = ist.dfdat;
% % % istx = ist.Bnorm;
% % % 
% % % fwhmx = zeros(1, size(isty,2));
% % % mloc = zeros(1, size(isty,2));
% % % 
% % % for gp = 1:size(isty,2)
% % %     data = isty(:,gp);
% % %     % Find the half max value.
% % %     halfMax = (min(data)) / 2;
% % %     % Find where the data first drops below half the max.
% % %     index1 = find(data <= halfMax, 1, 'first');
% % %     % Find where the data last rises above half the max.
% % %     index2 = find(data <= halfMax, 1, 'last');
% % %     fwhm = index2-index1 + 1; % FWHM in indexes.
% % %     % OR, if you have an x vector
% % %     fwhmx(gp) = istx(index2,gp) - istx(index1,gp);
% % %    
% % %     
% % %     mloc(gp) = istx(find(data == (min(data))),gp);
% % %     
% % % end
% % % 


%%



h = figure(1);
f = figure;

for tt = 1:4
    for pp = 1:3
        figure(h);
        subplot(2,2,tt); gcahol = gca; gcac = gcahol.Children; 
        figure(f); subplot(2,2,tt)
        plot(gcac(4-pp).XData, gcac(4-pp).YData, '--+')
        hold on 
    end
    legend('Si Films', 'Si Particles', 'Ge Particles')
    xlabel 'H_J [Oe]'
    thesis_fig_gen(f.Number);
end
subplot(2,2,1); ylabel 'FWHM [Oe]'
subplot(2,2,2); ylabel 'Separation [Oe]'
subplot(2,2,3); ylabel 'Ratio of separation to FWHM [Oe]'
subplot(2,2,4); ylabel 'Ratio of FWHM to separation [Oe]'

%% Single data plotters for RSA to demonstrate the switching

% Data file:
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\SP8313_rotational_switching_as

[zz] = fol_data_ext_function();

gg = figure;

subplot(2,2,1); n = 61;
plot(zz(n).data(:,7), zz(n).data(:,15).*1e6)
xlabel 'Angle [deg]'
ylabel 'm_\perp [\muemu]'
title 'Low field'
thesis_fig_gen(gg.Number)
subplot(2,2,2); n = 21;
plot(zz(n).data(:,7), zz(n).data(:,15).*1e6)
xlabel 'Angle [deg]'
ylabel 'm_\perp [\muemu]'
title 'Intermediate field'
vline(40,'r:'); vline(50,'r:')
thesis_fig_gen(gg.Number)
subplot(2,2,3); n = 27;
plot(zz(n).data(:,7), zz(n).data(:,15).*1e6)
xlabel 'Angle [deg]'
ylabel 'm_\perp [\muemu]'
title 'High field'
vline(125,'r:'); vline(135,'r:')
vline(65,'r:'); vline(55,'r:')
thesis_fig_gen(gg.Number)

%%