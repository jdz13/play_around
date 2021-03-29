load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p3.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist = SaveVar24p3;

% Start with defining the OD array. 
s_rad = ist.varst.s_rad;
OD = 4e-2;

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
h1 = legend ('1^s^t channel', '3^r^d channel', '5^t^h channel', '7^t^h channel');
 set(h1 ,'Location','Northwest');
thesis_fig_gen(ff.Number)
%% plotting the cross sectional field profile for different magnet lengths

R = 4e-2; 
L = 2e-2;
M = 1.27e6;
IB = 6e-3;

%extract data using user inputs
Zin50 = linspace(-6e-2,6e-2,150); Yin50 = linspace(-4e-2,4e-2, 100);
Xin50 = 0; tic
[ZY2] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);

L = 6e-2;
[ZY6] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);
L = 10e-2;
[ZY10] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);

ff = figure;
subplot(1,3,1); imagesc(Zin50, Yin50, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [m]'; ylabel 'Z [m]';  axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin50, Yin50, ZY6(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [m]'; ylabel 'Z [m]'; axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin50, Yin50, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [m]'; ylabel 'Z [m]'; axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)

%%
in = '--';
semilogy((ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,1), in, (ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,21),  in,(ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,41), in, (ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,61), in,(ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,81),in)
ylim([0.3,0.8]); xlim ([0,0.5]);

%% Draft 2D plot with old data

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

plotter = zeros(length(SaveVar21p2.varst.Lengths),length(SaveVar21p2.varst.PM));
for ff = 1:length(SaveVar21p2.varst.Lengths)
    for gg = 1:length(SaveVar21p2.varst.PM)
        
        plotter(ff,gg) = nnz(SaveVar21p2.SWres(4,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(SaveVar21p2.varst.Lengths.*100,SaveVar21p2.varst.PM.*100,plotter') 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%% Proving the artificial suppression of data in Srad studies 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p6.mat')
ist = SaveVar22p6;
in = '+--';
ff = figure;
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,1)))-1,nonzeros(ist.SWres(1,:,1,1,1,1)),in); hold on
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,21)))-1,nonzeros(ist.SWres(1,:,1,1,1,21)),in)
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,41)))-1,nonzeros(ist.SWres(1,:,1,1,1,41)),in)
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,61)))-1,nonzeros(ist.SWres(1,:,1,1,1,61)),in)
xlabel 'Channel number (n)'; ylabel 'Channel field [T]'
legend ('S_r_a_d = 0.25 [mm]', 'S_r_a_d = 0.5 [mm]', 'S_r_a_d = 0.75 [mm]', 'S_r_a_d = 1 [mm]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)

%% Evaluating channel widths for different start fields

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p4.mat')
ist = SaveVar24p4;
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
legend ('B_s_t_a_r_t = 0.6 [T]','B_s_t_a_r_t = 0.5 [T]','B_s_t_a_r_t = 0.4 [T]','B_s_t_a_r_t = 0.3 [T]','B_s_t_a_r_t = 0.2 [T]','B_s_t_a_r_t = 0.1 [T]', 'Location', 'Southeast')
thesis_fig_gen(ff.Number)

%% L study, what does the max field vs p look like for differing L 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist = SaveVar24p2;
in = '--';
ff = figure; x = ist.probe_line - ist.varst.PM/2;
semilogy(x,ist.MxB(1,:,1),in); hold on
semilogy(x,ist.MxB(1,:,21),in); hold on
semilogy(x,ist.MxB(1,:,41),in); hold on
semilogy(x,ist.MxB(1,:,61),in); hold on
semilogy(x,ist.MxB(1,:,81),in); hold on
xlabel 'p [mm]'; ylabel 'B_m_a_x(p) [T]'
legend ('L = 20 [mm]','L = 40 [mm]','L = 60 [mm]','L = 80 [mm]','L = 100 [mm]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)

%%

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

plotter = zeros(length(SaveVar21p2.varst.RES),length(SaveVar21p2.varst.PM));
for ff = 1:length(SaveVar21p2.varst.RES)
    for gg = 1:length(SaveVar21p2.varst.PM)
        
        plotter(ff,gg) = nnz(SaveVar21p2.SWres(4,:,gg,ff,5))-1;
        
    end 
end

ff = figure; 
subplot(1,2,1)
imagesc(SaveVar21p2.varst.RES,SaveVar21p2.varst.PM.*100,plotter') 
xlabel 'B_0 [T]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);


plotter = zeros(length(SaveVar21p2.varst.RES),length(SaveVar21p2.varst.Lengths));
for hh = 1:length(SaveVar21p2.varst.RES)
    for gg = 1:length(SaveVar21p2.varst.Lengths)
        
        plotter(hh,gg) = nnz(SaveVar21p2.SWres(4,:,5,hh,gg))-1;
        
    end 
end

subplot(1,2,2)
imagesc(SaveVar21p2.varst.RES,SaveVar21p2.varst.Lengths.*100,plotter') 
xlabel 'B_0 [T]'; ylabel 'L [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%% Looking at channel separations. Not really sure whats happening here. 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p4.mat')
ist = SaveVar24p4;
in = '+--';

ff = figure;
pt6 = nonzeros(ist.SWres(1,:,1,1));
pt5 = nonzeros(ist.SWres(1,:,1,11));
pt4 = nonzeros(ist.SWres(1,:,1,21));
pt3 = nonzeros(ist.SWres(1,:,1,31));

cmp6 = diff(pt6);
cmp5 = diff(pt5);
cmp4 = diff(pt4);
cmp3 = diff(pt3);
plot(cmp6); hold on; plot(cmp5); plot(cmp4); plot(cmp3);
legend ('B_s_t_a_r_t = 0.6 [T]','B_s_t_a_r_t = 0.5 [T]','B_s_t_a_r_t = 0.4 [T]','B_s_t_a_r_t = 0.3 [T]', 'Location', 'Southeast')
thesis_fig_gen(ff.Number)
%% Proper 2D scan data 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p10.mat')

ist = SaveVar29p10;
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

%% DRAFT? don't use, theres a script for this. 

theta = linspace(0,pi/2,9001); % define the angular resolution....
% Only up to 90 degrees, symmetry conditions help after.
KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 
Lengths = 2e-2; % Magnet lengths
pm_cl = 6e-2; % Magnet outer diameters.
s_rad = 1e-3; % define  sample radius (where the particles actually are)
con = 0.7; % condition to be applied to FWHM - 0.7 = 70/30 condition. 
D_prac = 10e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 10001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 
%Save outputs
[tester6] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con);
tester6.timer = toc; tester6.comments = "tester for figure 5.15 and 5.16";

[tester7] = search_tool_Caciagli_single_8p1p1_allatonce(KRV,RES,pm_cl,...
    Lengths,theta,Yin,Zin,s_rad,con);
%%
h = figure; 
plot(0:10,tester6.SWres(1:11),'b--+',0:4,tester7.SWres(1:5),'r--+');
hold on 
x = 0:10;
b_0 = tester7.B0p5(1,1);
TN = deg2rad(17.6);
TF = deg2rad(14.8);

y1 = b_0.*((cos(TN+TF).^x));
y2 = b_0.*cos((x.*TF)+TN);


plot(x,y1,'b--o',x(1:7),y2(1:7),'r--o')
axis([0,10,0,0.4])
legend ({' Dynamic - simulation results',' Static - simulation results', [ ' B_n = B_0cos^n(\theta_0+\theta_F)'],...
    ['B_n = B_0cos(n\theta_0+\theta_F)' ...
    ]}, 'Location' , 'Northeast')
xlabel 'Channel number (n)'
ylabel 'B_n [T]'
% set(h, 'WindowStyle', 'docked');
thesis_fig_gen(h.Number)

%% plotting up field components and fields at an angle. To describe how this is constructed. 

OD = 4.*1e-2; % Magnet outer diameters.
s_rad = 1e-3; % define the sample radius (where the particles will actually be
Xin = 5.37e-3+(OD/2);
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin; % Probe plane points in Z 
L = 4.*1e-2; % Magnet lengths
M = 1e6;

[Xunitx,Yunitx] = Bandit_Cac_UVs_V2(Xin,Yin,Zin,L/2,OD/2,M);
%%
hh = figure; 
subplot(1,2,2)
imagesc(Yin.*1e3, Zin.*1e3,Xunitx');
ylabel 'Y [mm]' 
xlabel 'Z [mm]'
title 'B_v_,_z'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,1])
thesis_fig_gen(hh.Number)
subplot(1,2,1)
imagesc(Yin.*1e3, Zin.*1e3,Yunitx');
ylabel 'Y [mm]' 
xlabel 'X [mm]'
title 'B_u_,_z'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,1])
thesis_fig_gen(hh.Number)

%%
hh = figure; 
for pull = 0:9
    subplot(4,3,pull+1); 
    Bxnew = Xunitx.*cos(deg2rad(10*pull)) + Yunitx.*sin(deg2rad(10*pull));
    imagesc(Yin.*1e3, Zin.*1e3,Bxnew')
    title (['\theta_m = ', num2str(10*pull), ' [deg]']); ylabel 'Y [mm]';
    c = colorbar;  c.Ruler.TickLabelFormat='%g [T]'; xlabel 'X [mm]'
    axis equal; axis([-1,1,-1,0]); thesis_fig_gen(hh.Number);
end 

theta = linspace(0,pi/2,9001);
B0p5 = zeros(1,length(theta));
B_maxes = zeros(1,length(theta));
B_mins = zeros(1,length(theta));
thetad = rad2deg(theta);

for pull = 1:length(theta)
    Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull));
    B0p5(pull) = median(Bxnew,'all');
    B_maxes(pull) = max(Bxnew,[],'all');
    B_mins(pull) = min(Bxnew,[],'all');
