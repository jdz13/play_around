
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
clear mm1
mm2 = find(ist.probe_line - (ist.varst.PM/2) > 2e-3, 1, 'first');
mm4 = find(ist.probe_line - (ist.varst.PM/2) > 4e-3, 1, 'first');
mm6 = find(ist.probe_line - (ist.varst.PM/2) > 6e-3, 1, 'first');
mm8 = find(ist.probe_line - (ist.varst.PM/2) > 8e-3, 1, 'first');
mm10 = find(ist.probe_line - (ist.varst.PM/2) > 10e-3, 1, 'first');

hh = figure;
plot(ist.varst.Lengths.*1e3, squeeze(ist.MxB(1,mm2,:)))
xlabel 'L [mm]'
ylabel 'B_m_a_x(p) [T]'
hold on
plot(ist.varst.Lengths.*1e3, squeeze(ist.MxB(1,mm4,:)))
plot(ist.varst.Lengths.*1e3, squeeze(ist.MxB(1,mm6,:)))
plot(ist.varst.Lengths.*1e3, squeeze(ist.MxB(1,mm8,:)))
plot(ist.varst.Lengths.*1e3, squeeze(ist.MxB(1,mm10,:)))
ll = legend ('p = 2 [mm]','p = 4 [mm]','p = 6 [mm]','p = 8 [mm]','p = 10 [mm]');
set(ll,'Location', 'Southeast')
set(ll,'NumColumns', 2)
hline([0.3,0.35,0.4,0.45,0.5,0.55],'k:')
thesis_fig_gen(hh.Number)


%%

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist =SaveVar24p2;

% Start with defining the OD array. 
L = ist.varst.Lengths;
OD = 4e-2;

% Now the trickier bit, extracting p(B_0). The field value will be found in
% the definitions.
B0 = ist.varst.RES;

% Correlate this to the MxB probe array, for each magnet OD.
PB0 = zeros(1,size(L,2));
for cnt = 1:size(L,2)
    PB0(cnt) = ist.probe_line(1,find(ist.MxB(1,:,cnt) >= B0, 1, 'last'))-(OD/2);
end 

theta_s = atan(ist.varst.s_rad./(PB0+OD/2));

ff = figure;
plot(L.*1e3,PB0.*1e3)
yyaxis left; ylabel 'p(B_0,L) [mm]'; hold on
yyaxis right; plot(L.*1e3,rad2deg(theta_s));
ylabel '\theta_s [deg]'; xlabel 'L [mm]'
h1 = legend ('$p(B_0,L$)','$\theta_s = tan^{-1}(\frac{s_{rad}}{(p(B_0,OD)+(OD/2)}$)');
set(h1 ,'Interpreter','latex'); set(h1 ,'Location','East'); set(h1 ,'Fontsize',14)
thesis_fig_gen(ff.Number)

%%

%%
ist =SaveVar24p2;
R = ist.varst.PM; 
L1 = 2e-2;
M = 1e6;
IB = 6e-3;

%extract data using user inputs
Yin = linspace(-100e-3, 100e-3,51); % Probe plane points in Y 
Zin = linspace(-100e-3, 100e-3,51);
PL1 = 4.68e-3+R./2; tic
[ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
[ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
ZY2 = ZY2a-ZY2b;
L2 = 5e-2;PL2 = 6.07e-3+R./2;
[ZY5a] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,R./2,M);
[ZY5b] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,IB./2,M);
ZY5 = ZY5a-ZY5b;
L3 = 10e-2;PL3 = 5.69e-3+R./2;
[ZY10a] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,R./2,M);
[ZY10b] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,IB./2,M);
ZY10 = ZY10a-ZY10b;

