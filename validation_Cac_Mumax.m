%% Comparison of fields from Mumax and Caciagli
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
noin = 1;
L = 2e-2; 
R = L;
M = 1.27e6;

%extract data using user inputs
Yin = Mdl_dtl.pureliney; Zin = Mdl_dtl.purelinez;
Xin = Mdl_dtl.purelinex(noin);
[Bcart] = Validation_Bandit_Cac_UVs(Xin,Yin,Zin,L./2,R./2,M);
%% comparison at theta = 0 

BxX = Bcart(:,:,1,1);
BxY = Bcart(:,:,2,1);
BxZ = Bcart(:,:,3,1);

% difX = (BxX - Xunit.Bz(:,:,noin))./Xunit.Bz(:,:,noin).*100;
% difY = (BxY - Xunit.Bx(:,:,noin))./Xunit.Bx(:,:,noin).*100;
% difZ = (BxZ - Xunit.By(:,:,noin))./Xunit.By(:,:,noin).*100;

h0 = figure;
subplot(2,3,1); imagesc(Yin, Zin, BxX);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(2,3,2); imagesc(Yin, Zin, BxY);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_y'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(2,3,3); imagesc(Yin, Zin, BxZ);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_z'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'

subplot(2,3,4); imagesc(Yin, Zin, Xunit.Bz(:,:,noin));  axis equal
title 'Mumax B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'; 
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,5); imagesc(Yin, Zin, Xunit.Bx(:,:,noin));  axis equal
title 'Mumax B_y'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
subplot(2,3,6); imagesc(Yin, Zin, Xunit.By(:,:,noin));  axis equal
title 'Mumax B_z'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
axis([-0.02,0.02,-0.02,0.02]); polarmap
set(h0,'Position', [200 200 950 450])
%% comparison for data at 23deg rotation

theta = deg2rad(23); 
Bxnew = Bcart(:,:,1,1).*cos(theta) + Bcart(:,:,1,2).*sin(theta); 
diff23 = (Bxnew - X23.Bz(:,:,noin))./ X23.Bz(:,:,noin)./100;
h1 = figure;
subplot(1,3,1); imagesc(Yin, Zin, Bxnew);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x_2_3'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(1,3,2); imagesc(Yin, Zin, X23.Bz(:,:,noin));  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Mumax B_x_2_3'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(1,3,3); imagesc(Yin, Zin, diff23);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title '% difference'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
set(h1,'Position', [200 400 950 300])

%% comparison at 67deg angle rotation 

theta = deg2rad(67); 
Bxnew = Bcart(:,:,1,1).*cos(theta) + Bcart(:,:,1,2).*sin(theta); 
diff67 = (Bxnew - X67.Bz(:,:,noin))./ X67.Bz(:,:,noin)./100;
h2 = figure;
subplot(1,3,1); imagesc(Yin, Zin, Bxnew); axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x_6_7'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(1,3,2); imagesc(Yin, Zin, X67.Bz(:,:,noin)); axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Mumax B_x_6_7'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
subplot(1,3,3); imagesc(Yin, Zin, diff67);  axis equal
axis([-0.02,0.02,-0.02,0.02]); polarmap
title '% difference'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'
set(h2,'Position', [200 400 950 300])
%%
% 
% BxX = Bcart(:,:,1,1);
% BxY = Bcart(:,:,2,1);
% BxZ = Bcart(:,:,3,1);
% 
% ByX = Bcart(:,:,1,2);
% ByY = Bcart(:,:,2,2);
% ByZ = Bcart(:,:,3,2);
% 
% figure
% subplot(2,3,1); imagesc(BxX)
% subplot(2,3,2); imagesc(BxY)
% subplot(2,3,3); imagesc(BxZ)
% subplot(2,3,4); imagesc(ByX)
% subplot(2,3,5); imagesc(ByY)
% subplot(2,3,6); imagesc(ByZ)

%%
% figure
% subplot(2,3,1); imagesc(BxX); title 'Caciagli B_x'
% subplot(2,3,2); imagesc(BxY); title 'Caciagli B_y'
% subplot(2,3,3); imagesc(BxZ); title 'Caciagli B_z'
% subplot(2,3,4); imagesc(Xunit.Bz(:,:,noin)); title 'Mumax B_x'
% subplot(2,3,5); imagesc(Xunit.Bx(:,:,noin)); title 'Mumax B_y'
% subplot(2,3,6); imagesc(Xunit.By(:,:,noin)); title 'Mumax B_z'

%%
% difX = (BxX - Xunit.Bz(:,:,noin))./Xunit.Bz(:,:,noin);
% difY = (BxY - Xunit.Bx(:,:,noin))./Xunit.Bx(:,:,noin);
% difZ = (BxZ - Xunit.By(:,:,noin))./Xunit.By(:,:,noin);
%  
% figure 
% subplot(1,3,1); imagesc(difX); colorbar
% subplot(1,3,2); imagesc(difY); colorbar
% subplot(1,3,3); imagesc(difZ); colorbar