end 
subplot(3,4,[11,12]); plot(thetad, B0p5, thetad, B_maxes, thetad, B_mins); 
xlabel '\theta_m [deg]'; ylabel 'Field [T]'; thesis_fig_gen(hh.Number);
xlim([0,90]); legend ('median field', 'max field', 'min field',...
    'Location', 'Southwest'); thesis_fig_gen(hh.Number);

clear hh pull

%%
% model the median field B^0.5_x to prove it's pure cosine nature
gg= figure; plot(thetad, B0p5)
ft = fittype( 'a*cos(deg2rad(x))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.42]; 
[xData, yData] = prepareCurveData( thetad, B0p5);
[B0p5fit, gof] = fit( xData, yData, ft, opts );
hold on; plot(B0p5fit,'r:')
fstring = evalc('B0p5fit');
fstring2 = evalc('gof'); 
fstring(1:12) = [];fstring2(1:104) = [];
yL=get(gca,'YLim'); 
xL=get(gca,'XLim'); 
xt = xL(1) + 0.33*(diff(xL));
yt = yL(2) - 0.33*(diff(yL));
text(xt,yt, [fstring,fstring2])
xlabel '\theta_m [deg]'; ylabel 'Field [T]'; thesis_fig_gen(hh.Number);
xlim([0,90]); legend ('median field','fit','Location', 'Southwest'); 
thesis_fig_gen(gg.Number);
clear gg

%%
% single_runner

jo = figure;
plot(xtheta, NSAdata);
h = gca;vline(maxes)
legend('Channel 1','Channel 2', 'Location', 'Southwest')
xlim([0,90])
vline(maxes+(KRV*widths),'b:')
vline(maxes(1)+widths,'b:')
vline(maxes(1)-widths,'b:')
hline([0.3,0.5,0.7])
xlabel '\theta_m [deg]'
ylabel 'NSA'
xlim([0,40])
set(h,'Xtick', maxes)
hk = {'\theta_0', '\theta_1'};
set(h,'Xticklabels',hk)
set(h,'Ytick', [0,0.3,0.5,0.7,1])
annotation('arrow')
annotation('arrow')
text(17,0.9,'W_0_._3_-_0_._7')
thesis_fig_gen(jo.Number)

%%
%% plotting up field components and fields at an angle. To describe how this is constructed. 

OD = 4.*1e-2; % Magnet outer diameters.
s_rad = 1e-3; % define the sample radius (where the particles will actually be
Xin = 5.37e-3+(OD/2);
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin; % Probe plane points in Z 
L = 4.*1e-2; % Magnet lengths
M = 1e6;

[Xunitx,Yunitx] = Bandit_Cac_UVs_V2(Xin,Yin,Zin,L/2,OD/2,M);
% Field at theta_m = 0;
hh = figure; 
subplot(2,2,1)
imagesc(Yin.*1e3, Zin.*1e3,Xunitx');
ylabel 'Y [mm]' 
xlabel 'Z [mm]'
title 'B_u_,_x'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)
subplot(2,2,2)
imagesc(Yin.*1e3, Zin.*1e3,Yunitx');
ylabel 'Y [mm]' 
xlabel 'Z [mm]'
title 'B_v_,_x'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)
subplot(2,2,3)
imagesc(Yin.*1e3, Zin.*1e3,Xunitx');
ylabel 'Y [mm]' 
xlabel 'Z [mm]'
title 'B_x'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
[mask] = plane_mask(Yin,Zin,s_rad);
thesis_fig_gen(hh.Number)
subplot(2,2,4)
imagesc(Yin.*1e3, Zin.*1e3,mask');
ylabel 'Y [mm]' 
xlabel 'Z [mm]'
title 'Sample area'
c = colorbar;
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)
%% Field at theta_m = 0;
hh = figure; 
subplot(2,2,2)
imagesc(Yin.*1e3, Zin.*1e3,Xunitx');
ylabel 'Y [mm]' 
xlabel 'X [mm]'
title 'B_v_,_z'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)
subplot(2,2,1)
imagesc(Yin.*1e3, Zin.*1e3,Yunitx');
ylabel 'Y [mm]' 
xlabel 'X [mm]'
title 'B_u_,_z'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)
subplot(2,2,3)
imagesc(Yin.*1e3, Zin.*1e3,Xunitx');
ylabel 'Y [mm]' 
xlabel 'X [mm]'
title 'B_z'
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0])
[mask] = plane_mask(Yin,Zin,s_rad);
thesis_fig_gen(hh.Number)
subplot(2,2,4)
imagesc(Yin.*1e3, Zin.*1e3,mask');
ylabel 'Y [mm]' 
xlabel 'X [mm]'
title 'Sample area'
c = colorbar;
axis equal; axis([-1,1,-1,0])
thesis_fig_gen(hh.Number)

%%
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
[tester6] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con); tester6.timer = toc; 
[tester7] = search_tool_Caciagli_single_8p1p1_allatonce(KRV,RES,pm_cl,...
    Lengths,theta,Yin,Zin,s_rad,con); tester7.timer = toc; 
%%
n = 1;
ist = tester7;
Xin = ist.probe_line(find(ist.MxB(2:end) <0.42, 1,'first')+1);
[Xunitx,Yunitx] = Bandit_Cac_UVs_V2(Xin,Yin,Zin,Lengths/2,pm_cl/2,M);
hh = figure; theta = ist.MLOC(n);
Bxnew = Xunitx.*cos(theta) + Yunitx.*sin(theta);
subplot(1,2,1); imagesc(Yin.*1e3, Zin.*1e3,Bxnew');
ylabel 'Y [mm]'; xlabel 'X [mm]'; title 'B_z';
c = colorbar;  c.Ruler.TickLabelFormat='%g [T]';
axis equal; axis([-1,1,-1,0]); thesis_fig_gen(hh.Number)
[mask] = plane_mask(Yin,Zin,s_rad);
BZM = (Bxnew >= ist.SWres(n)) - (Bxnew <= -ist.SWres(n)); CM = BZM .* mask; subplot(1,2,2)
imagesc(Yin.*1e3, Zin.*1e3,CM');
ylabel 'Y [mm]'; xlabel 'X [mm]'; title 'Sample area'; c = colorbar;
axis equal; axis([-1,1,-1,0]); thesis_fig_gen(hh.Number)


%%

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
set(h, 'XTickLabel',{'0','\theta_0','\theta_F+\theta_0','\pi/2'})
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
[tester6] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con); tester6.timer = toc; 
[tester7] = search_tool_Caciagli_single_8p1p1_allatonce(KRV,RES,pm_cl,...
    Lengths,theta,Yin,Zin,s_rad,con); tester7.timer = toc; 

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

%% KRV study plotter

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p7.mat')
ist = SaveVar29p7;
plotter = zeros(1, length(ist.varst.KRV));
for gg = 1:length(ist.varst.KRV)
        plotter(gg) = nnz(ist.SWres(gg,:))-1;
end 
hh = figure;
plot(ist.varst.KRV, plotter)
xlabel 'KRV'
ylabel 'Number of possible channels'
jj = gca; 
tt = compose(['OD = ', num2str(ist.varst.PM*1e3), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(hh.Number)
clear hh gg

%%
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV26p1.mat')

ist = SaveVar26p1;

h3 = figure;

plotter = zeros(1, size(ist.SWres,8));

for mm = 1:size(ist.SWres,8)

    plotter(mm) = nnz(ist.SWres(1,:,1,1,1,1,1,mm));
    
end 
% clear mm 

plot(ist.varst.min_separation.*1e4, plotter)
xlabel 'Minimum separation value [Oe]'
ylabel 'Number of possible channels'
jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), '\n\nL = ', num2str(ist.varst.Lengths*1000),' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
thesis_fig_gen(h3.Number)

% clear h3 jj tt


%%
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
ylabel 'Number of possible channels'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nS_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nStart field = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%%

%% graph plotter for SV22p2. Shows max possible channels for a linescan in L

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p2.mat')
ist = SaveVar31p2;
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