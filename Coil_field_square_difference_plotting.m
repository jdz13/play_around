R_coil = linspace(1e-4,2.5e-3,241);

phi1 = zeros(length(R_coil),length(zline));ncell = phi1; bsum = phi1; 
Bav1 = phi1; dA = phi1; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_sum(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask_square(xline, yline,2*R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav1(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi1(jj,kk) = Bav1(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil);
kk = figure; 
h = pcolor(X, Y.*1e3, phi1);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h

R_coil = linspace(1e-4,2.5e-3,241);

phi2 = zeros(length(R_coil),length(zline));ncell = phi2; bsum = phi2; 
Bav2 = phi2; dA = phi2; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask_square(xline, yline,2*R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_Momd(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav2(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi2(jj,kk) = Bav2(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil);
kk = figure; 
h = pcolor(X, Y.*1e3, phi2);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h


%%

dbAV = (Bav2 - Bav1)./Bav2;
dphi = (phi2 - phi1)./phi2;

kk = figure;  subplot(1,2,1)
h = pcolor(X, Y.*1e3, dphi*100);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; 
caxis([-5,5]); title 'Flux comparison'
set(get(c,'label'),'string','Difference between moment dilution and multi-particle models'); 
thesis_fig_gen(kk.Number); subplot(1,2,2)
h = pcolor(X, Y.*1e3, dbAV*100);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; 
caxis([-5,5]); title 'Average field comparison'
set(get(c,'label'),'string','Difference between moment dilution and multi-particle models'); 
thesis_fig_gen(kk.Number)

%%

kk = figure; yyaxis left;
loglog(zline,Bav2(91,:));
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
yyaxis right; loglog(zline,phi1(91,:)); ylabel 'Flux \Phi'
legend ('Average field', 'Flux \Phi')
thesis_fig_gen(kk.Number);