ff = figure;
subplot(1,3,1); imagesc(Zin.*1e3, Yin.*1e3, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [mm]'; ylabel 'Z [mm]';  axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin.*1e3, Yin.*1e3, ZY5(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin.*1e3, Yin.*1e3, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)


hh = figure;
plot(Yin.*1e3, ZY2(26,:,1,1,1))
hold on 
plot(Yin.*1e3, ZY5(26,:,1,1,1))
plot(Yin.*1e3, ZY10(26,:,1,1,1))
xlabel 'Y [mm]'
ylabel 'Field [T]'
ll = legend ('OD = 40 [mm], L = 20 [mm], p = 4.68 [mm]', ...
    'OD = 40 [mm], L = 50 [mm], p = 6.07 [mm]',...
    'OD = 40 [mm], L = 100 [mm], p = 5.69 [mm]');
thesis_fig_gen(hh.Number)
xlim([-100,100])



%%

%%

ist =SaveVar24p2;
R = ist.varst.PM; 
L1 = 2e-2;
M = 1e6;
IB = 6e-3;

%extract data using user inputs
Yin = linspace(-60e-3, 60e-3,121); % Probe plane points in Y 
Zin = linspace(-60e-3, 60e-3,121);
PL1 = 2e-3+R./2; tic
[ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
[ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
ZY2 = ZY2a-ZY2b;
L2 = 5e-2;PL2 = 2e-3+R./2;
[ZY5a] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,R./2,M);
[ZY5b] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,IB./2,M);
ZY5 = ZY5a-ZY5b;
L3 = 10e-2;PL3 = 2e-3+R./2;
[ZY10a] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,R./2,M);
[ZY10b] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,IB./2,M);
ZY10 = ZY10a-ZY10b;

% L4 = 18e-2;PL4 = 2e-3+R./2;
% [ZY18a] = new3Dbanditunitvector(PL4,Yin,Zin,L4./2,R./2,M);
% [ZY18b] = new3Dbanditunitvector(PL4,Yin,Zin,L4./2,IB./2,M);
% ZY18 = ZY18a-ZY18b;

ff = figure;
subplot(1,3,1); imagesc(Zin.*1e3, Yin.*1e3, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [mm]'; ylabel 'Z [mm]';  axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin.*1e3, Yin.*1e3, ZY5(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin.*1e3, Yin.*1e3, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)

hh = figure;
plot(Yin.*1e3, ZY2(ceil(length(Zin)/2),:,1,1,1))
hold on 
plot(Yin.*1e3, ZY5(ceil(length(Zin)/2),:,1,1,1))
plot(Yin.*1e3, ZY10(ceil(length(Zin)/2),:,1,1,1))
% plot(Yin.*1e3, ZY18(26,:,1,1,1))
xlabel 'Y [mm]'
ylabel 'Field [T]'
ll = legend ('OD = 40 [mm], L = 20 [mm], p = 2 [mm]', ...
    'OD = 40 [mm], L = 50 [mm], p = 2 [mm]',...
    'OD = 40 [mm], L = 100 [mm], p = 2 [mm]');%,...
%     'OD = 40 [mm], L = 180 [mm], p = 2 [mm]');
thesis_fig_gen(hh.Number)
xlim([-60,60])
ylim([-0.1, 0.75])

%%

%%

% defining input space
theta = linspace(0,pi/2,9001); % define the angular resolution....
% Only up to 90 degrees, symmetry conditions help after.
KRV = 10; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 
Lengths = 2e-2; % Magnet lengths
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

[tester2] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con); 
Lengths = 5e-2;
[tester5] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con); 
Lengths = 10e-2;
[tester10] = search_tool_Caciagli_single_8p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con); 

%%

hh = figure;
plot((1:length(nonzeros(tester2.FWHMres)))-1,rad2deg(nonzeros(tester2.FWHMres)))
hold on
xlabel 'channel number n'
ylabel 'W_0_._3_-_0_._7 [deg]'
plot((1:length(nonzeros(tester5.FWHMres)))-1,rad2deg(nonzeros(tester5.FWHMres)))
plot((1:length(nonzeros(tester10.FWHMres)))-1,rad2deg(nonzeros(tester10.FWHMres)))
legend ('OD = 4 [cm], L = 2 [cm]','OD = 4 [cm], L = 5 [cm]','OD = 4 [cm], L = 10 [cm]')
thesis_fig_gen(hh.Number)

