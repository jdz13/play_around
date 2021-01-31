%%

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
[tester6] = search_tool_Caciagli_single_7p2(KRV,RES,pm_cl,Lengths,theta,...
    Yin,Zin,s_rad,con);
tester6.timer = toc; tester6.comments = "tester for figure 5.15 and 5.16";

[tester7] = search_tool_Caciagli_single_7p2p1_allatonce(KRV,RES,pm_cl,...
    Lengths,theta,Yin,Zin,s_rad,con);
tester7.timer = toc; tester7.comments = "eq for tester 6";

%%

pzcut =  find(tester6.MxB >= 1.05*RES, 1, 'last');

[XunitX,YunitX] = Bandit_Cac_UVs(tester6.probe_line(pzcut),...
                            Yin,Zin,Lengths./2,pm_cl./2,M);
% Now we need to take the internal bore and subtract
% this to get the proper field values.
[IBx, IBy] = Bandit_Cac_UVs(tester6.probe_line(pzcut),...
    Yin,Zin,Lengths./2,IB./2,M);
% Create the real unit vectors, subtractions of the
% magnet with the internal bore.
Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;

%%

% Figure out where the sample sits within the probe plane, to convolute
% with the moment. 
[particle_loc1] = plane_mask(Yin,Zin,s_rad);
% Completed for positive half only, so flip and add to array (skip middle)
particle_loc = [particle_loc1, fliplr(particle_loc1(:, 1:(size(particle_loc1,2)-1)))];
% create a control variable - total cells within the sample area (all 'on')
control = sum(sum(particle_loc));

%%

ff = figure;
subplot(2,1,1)
imagesc(Yin, Zin,  Xunitx); title 'B(p_0,y,z)'
ylabel 'Z [m]'; xlabel 'Y [m]';  colorbar; thesis_fig_gen(ff.Number);
axis equal; axis([-1e-3,1e-3,-1e-3,0]); subplot(2,1,2)
imagesc(Yin, Zin, particle_loc1); title 'Sample area'
ylabel 'Z [m]'; xlabel 'Y [m]'; colorbar; thesis_fig_gen(ff.Number)
axis equal; axis([-1e-3,1e-3,-1e-3,0]); clear ff

%%
h5  = figure; subplot(2,2,1); 
xx = rad2deg(tester6.varst.theta); yy = tester6.masterNVC(1,:); 
plot(xx, yy, '-'); t1 =  find(yy >= 0.5, 1, 'last');hold on
t2 =  find(yy >= 0.3, 1, 'last');
t3 =  find(yy >= 0.7, 1, 'last'); xlim([10,25]);
vline(xx(t2)); vline(xx(t3)); plot(xx(t1),yy(t1),'ro');
xlabel 'Theta [deg]'; ylabel 'NSA'; 
thesis_fig_gen(h5.Number); subplot(2,2,2); 
xx = (tester6.probe_line-pm_cl/2).*1e3; semilogy(xx, tester6.MxB);
thesis_fig_gen(h5.Number); hold on; ylabel 'B_m_a_x(p) [T]'; 
t4 =  find(tester6.MxB >= 1.05*RES, 1, 'last'); xlabel 'p [mm]';

plot(xx(t4),tester6.MxB(t4),'ro'); vline(xx(t4))
subplot(2,2,3); ang = (tester6.varst.theta(t1)); 
Bxnew = Xunitx.*cos(ang) + Yunitx.*sin(ang); imagesc(Yin, Zin,  Bxnew'); 
xlabel 'Z [m]'; ylabel 'Y [m]';  colorbar; 
thesis_fig_gen(h5.Number); axis equal; axis([-1e-3,1e-3,-1e-3,0]); 
subplot(2,2,4); BZM = (Bxnew >= RES) - (Bxnew <= -RES); 
CM = BZM .* particle_loc1; imagesc(Yin, Zin,  CM');
xlabel 'Z [m]'; ylabel 'Y [m]';  colorbar; thesis_fig_gen(h5.Number); 
axis equal; axis([-1e-3,1e-3,-1e-3,0]); 
clear xx yy h5 t1 t2 t3 t4 Bxnew CM BZM

