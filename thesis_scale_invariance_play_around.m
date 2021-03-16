%% having a play about with testing the scale invariance of the code. 

%% starting with fields. 

% defining input space
Lengths = 2e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
IB = 6e-3; % Inner bore of the drive magnet [m]
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin; % Probe plane points in Z 
M = 1e6; % Msat of magnet used for drive field [A/m]
%Save outputs

r = 5e-3+pm_cl./2;
[main] = new3Dbanditunitvector(r,Yin,Zin,Lengths./2,pm_cl./2,M);
[IBs] = new3Dbanditunitvector(r,Yin,Zin,Lengths./2,IB./2,M);
Xunitx1 = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx1 = main(:,:,1,1,2) - IBs(:,:,1,1,2);
clear main IBs


hh = figure;
subplot(3,2,1); imagesc(Yin.*1e3, Zin.*1e3, Xunitx1'); title 'B_z_,_v (1)'
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-1,1,-1,1])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,2); imagesc(Yin.*1e3,Zin.*1e3, Yunitx1'); title 'B_z_,_u (1)'
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-1,1,-1,1])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';

n = 3.37; % whats the scale factor to try? 

Yin = n.*Yin;
Zin = Yin;
IB = n.*IB;
Lengths = n.*Lengths;
pm_cl = n.*pm_cl;

[main] = new3Dbanditunitvector(n.*r,Yin,Zin,Lengths./2,pm_cl./2,M);
[IBs] = new3Dbanditunitvector(n.*r,Yin,Zin,Lengths./2,IB./2,M);
Xunitx2 = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx2 = main(:,:,1,1,2) - IBs(:,:,1,1,2);
clear main IBs


subplot(3,2,3); imagesc(Yin.*1e3, Zin.*1e3, Xunitx2'); title (['B_z_,_v (',num2str(n),')'])
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-n,n,-n,n])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,4); imagesc(Yin.*1e3,Zin.*1e3, Yunitx2'); title (['B_z_,_u (',num2str(n),')'])
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-n,n,-n,n])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,5); imagesc((Xunitx2'-Xunitx1')./Xunitx2'.*100);xlabel 'X';
ylabel 'Y'; title 'Difference in B_z_,_v [%]';axis equal;axis([0,50,0,50]);
yticks([]);xticks([]); c = colorbar; c.Ruler.TickLabelFormat='%g [%%]';
subplot(3,2,6); imagesc((Yunitx2'-Yunitx1')./Yunitx2'.*100); xlabel 'X';
ylabel 'Y'; title 'Difference in B_z_,_u [%]';axis equal;axis([0,50,0,50]);
yticks([]); xticks([]); c = colorbar; c.Ruler.TickLabelFormat='%g [%%]';

for gg = 1:6
    subplot(3,2,gg)
    thesis_fig_gen(hh.Number)
end 

%% now of interest, do we get the same \eta value for scale similar models.

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

[otest] = search_tool_Caciagli_single_9p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con,IB); 

n = 3.37;

Yin = n.*Yin;
Zin = Yin(1:26);
IB = n.*IB;
Lengths = n.*Lengths;
s_rad = n.*s_rad;
pm_cl = n.*pm_cl;

[ntest] = search_tool_Caciagli_single_9p1(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con,IB); 


hh = figure;
clf; plot(0:length(nonzeros(otest.FWHMres))-1,(otest.SWres(1:length(nonzeros(otest.FWHMres)))))
hold on;plot(0:length(nonzeros(ntest.FWHMres))-1,(ntest.SWres(1:length(nonzeros(ntest.FWHMres)))))
xlabel 'Channel number n'
ylabel 'Channel value [T]'
yyaxis right 
rplot = ((otest.SWres(1:length(nonzeros(ntest.FWHMres)))) - (ntest.SWres(1:length(nonzeros(ntest.FWHMres)))))./(otest.SWres(1:length(nonzeros(ntest.FWHMres)))).*100;
plot(0:length(nonzeros(ntest.FWHMres))-1,rplot)
ylabel 'Percentage difference [%]'
legend ( 'Unit model',['Enlarged model - factor ', num2str(n)],'Percentage difference')
thesis_fig_gen(hh.Number)



%% What about if you don't change L. But it's much larger than s_rad?

% defining input space
Lengths = 5e-2; % Magnet lengths
pm_cl = 4e-2; % Magnet outer diameters.
IB = 6e-3; % Inner bore of the drive magnet [m]
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin; % Probe plane points in Z 
M = 1e6; % Msat of magnet used for drive field [A/m]
%Save outputs

r = 5e-3+pm_cl./2;
[main] = new3Dbanditunitvector(r,Yin,Zin,Lengths./2,pm_cl./2,M);
[IBs] = new3Dbanditunitvector(r,Yin,Zin,Lengths./2,IB./2,M);
Xunitx1 = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx1 = main(:,:,1,1,2) - IBs(:,:,1,1,2);
clear main IBs


hh = figure;
subplot(3,2,1); imagesc(Yin.*1e3, Zin.*1e3, Xunitx1'); title 'B_z_,_v (1)'
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-1,1,-1,1])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,2); imagesc(Yin.*1e3,Zin.*1e3, Yunitx1'); title 'B_z_,_u (1)'
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-1,1,-1,1])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';

n = 3.37; % whats the scale factor to try? 

Yin = n.*Yin;
Zin = Yin;
IB = n.*IB;
% Lengths = n.*Lengths;
pm_cl = n.*pm_cl;

[main] = new3Dbanditunitvector(n.*r,Yin,Zin,Lengths./2,pm_cl./2,M);
[IBs] = new3Dbanditunitvector(n.*r,Yin,Zin,Lengths./2,IB./2,M);
Xunitx2 = main(:,:,1,1,1) - IBs(:,:,1,1,1);
Yunitx2 = main(:,:,1,1,2) - IBs(:,:,1,1,2);
clear main IBs


subplot(3,2,3); imagesc(Yin.*1e3, Zin.*1e3, Xunitx2'); title (['B_z_,_v (',num2str(n),'), L unchanged'])
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-n,n,-n,n])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,4); imagesc(Yin.*1e3,Zin.*1e3, Yunitx2'); title (['B_z_,_u (',num2str(n),'), L unchanged'])
xlabel 'X [mm]'; ylabel 'Y [mm]'; axis equal; axis([-n,n,-n,n])
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
subplot(3,2,5); imagesc((Xunitx2'-Xunitx1')./Xunitx2'.*100);xlabel 'X';
ylabel 'Y'; title 'Difference in B_z_,_v [%]';axis equal;axis([0,50,0,50]);
yticks([]);xticks([]); c = colorbar; c.Ruler.TickLabelFormat='%g [%%]';
subplot(3,2,6); imagesc((Yunitx2'-Yunitx1')./Yunitx2'.*100); xlabel 'X';
ylabel 'Y'; title 'Difference in B_z_,_u [%]';axis equal;axis([0,50,0,50]);
yticks([]); xticks([]); c = colorbar; c.Ruler.TickLabelFormat='%g [%%]';

for gg = 1:6
    subplot(3,2,gg)
    thesis_fig_gen(hh.Number)
end 
