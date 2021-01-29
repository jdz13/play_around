%% Comparison of fields from Mumax and Caciagli for toruses
% big note here is that there is a permutation of axes between mumax and
% Caciagli, with the relationship
%
% z_mumax = x_caciagli
% y_mumax = z_caciagli
% x_mumax = y_caciagli
%
% All things have to be considered with this permutation.


%% input the data from Mumax
[Xunit] = Mumax_data_extractor();
% [Yunit] = Mumax_data_extractor();
[X23] = Mumax_data_extractor();
[X67] = Mumax_data_extractor();

Mdl_dtl = Xunit.Mdl_dtl;
%% Calculate the field for equivalent systems to the Mumax model
% user inputs 
noin = 50;
L = 2e-2; 
R = L;
M = 1.27e6;
IB = 6e-3;

%extract data using user inputs
Yin = Mdl_dtl.pureliney; Zin = Mdl_dtl.purelinez;
Xin = Mdl_dtl.purelinex;
[BcartODnew] = new3Dbanditunitvector(Xin,Yin,Zin,L./2,R./2,M);

% Now we need to take the internal bore and subtract
% this to get the proper field values.

[BcartIBnew] = new3Dbanditunitvector(Xin,Yin,Zin,L./2,IB./2,M);
%%
% Create the real unit vectors, subtractions of the
% magnet with the internal bore.
Xunitxnew = BcartODnew(:,:,:,1,1) - BcartIBnew(:,:,:,1,1); 
Yunitxnew = BcartODnew(:,:,:,1,2) - BcartIBnew(:,:,:,1,2);

%% comparison at theta = 0 

Xunitxnew = BcartODnew(:,:,:,1,1) - BcartIBnew(:,:,:,1,1);
BxYnew = BcartODnew(:,:,:,2,1) - BcartIBnew(:,:,:,2,1);
BxZnew = BcartODnew(:,:,:,3,1) - BcartIBnew(:,:,:,3,1);


h0 = figure;
subplot(2,3,1); imagesc(Yin, Zin, squeeze(Xunitxnew(:,:,noin)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(2,3,2); imagesc(Yin, Zin, squeeze(BxYnew(:,:,noin)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_y'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(2,3,3); imagesc(Yin, Zin, squeeze(BxZnew(:,:,noin)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_z'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'

subplot(2,3,4); imagesc(Yin, Zin, squeeze(Xunit.Bz(:,:,noin)));  axis equal
title 'Mumax B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'; 
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,5); imagesc(Yin, Zin, squeeze(Xunit.Bx(:,:,noin)));  axis equal
title 'Mumax B_y'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,6); imagesc(Yin, Zin, squeeze(Xunit.By(:,:,noin)));  axis equal
title 'Mumax B_z'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
set(h0,'Position', [200 200 950 450])

%%

%% comparison at theta = 0, looking at a cross section through the toroid

Xunitxnew = BcartODnew(:,:,:,1,1) - BcartIBnew(:,:,:,1,1);
BxYnew = BcartODnew(:,:,:,2,1) - BcartIBnew(:,:,:,2,1);
BxZnew = BcartODnew(:,:,:,3,1) - BcartIBnew(:,:,:,3,1);

noin = 26;
h0 = figure;
subplot(2,3,1); imagesc(Yin, Zin, squeeze(Xunitxnew(:,noin,:)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
subplot(2,3,2); imagesc(Yin, Zin, squeeze(BxYnew(:,noin,:)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_y'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
subplot(2,3,3); imagesc(Yin, Zin, squeeze(BxZnew(:,noin,:)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_z'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'

subplot(2,3,4); imagesc(Yin, Zin, squeeze(Xunit.Bz(:,noin,:)));  axis equal
title 'Mumax B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'; 
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,5); imagesc(Yin, Zin, squeeze(Xunit.Bx(:,noin,:)));  axis equal
title 'Mumax B_y'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,6); imagesc(Yin, Zin, squeeze(Xunit.By(:,noin,:)));  axis equal
title 'Mumax B_z'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
set(h0,'Position', [200 200 950 450])

D1 = (squeeze(Xunitxnew(:,noin,:))-squeeze(Xunit.Bz(:,noin,:)))./squeeze(Xunit.Bz(:,noin,:));
D2 = (squeeze(BxYnew(:,noin,:))-squeeze(Xunit.Bx(:,noin,:)))./squeeze(Xunit.Bx(:,noin,:));
D3 = (squeeze(BxZnew(:,noin,:))-squeeze(Xunit.By(:,noin,:)))./squeeze(Xunit.By(:,noin,:));
h1 = figure;
subplot(1,3,1); imagesc(Yin, Zin, D1);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'B_x difference'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
subplot(1,3,2); imagesc(Yin, Zin, D2);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'B_y difference'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
subplot(1,3,3); imagesc(Yin, Zin, D3);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'B_z difference'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
set(h1,'Position', [200 200 950 250])

%% comparison at theta = 23[deg], looking at a cross section through the toroid

noin = 26;
theta = deg2rad(23); 

Xunitxnew = BcartODnew(:,:,:,1,1) - BcartIBnew(:,:,:,1,1);
Yunitxnew = BcartODnew(:,:,:,1,2) - BcartIBnew(:,:,:,1,2);

Bxnew = Xunitxnew.*cos(theta) + Yunitxnew.*sin(theta); 
diff23 = (Bxnew - X23.Bz(:,:,noin))./ X67.Bz(:,:,noin);

h2 = figure;
subplot(1,2,1); imagesc(Yin, Zin, squeeze(Bxnew(:,noin,:)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
thesis_fig_gen(h2.Number)
subplot(1,2,2); imagesc(Yin, Zin, squeeze(X23.Bz(:,noin,:)));  axis equal
title 'Mumax B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'; 
axis([-0.02,0.02,-0.02,0.02]); polarmap
thesis_fig_gen(h2.Number)
%% comparison at theta = 67[deg], looking at a cross section through the toroid

noin = 26;
theta = deg2rad(67); 

Xunitxnew = BcartODnew(:,:,:,1,1) - BcartIBnew(:,:,:,1,1);
Yunitxnew = BcartODnew(:,:,:,1,2) - BcartIBnew(:,:,:,1,2);

Bxnew = Xunitxnew.*cos(theta) + Yunitxnew.*sin(theta); 
diff67 = (Bxnew - X67.Bz(:,:,noin))./ X67.Bz(:,:,noin);

h3 = figure;
subplot(1,2,1); imagesc(Yin, Zin, squeeze(Bxnew(:,noin,:)));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'
thesis_fig_gen(h3.Number)
subplot(1,2,2); imagesc(Yin, Zin, squeeze(X67.Bz(:,noin,:)));  axis equal
title 'Mumax B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'; 
axis([-0.02,0.02,-0.02,0.02]); polarmap
thesis_fig_gen(h3.Number)
