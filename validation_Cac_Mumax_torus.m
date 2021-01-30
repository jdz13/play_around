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
Xin = Mdl_dtl.purelinex(noin);
[Bcart] = Validation_Bandit_Cac_UVs(Xin,Yin,Zin,L./2,R./2,M);

% Now we need to take the internal bore and subtract
% this to get the proper field values.

[BcartIB] = Validation_Bandit_Cac_UVs(Xin,Yin,Zin,L./2,IB./2,M);

% Create the real unit vectors, subtractions of the
% magnet with the internal bore.
Xunitx = Bcart(:,:,1,1) - BcartIB(:,:,1,1); 
Yunitx = Bcart(:,:,1,2) - BcartIB(:,:,1,2);

%% comparison at theta = 0 

BxX = Bcart(:,:,1,1) - BcartIB(:,:,1,1);
BxY = Bcart(:,:,2,1) - BcartIB(:,:,2,1);
BxZ = Bcart(:,:,3,1) - BcartIB(:,:,3,1);

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
Bxnew = Xunitx.*cos(theta) + Yunitx.*sin(theta); 
diff23 = (Bxnew - X23.Bz(:,:,noin))./ X23.Bz(:,:,noin).*100;
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
Bxnew = Xunitx.*cos(theta) + Yunitx.*sin(theta); 
diff67 = (Bxnew - X67.Bz(:,:,noin))./ X67.Bz(:,:,noin);
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

d5 = (Xunitx-Xunit.Bz(:,:,noin))./Xunit.Bz(:,:,noin);

figure;
subplot(1,3,1);
imagesc(Yin, Zin, Xunitx); colorbar;  axis equal;
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'

subplot(1,3,2);
imagesc(Yin, Zin, Xunit.Bz(:,:,noin)); colorbar;  axis equal;
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Mumax B_x'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'

subplot(1,3,3); 
imagesc(Yin, Zin, d5); colorbar;  axis equal;
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Relative difference'; colorbar; xlabel 'Y [m]'; ylabel 'Z [m]'

figure
subplot(1,2,1)
imagesc(Yin, Zin, squeeze(Xunitxnew(:,25,:))); axis equal;
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Caciagli B_x'; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'

subplot(1,2,2)
imagesc(Yin, Zin, squeeze(Xunit.Bz(:,25,:))); axis equal;
axis([-0.02,0.02,-0.02,0.02]); polarmap
title 'Mumax B_x '; colorbar; xlabel 'X [m]'; ylabel 'Z [m]'

%%

plt1 = zeros(1,size(Xunit.Bz,2));
plt2 = zeros(1,size(Xunitxnew,2));
plt11 = plt1; plt21 = plt2;

for cnt = 1:length(plt1)
    
    plt1(cnt) = max(max((Xunit.Bz(:,:,cnt))));
    plt2(cnt) = max(max((Xunitxnew(:,:,cnt))));
    
    plt11(cnt) = mean(mean((Xunit.Bz(:,:,cnt))));
    plt21(cnt) = mean(mean((Xunitxnew(:,:,cnt))));
    
end

figure
semilogy(Zin, plt1,Zin, plt2)
legend('Mumax','Caciagli', 'Location', 'West')

%%
figure; ind = (1:floor((Mdl_dtl.wrldSz(1) - R)./2./Mdl_dtl.gridsize(1)));
xlab = abs(Zin) + (Mdl_dtl.gridsize(1)./2)-(R/2);
semilogy(xlab(ind), plt1(ind), xlab(ind), plt2(ind))
yyaxis left; ylabel 'Max fields [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'relative difference'; hold on;
yy = ((plt1 - plt2)./plt2); semilogy(xlab(ind), yy(ind))
legend('Mumax','Caciagli', 'Relative difference', 'Location', 'East'); 

%%

figure; ind = (1:floor((Mdl_dtl.wrldSz(1) - R)./2./Mdl_dtl.gridsize(1)));
xlab = abs(Zin) + (Mdl_dtl.gridsize(1)./2)-(R/2);
semilogy(xlab(ind), plt11(ind), xlab(ind), plt21(ind))
yyaxis left; ylabel 'Mean fields [T]'
yyaxis right; ylabel 'Percentage difference'; hold on;
yy = ((plt11 - plt21)./plt21); semilogy(xlab(ind), yy(ind).*100)
legend('Mumax','Caciagli', 'Percentage difference', 'Location', 'SouthWest'); 

%%

%%

plt1 = zeros(1,size(Xunit.Bz,2));
plt2 = zeros(1,size(Xunitxnew,2));
plt11 = plt1; plt21 = plt2;

for cnt = 1:length(plt1)
    
    plt1(cnt) = max(max((Xunit.Bz(:,:,cnt))));
    plt2(cnt) = max(max((Xunitxnew(:,:,cnt))));
    
    plt11(cnt) = mean(mean((Xunit.Bz(:,:,cnt))));
    plt21(cnt) = mean(mean((Xunitxnew(:,:,cnt))));
    
end

figure
semilogy(Zin, plt1,Zin, plt2)
legend('Mumax','Caciagli', 'Location', 'West')