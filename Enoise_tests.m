

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV29p6.mat')

ist = SaveVar29p6;

%%


mxt = ist.MxB(11,:,1);

figure;
plot(ist.probe_line(11,:),mxt)

%%
tic
D_prac = 2.25e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 22501; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
Lengths = 2e-2;
pm_cl = 6e-2;

% Find the maximum field (theta = 0) at each z probe point, for each set of
% magnet parameters (L,OD)
[MxB, probe_line] = MxBProbeMulti_V2(M,pm_cl, Lengths,D_prac,N_probe, IB);
%%
toc
figure;
plot(probe_line-(pm_cl/2), MxB)

%%
tol = 2e-7;

pzcut1 =  find(MxB >= 0.2, 1, 'last')
pzcut2 =  find(MxB >= 0.2+tol, 1, 'last')


%%

figure;
semilogy(probe_line-(pm_cl/2), MxB)

%%

tic

M = 1e6; 
zline = linspace(-2.5e-3,2.5e-3,26);
yline = zline;
Lengths = 2e-2;
pm_cl = 6e-2;
IB = 6e-3;

xline = 10e-3+(pm_cl/2)+1e-6;

[BcartOD] = new3Dbanditunitvector(xline,yline,zline,Lengths/2,pm_cl/2,M);
[BcartIB] = new3Dbanditunitvector(xline,yline,zline,Lengths/2,IB/2,M);
Bcart = BcartOD - BcartIB;


meanB0 = mean(Bcart(:,:,1,1,1),'all');
meanangB = zeros(1,901);
count = 0;
for theta = deg2rad(linspace(0,90,901))
    count = count+1;
    newBx = Bcart(:,:,1,1,1).*cos(theta)+Bcart(:,:,1,1,2).*sin(theta);
    meanangB(count) = mean(newBx,'all');
end 

tht = linspace(0,90,901);
test1 = meanB0.*cosd(tht);

kk = figure; yyaxis left; plot(tht,meanangB,'--', tht, test1,':'); ylabel 'Average field [T]'
yyaxis right; plot(tht, (meanangB-test1)./test1); ylabel 'Percentage difference [%]'
xlabel 'Angle [deg]'; 
legend ('using mean([B_v_,_zcos(\theta_M)+B_u_,_zsin(\theta_M)])', 'using mean(B_u_,_z(\theta_M=0))\cdotcos(\theta_M)','Percentage difference','Location','Northeast')
thesis_fig_gen(kk.Number); xlim([0,90])

toc

%%

IB = 6e-3;
M = 1e6; 
L1 = 2e-2;
R = 6e-2;

%extract data using user inputs
Yin = linspace(-2.5e-3,2.5e-3,26); % Probe plane points in Y 
Zin = linspace(-2.5e-3,2.5e-3,26);
PL1 = 4.68e-3+R./2; tic
[ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
[ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
ZY2 = ZY2a-ZY2b;


ff = figure;
imagesc(Zin.*1e3, Yin.*1e3, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [mm]'; ylabel 'Z [mm]'; 

%%


tic

M = 1e6; 
zline = linspace(-2.5e-3,2.5e-3,26);
yline = zline;
Lengths = 2e-2;
pm_cl = 6e-2;
IB = 6e-3;

xline = 10e-3+(pm_cl/2)+1e-6;

count = 0;

dispx = linspace(0,1e-3,10);

dispy = dispx;
res_disp = zeros(length(dispx),length(dispy));

for yy = 1:length(dispy)
    
    ylinet = yline+dispy(yy);
    
    for xx = 1:length(dispx)
        
        zlinet = zline+dispx(xx);
        [BcartOD] = new3Dbanditunitvector(xline,ylinet,zlinet,Lengths/2,pm_cl/2,M);
        [BcartIB] = new3Dbanditunitvector(xline,ylinet,zlinet,Lengths/2,IB/2,M);
        Bcart = BcartOD - BcartIB;
        res_disp(xx,yy)  = mean(Bcart(:,:,1,1,1),'all');
        clear BcartOD BcartIB Bcart
        count = count+1;
        if rem(count,10) == 0 
            disp(count)
        end 
    end
end

delB0 = res_disp-res_disp(1,1);

gg = figure; 
imagesc(dispx.*1e3, dispy.*1e3, delB0.*1e4)
c = colorbar;
xlabel 'X displacement [mm]'
ylabel 'Y displacment [mm]'

f = 20; % [Hz]
Rcoil = 1e-3;
A = pi.*Rcoil^2;
E = delB0.*f.*A;

hh = figure;
imagesc(dispx.*1e3, dispy.*1e3, E)
cc = colorbar;
xlabel 'X displacement [mm]'
ylabel 'Y displacment [mm]'


%%

clear tester tester2
dispx = linspace(0,1e-3, 51);
[tester] = Noise_EMF(dispx, dispx, 0);
gg = figure; imagesc(tester.dispx.*1e3, tester.dispy.*1e3,tester.EMF.*1e9); 
xlabel 'X displacement [mm]'
ylabel 'Y displacment [mm]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [nT]';
set(get(c,'label'),'string','Noise from a displacement in X and Y'); 
thesis_fig_gen(gg.Number)

dispz = linspace(0,0.5e-3,501);
[tester2] = Noise_EMF(0,0, dispz);
gg = figure; plot(tester2.dispz.*1e3, squeeze(tester2.EMF).*1e9);
xlabel 'displacement in Z [mm]'; ylabel 'EMF [nV]'
thesis_fig_gen(gg.number)