%%
% three options, tester2, tester5, tester10
ist = tester10;

% start_end = rad2deg([ist.varst.theta(ist.ind1res(1)), ist.varst.theta(ist.ind2res(1))])
Zin = Yin;
r = ist.probe_line(find(ist.MxB > ist.varst.RES.*1.05, 1, 'last'));
[main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM./2,M);
[IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

Xunitx = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx = main(:,:,1,1,2) - IBs(:,:,1,1,2);

[particle_loc] = plane_mask(Yin,Zin,ist.varst.s_rad);

k = 3; o = 7;
hh = figure;
subplot(k,o,1) 
imagesc(Yin.*1e3, Zin.*1e3, Xunitx')
xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
title (['B_v_,_z, L = ', num2str(ist.varst.Lengths.*1000), ' [mm]'])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(k,o,o+1) 
imagesc(Yin.*1e3, Zin.*1e3, Yunitx')
xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
title (['B_u_,_z, L = ', num2str(ist.varst.Lengths.*1000), ' [mm]'])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';

selThet = deg2rad(2*(6:11));
% initialise the plotting variables
CM = zeros(length(Yin), length(Zin), length(selThet));
Bxnew = zeros(length(Yin), length(Zin), length(selThet)+1);

Bxnew(:,:,1) =  Xunitx.*cos(deg2rad(10)) + Yunitx.*sin(deg2rad(10));

for pull = 1:length(selThet)
    Bxnew(:,:,pull+1) = Xunitx.*cos(selThet(pull)) + Yunitx.*sin(selThet(pull)); 
    BZM = (Bxnew(:,:,pull+1) >= ist.varst.RES) - (Bxnew(:,:,pull+1) <= -ist.varst.RES);
    % Correlate with where the particles actually are in the world
    CM(:,:,pull+1) = BZM .* particle_loc;
    subplot(k,o,pull+1)
    imagesc(Yin.*1e3, Zin.*1e3, Bxnew(:,:,pull+1)')
    xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
    title (['B_z at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    subplot(k,o,o+1+pull)
    imagesc(Yin.*1e3, Zin.*1e3, CM(:,:,pull+1)')
    xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
    title (['Area on/off at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    caxis([0,1]); Df = diff(Bxnew,1,3);    
    subplot(k,o,(2*o)+1+pull)
    imagesc(Yin.*1e3, Zin.*1e3, Df(:,:,pull)'./2.*1000)
    xlabel 'X [mm]'; ylabel 'Y [mm]';  axis equal; axis([-1,1,-1,1])
    title (['dB_z/d\theta at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
end


                       
%%


RES = 0.4; % Start field values. 
Lengths = linspace(2e-2,10e-2,81); % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
s_rad = 1e-3; % define  sample radius (where the particles actually are)
D_prac = 10e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 10001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
Yin = linspace(-1e-3,0,2); % Probe plane points in Y 
Zin = Yin;
%%
[MxB, probe_line] = MxBProbeMulti_V2(M,pm_cl, Lengths,D_prac,N_probe, IB); 
%%

BzuX = zeros(1, length(Lengths));
BzvX = zeros(1, length(Lengths));
BzvY = zeros(1, length(Lengths));

for tt = 1:length(Lengths)
    r = ist.probe_line(find(MxB(1,:,tt) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,Lengths(tt)./2,pm_cl./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    BzvX(tt) = abs(Xunitx(2,1)-Xunitx(2,2));
    BzvY(tt) = abs(Xunitx(1,2)-Xunitx(2,2));
    BzuX(tt) = abs(Yunitx(2,1)-Yunitx(2,2));
    
end 

hh = figure;
subplot(1,3,1)
plot(Lengths.*1e3, BzvX)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_v [T]'
title 'Range across B_z_,_v in X'
thesis_fig_gen(hh.Number)
subplot(1,3,2)
plot(Lengths.*1e3, BzvY)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_v [T]'
title 'Range across B_z_,_v in Y'
thesis_fig_gen(hh.Number)
subplot(1,3,3)
plot(Lengths.*1e3, 2*BzuX)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_u [T]'
title 'Range across B_z_,_u in X'
thesis_fig_gen(hh.Number)


%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,0,2); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.PM));
BzvX = zeros(1, length(ist.varst.PM));
BzvY = zeros(1, length(ist.varst.PM));

for tt = 1:length(ist.varst.PM)
    r = ist.probe_line(find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    BzvX(tt) = abs(Xunitx(2,1)-Xunitx(2,2));
    BzvY(tt) = abs(Xunitx(1,2)-Xunitx(2,2));
    BzuX(tt) = abs(Yunitx(2,1)-Yunitx(2,2));
    
end 

hh = figure;
subplot(1,3,1)
plot(ist.varst.PM.*1e3, BzvX)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_v [T]'
title 'Range across B_z_,_v in X'
thesis_fig_gen(hh.Number)
subplot(1,3,2)
plot(ist.varst.PM.*1e3, 2*BzvY)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_v [T]'
title 'Range across B_z_,_v in Y'
thesis_fig_gen(hh.Number)
subplot(1,3,3)
plot(ist.varst.PM.*1e3, BzuX)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_u [T]'
title 'Range across B_z_,_u in X'
thesis_fig_gen(hh.Number)

%%

ist = SaveVar24p2;
IB = 6e-3;
M = 1e6;
n = 81;
r = ist.probe_line(find(ist.MxB(1,:,n) > ist.varst.RES.*1.05, 1, 'last'));
[main] = new3Dbanditunitvector(r,ist.varst.Yin,ist.varst.Yin,ist.varst.Lengths(n)./2,ist.varst.PM./2,M);
[IBs] = new3Dbanditunitvector(r,ist.varst.Yin,ist.varst.Yin,ist.varst.Lengths(n)./2,IB./2,M);

Xunitx = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx = main(:,:,1,1,2) - IBs(:,:,1,1,2);

[particle_loc] = plane_mask(ist.varst.Yin,ist.varst.Yin,ist.varst.s_rad);

k = 3; o = 7;
hh = figure;
subplot(k,o,1) 
imagesc(ist.varst.Yin.*1e3, ist.varst.Yin.*1e3, Xunitx')
xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
title (['B_v_,_z, L = ', num2str(ist.varst.Lengths(n).*1000), ' [mm]'])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(k,o,o+1) 
imagesc(ist.varst.Yin.*1e3, ist.varst.Yin.*1e3, Yunitx')
xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
title (['B_u_,_z, L = ', num2str(ist.varst.Lengths(n).*1000), ' [mm]'])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';

selThet = deg2rad(2*(6:11));
% initialise the plotting variables
CM = zeros(length(ist.varst.Yin), length(ist.varst.Yin), length(selThet));
Bxnew = zeros(length(ist.varst.Yin), length(ist.varst.Yin), length(selThet)+1);

Bxnew(:,:,1) =  Xunitx.*cos(deg2rad(10)) + Yunitx.*sin(deg2rad(10));

for pull = 1:length(selThet)
    Bxnew(:,:,pull+1) = Xunitx.*cos(selThet(pull)) + Yunitx.*sin(selThet(pull)); 
    BZM = (Bxnew(:,:,pull+1) >= ist.varst.RES) - (Bxnew(:,:,pull+1) <= -ist.varst.RES);
    % Correlate with where the particles actually are in the world
    CM(:,:,pull+1) = BZM .* particle_loc;
    subplot(k,o,pull+1)
    imagesc(ist.varst.Yin.*1e3, ist.varst.Yin.*1e3, Bxnew(:,:,pull+1)')
    xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
    title (['B_z at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    subplot(k,o,o+1+pull)
    imagesc(ist.varst.Yin.*1e3, ist.varst.Yin.*1e3, CM(:,:,pull+1)')
    xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar; axis equal; axis([-1,1,-1,1])
    title (['Area on/off at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    caxis([0,1]); Df = diff(Bxnew,1,3);    
    subplot(k,o,(2*o)+1+pull)
    imagesc(ist.varst.Yin.*1e3, ist.varst.Yin.*1e3, Df(:,:,pull)'./2.*1000)
    xlabel 'X [mm]'; ylabel 'Y [mm]';  axis equal; axis([-1,1,-1,1])
    title (['dB_z/d\theta at ', num2str(rad2deg(selThet(pull))),' [deg]'])
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
end

clear main IB IBs k M n o particle_loc pull r selThet c CM BZM BxNew Xunitx Yunitx hh Df Bxnew

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,0,2); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.PM));
BzvX = zeros(1, length(ist.varst.PM));
BzvY = zeros(1, length(ist.varst.PM));
cnt = -1;
% figure
for tt = 1:length(ist.varst.PM) 
    cnt = cnt + 2;
    r = ist.probe_line(tt,find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
 
    BzvX(tt) = abs(Xunitx(2,1)-Xunitx(2,2));
    BzvY(tt) = abs(Xunitx(1,2)-Xunitx(2,2));
    BzuX(tt) = abs(Yunitx(2,1)-Yunitx(2,2));
    
end 

hh = figure;
subplot(1,3,1)
plot(ist.varst.PM.*1e3, BzvX.*1e3)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_v [mT]'
title 'Range across B_z_,_v in X'
thesis_fig_gen(hh.Number)
subplot(1,3,2)
plot(ist.varst.PM.*1e3, 2*BzvY.*1e3)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_v [mT]'
title 'Range across B_z_,_v in Y'
thesis_fig_gen(hh.Number)
subplot(1,3,3)
plot(ist.varst.PM.*1e3, BzuX.*1e3)
xlabel 'OD [mm]'
ylabel 'Range across B_z_,_u [mT]'
title 'Range across B_z_,_u in X'
thesis_fig_gen(hh.Number)


%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist  = SaveVar24p2;

Yin = linspace(-1e-3,0,2); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.Lengths));
BzvX = zeros(1, length(ist.varst.Lengths));
BzvY = zeros(1, length(ist.varst.Lengths));
cnt = -1;

% figure
for tt = 1:length(ist.varst.Lengths) 
    cnt = cnt + 2;
    r = ist.probe_line(find(ist.MxB(1,:,tt) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
 
    BzvX(tt) = abs(Xunitx(2,1)-Xunitx(2,2));
    BzvY(tt) = abs(Xunitx(1,2)-Xunitx(2,2));
    BzuX(tt) = abs(Yunitx(2,1)-Yunitx(2,2));
    
end 

hh = figure;
subplot(1,3,1)
plot(ist.varst.Lengths.*1e3, BzvX.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_v [mT]'
title 'Range across B_z_,_v in X'
thesis_fig_gen(hh.Number)
subplot(1,3,2)
plot(ist.varst.Lengths.*1e3, 2*BzvY.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_v [mT]'
title 'Range across B_z_,_v in Y'
thesis_fig_gen(hh.Number)
subplot(1,3,3)
plot(ist.varst.Lengths.*1e3, BzuX.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z_,_u [mT]'
title 'Range across B_z_,_u in X'
thesis_fig_gen(hh.Number)

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
gg = figure;
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
    
%     figure(gg)
%     subplot(3,2,cnt)
%     imagesc(Yin.*1e3, Zin.*1e3, Xunitx); xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar
%     title (['B_z_,_v - OD = ', num2str(ist.varst.PM(tt).*100), ' [cm]'])
%     subplot(3,2,cnt+1)
%     imagesc(Yin.*1e3, Zin.*1e3, Yunitx); xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar
%     title (['B_z_,_u - OD = ', num2str(ist.varst.PM(tt).*100), ' [cm]'])
    
    Bxnew(:,:,1) = Xunitx.*cos(ist.MLOC(1,1,tt)-deg2rad(1)) + Yunitx.*sin(ist.MLOC(1,1,tt)-deg2rad(1));
    Bxnew(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,tt)) + Yunitx.*sin(ist.MLOC(1,1,tt));
    df = diff(Bxnew,1,3);
    dfp(tt) = df(1)-df(end);
    dfm(tt) = mean(df,'all');
    
end 

    figure(hh)
    plot(ist.varst.PM.*100 ,dfp.*1e3)
    xlabel 'OD [cm]'; ylabel 'dB_z/d\theta range [mT/deg]'; 
    yyaxis right ; plot(ist.varst.PM.*100 ,dfm.*1e3)
    ylabel 'mean dB_z/d\theta [mT/deg]'; 
    title 'dB_z/d\theta range across the transition centre for varying OD'
    
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
gg = figure;
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
    
%     figure(gg)
%     subplot(3,2,cnt)
%     imagesc(Yin.*1e3, Zin.*1e3, Xunitx); xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar
%     title (['B_z_,_v - OD = ', num2str(ist.varst.PM(tt).*100), ' [cm]'])
%     subplot(3,2,cnt+1)
%     imagesc(Yin.*1e3, Zin.*1e3, Yunitx); xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar
%     title (['B_z_,_u - OD = ', num2str(ist.varst.PM(tt).*100), ' [cm]'])
    
    Bxnew(:,:,1) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)-deg2rad(1)) + Yunitx.*sin(ist.MLOC(1,1,1,1,tt)-deg2rad(1));
    Bxnew(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)) + Yunitx.*sin(ist.MLOC(1,1,1,1,tt));
    df = diff(Bxnew,1,3);
    dfp(tt) = df(1)-df(end);
    dfm(tt) = mean(df,'all');
    
end 

    figure(hh)
    plot(ist.varst.Lengths.*100 ,dfp.*1e3)
    xlabel 'L [cm]'; ylabel 'dB_z/d\theta range [mT/deg]'; 
    yyaxis right ; plot(ist.varst.Lengths.*100 ,dfm.*1e3)
    ylabel 'mean dB_z/d\theta [mT/deg]'
    title 'dB_z/d\theta range across the transition centre for varying L'
    
    
%%
%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,1e-3,5); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzX = zeros(1, length(ist.varst.PM));
BzY = zeros(1, length(ist.varst.PM));
cnt = -1;

for tt = 1:length(ist.varst.PM) 
    cnt = cnt + 2;
    r = ist.probe_line(tt,find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
        
    Bxnew = Xunitx.*cos(ist.MLOC(1,1,tt)) +Yunitx.*sin(ist.MLOC(1,1,tt));
     
    BzX(tt) = abs(Bxnew(3,1) - Bxnew(3,5));
    BzY(tt) = abs(Bxnew(1,3) - Bxnew(3,3));
    
end 

hh = figure;
subplot(1,2,1)
plot(ist.varst.PM.*1e3, BzX.*1e3)
xlabel 'OD [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in X'
thesis_fig_gen(hh.Number)
subplot(1,2,2)
plot(ist.varst.PM.*1e3, BzY.*1e3)
xlabel 'OD [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in Y'
thesis_fig_gen(hh.Number)


%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p2.mat')
ist  = SaveVar24p2;

Yin = linspace(-1e-3,1e-3,5); % Probe plane points in Y 
Zin = Yin;
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

BzuX = zeros(1, length(ist.varst.Lengths));
BzvX = zeros(1, length(ist.varst.Lengths));
BzvY = zeros(1, length(ist.varst.Lengths));
cnt = -1;

% figure
for tt = 1:length(ist.varst.Lengths) 
    cnt = cnt + 2;
    r = ist.probe_line(find(ist.MxB(1,:,tt) > ist.varst.RES.*1.05, 1, 'last'));
    [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
    [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

    Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
    Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';
    
    Bxnew = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)) +Yunitx.*sin(ist.MLOC(1,1,1,1,tt));
     
    BzX(tt) = abs(Bxnew(3,1) - Bxnew(3,5));
    BzY(tt) = abs(Bxnew(1,3) - Bxnew(3,3));
    
end 

hh = figure;
subplot(1,2,1)
plot(ist.varst.Lengths.*1e3, BzX.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in X'
thesis_fig_gen(hh.Number)
subplot(1,2,2)
plot(ist.varst.Lengths.*1e3, BzY.*1e3)
xlabel 'L [mm]'
ylabel 'Range across B_z [mT]'
title 'Range across B_z in Y'
thesis_fig_gen(hh.Number)

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
    
    subplot(4,3,cnt)
    imagesc(Yin.*1e3,Zin.*1e3, Bxnew)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose(['B_z for L = ', num2str(ist.varst.Lengths(tt).*100),...
        ' [cm]\n at p = ', num2str((r-(ist.varst.PM/2)).*1e3), ...
        ' [mm] and at ', num2str(rad2deg(ist.MLOC(1,1,tt))),' [deg]']))
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    thesis_fig_gen(hh.Number)
    
    subplot(4,3,cnt+3)
    imagesc(Yin.*1e3,Zin.*1e3, CM)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose('Sample area above/below \n switching field'))
    colorbar; caxis([0,1])
    thesis_fig_gen(hh.Number)
        
    subplot(4,3,cnt+6)
    plot(Yin.*1e3, Bxnew(:,26))
    xlabel 'distance across the sample (x,y) [mm]'
    ylabel 'Field across X = 0'
    yyaxis right; plot(Yin.*1e3, Bxnew(26,:))
    ylabel 'Field across Y = 0'
    legend ('field at x = 0', 'field at y = 0')
    thesis_fig_gen(hh.Number)
    
    dd(:,:,1) = Bxnew;
    dd(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,1,1,tt)-deg2rad(1)) +Yunitx.*sin(ist.MLOC(1,1,1,1,tt)-deg2rad(1));
        
    subplot(4,3,cnt+9)
    imagesc(Yin.*1e3, Zin.*1e3, diff(dd,1,3).*1e3)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title ('dB_z/d\theta across the transition')
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
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
    
    subplot(4,3,cnt)
    imagesc(Yin.*1e3,Zin.*1e3, Bxnew)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose(['B_z for OD = ', num2str(ist.varst.PM(tt).*100),...
        ' [cm]\n at p = ', num2str((r-(ist.varst.PM(tt)./2)).*1e3), ...
        ' [mm] and at ', num2str(rad2deg(ist.MLOC(1,1,tt))),' [deg]']))
    c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
    thesis_fig_gen(hh.Number)
    
    subplot(4,3,cnt+3)
    imagesc(Yin.*1e3,Zin.*1e3, CM)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title (compose('Sample area above/below \n switching field'))
    colorbar; caxis([0,1])
    thesis_fig_gen(hh.Number)
        
    subplot(4,3,cnt+6)
    plot(Yin.*1e3, Bxnew(:,26))
    xlabel 'distance across the sample (x,y) [mm]'
    ylabel 'Field across X = 0'
    yyaxis right; plot(Yin.*1e3, Bxnew(26,:))
    ylabel 'Field across Y = 0'
    legend ('field at x = 0', 'field at y = 0')
    thesis_fig_gen(hh.Number)
    
    dd(:,:,1) = Bxnew;
    dd(:,:,2) = Xunitx.*cos(ist.MLOC(1,1,tt)-deg2rad(1)) +Yunitx.*sin(ist.MLOC(1,1,tt)-deg2rad(1));
        
    subplot(4,3,cnt+9)
    imagesc(Yin.*1e3, Zin.*1e3, diff(dd,1,3).*1e3)
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    title ('dB_z/d\theta across the transition')
    c = colorbar; c.Ruler.TickLabelFormat='%g [mT/deg]';
    thesis_fig_gen(hh.Number)
 
end 
