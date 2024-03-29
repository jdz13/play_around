%% second attempt, with a square section of 100 particles.

n = 100; MsatC = 1e6; 
sr = 1e-3; dx = round(sqrt(n));
ext = sr-(sr/dx);
x = linspace(-ext,ext,dx); y = x;

magDp = [2e-5, 2e-5, 2e-9]; 
As = 4*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*(dx^2);
Mdil = MsatC * ApN / As;


xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-6,-2,100);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;
magD = [2*sr, 2*sr, 2e-9]; 
Msat = Mdil; mu0 = 4*pi*1e-7;
tic
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[~, ~, HzAkoun_Momd] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);
toc
clear HzAkoun HyAkoun HzAkoun kk jj pp

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; HzAkoun_sum = HxAkoun;
tic
n = 0;
for aa = 1:length(x)
    for bb = 1:length(y)
            n = n+1;            
            xlinetemp = xline+x(aa);
            ylinetemp = yline+y(bb);

            for kk = 1:size(xline,2)
                for jj = 1:size(yline,2)
                    for pp = 1:size(zline,2)
                        [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xlinetemp(kk),ylinetemp(jj),zline(pp),magDp);
                    end
                end
            end 
            HzAkoun_sum = HzAkoun_sum + HzAkoun;
         
    end
end
[~, ~, HzAkoun_sum] = multiply(MsatC*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa


B_av_Momd = zeros(1,length(zline));
B_av_sum = zeros(1,length(zline));
for kk = 1:length(zline)
    B_av_Momd(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    B_av_sum(kk) = mean(HzAkoun_sum(:,:,kk),'all');
end 

kk = figure;
yyaxis left; loglog(zline,B_av_Momd,'--', zline, B_av_sum,':');
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
yyaxis right; semilogx(zline,abs((B_av_Momd-B_av_sum)./B_av_sum.*100)); ylabel 'Percentage difference [%]'
legend ('Obtained by moment dilution', ['Obtained from ',num2str(dx^2),' individual particles'],'Percentage difference', 'Location','Southwest')
thesis_fig_gen(kk.Number);


%%
R_coil = linspace(1e-4,5e-3,491);

phi1 = zeros(length(R_coil),length(zline));ncell = phi1; bsum = phi1; 
Bav1 = phi1; dA = phi1; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask_square(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_Momd(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav1(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = 4*(R_coil(jj)^2);
        phi1(jj,kk) = Bav1(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil.*1e3);
kk = figure; 
h = pcolor(X, Y, phi1);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h



kk = figure; 
h = pcolor(X, Y, Bav1);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h


phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_sum(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask_square(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = 4*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil.*1e3);
kk = figure; 
h = pcolor(X, Y, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h; polarmap



kk = figure; 
h = pcolor(X, Y, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h; polarmap

[X,Y] = meshgrid(zline,R_coil.*1e3);
kk = figure; 
h = pcolor(X, Y, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; set(gca,'ColorScale','log');c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h



kk = figure; 
h = pcolor(X, Y, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; set(gca,'ColorScale','log');c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h


diffBav = (Bav1 - Bav)./Bav1.*100;
kk = figure; 
h = pcolor(X, Y, diffBav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; caxis([-5,5])
set(get(c,'label'),'string','Percentage difference [%]'); 
thesis_fig_gen(kk.Number); clear  kk h

diffphi = (phi1 - phi)./phi1.*100;
kk = figure; 
h = pcolor(X, Y, diffphi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; caxis([-5,5])
set(get(c,'label'),'string','Percentage difference [%]'); 
thesis_fig_gen(kk.Number); clear  kk h


%%

[X,Y] = meshgrid(zline,2.*R_coil.*1e3);
kk = figure; subplot(3,2,1)
h = pcolor(X, Y, phi1);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); 

subplot(3,2,2); h = pcolor(X, Y, Bav1);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); 

subplot(3,2,3); [X,Y] = meshgrid(zline,2.*R_coil.*1e3);
h = pcolor(X, Y, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); 

subplot(3,2,4); h = pcolor(X, Y, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); 

subplot(3,2,5); diffBav = (Bav1 - Bav)./Bav1.*100;
h = pcolor(X, Y, diffBav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; caxis([-5,5])
set(get(c,'label'),'string','Percentage difference [%]'); 
thesis_fig_gen(kk.Number); 

subplot(3,2,6); diffphi = (phi1 - phi)./phi1.*100;
h = pcolor(X, Y, diffphi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'coil side length [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar; c.Ruler.TickLabelFormat='%g %%'; caxis([-5,5])
set(get(c,'label'),'string','Percentage difference [%]'); 
thesis_fig_gen(kk.Number); clear  kk h
%% second attempt, with a square section of 100 particles.

n = 16; MsatC = 1e6; 
sr = 0.5e-3; dx = round(sqrt(n));
ext = sr-(sr/dx);
x = linspace(-ext,ext,dx); y = x;

magDp = [2e-5, 2e-5, 2e-9]; 
As = 4*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*(dx^2);
Mdil = MsatC * ApN / As;


xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-6,-2,100);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;
magD = [2*sr, 2*sr, 2e-9]; 
Msat = Mdil; mu0 = 4*pi*1e-7;
tic
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[~, ~, HzAkoun_Momd] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);
toc
clear HzAkoun HyAkoun HzAkoun kk jj pp

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; HzAkoun_sum = HxAkoun;
tic
n = 0;
for aa = 1:length(x)
    for bb = 1:length(y)
            n = n+1;            
            xlinetemp = xline+x(aa);
            ylinetemp = yline+y(bb);

            for kk = 1:size(xline,2)
                for jj = 1:size(yline,2)
                    for pp = 1:size(zline,2)
                        [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xlinetemp(kk),ylinetemp(jj),zline(pp),magDp);
                    end
                end
            end 
            HzAkoun_sum = HzAkoun_sum + HzAkoun;
         
    end
end
[~, ~, HzAkoun_sum] = multiply(MsatC*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa


B_av_Momd = zeros(1,length(zline));
B_av_sum = zeros(1,length(zline));
for kk = 1:length(zline)
    B_av_Momd(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    B_av_sum(kk) = mean(HzAkoun_sum(:,:,kk),'all');
end 

kk = figure;
yyaxis left; loglog(zline,B_av_Momd,'--', zline, B_av_sum,':');
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
yyaxis right; semilogx(zline,abs((B_av_Momd-B_av_sum)./B_av_sum.*100)); ylabel 'Percentage difference [%]'
legend ('Obtained by moment dilution', ['Obtained from ',num2str(dx^2),' individual particles'],'Percentage difference', 'Location','Southwest')
thesis_fig_gen(kk.Number);


R_coil = linspace(1e-4,2.5e-3,241);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_Momd(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil);
kk = figure; 
h = pcolor(X, Y.*1e3, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h



kk = figure; 
h = pcolor(X, Y.*1e3, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h

%%

R_coil = linspace(1e-4,2.5e-3,241);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_sum(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil);
kk = figure; 
h = pcolor(X, Y.*1e3, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h



kk = figure; 
h = pcolor(X, Y.*1e3, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h

%% second attempt, with a square section of 100 particles.

n = 16; MsatC = 1e6; 
sr = 1.5e-3; dx = round(sqrt(n));
ext = sr-(sr/dx);
x = linspace(-ext,ext,dx); y = x;

magDp = [2e-5, 2e-5, 2e-9]; 
As = 4*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*(dx^2);
Mdil = MsatC * ApN / As;


xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-6,-2,100);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;
magD = [2*sr, 2*sr, 2e-9]; 
Msat = Mdil; mu0 = 4*pi*1e-7;
tic
for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[~, ~, HzAkoun_Momd] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);
toc
clear HzAkoun HyAkoun HzAkoun kk jj pp

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun; HzAkoun_sum = HxAkoun;
tic
n = 0;
for aa = 1:length(x)
    for bb = 1:length(y)
            n = n+1;            
            xlinetemp = xline+x(aa);
            ylinetemp = yline+y(bb);

            for kk = 1:size(xline,2)
                for jj = 1:size(yline,2)
                    for pp = 1:size(zline,2)
                        [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xlinetemp(kk),ylinetemp(jj),zline(pp),magDp);
                    end
                end
            end 
            HzAkoun_sum = HzAkoun_sum + HzAkoun;
         
    end
end
[~, ~, HzAkoun_sum] = multiply(MsatC*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa


B_av_Momd = zeros(1,length(zline));
B_av_sum = zeros(1,length(zline));
for kk = 1:length(zline)
    B_av_Momd(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    B_av_sum(kk) = mean(HzAkoun_sum(:,:,kk),'all');
end 

kk = figure;
yyaxis left; loglog(zline,B_av_Momd,'--', zline, B_av_sum,':');
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
yyaxis right; semilogx(zline,abs((B_av_Momd-B_av_sum)./B_av_sum.*100)); ylabel 'Percentage difference [%]'
legend ('Obtained by moment dilution', ['Obtained from ',num2str(dx^2),' individual particles'],'Percentage difference', 'Location','Southwest')
thesis_fig_gen(kk.Number);

R_coil = linspace(1e-4,2.5e-3,241);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun_sum(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
    end
end
clear kk jj

[X,Y] = meshgrid(zline,R_coil);
kk = figure; 
h = pcolor(X, Y.*1e3, phi);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [Wb]';
set(get(c,'label'),'string','Flux captured by a search coil [Wb]'); 
thesis_fig_gen(kk.Number); clear  kk h



kk = figure; 
h = pcolor(X, Y.*1e3, Bav);
h.EdgeColor = 'none';
% set(gca,'Yscale','log','YDir','normal','YTick',[0.1,1]);
set(gca,'Xscale','log','XDir','normal','XTick',[1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1]);
ylabel 'R_c_o_i_l [mm]'; xlabel 'Sample - Coil distance [m]'
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g T';
set(get(c,'label'),'string','Average field [T]'); 
thesis_fig_gen(kk.Number); clear  kk h

%%


R_coil = linspace(1e-4, 1.2e-3,12);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

kk = 51;
    
xlineu = xline; xlineu(126) = eps;
ylineu = xline; ylineu(126) = eps;
    figure;
    for jj = 1:length(R_coil)
        [Mask] = plane_mask_square(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
        
        ind = [find(abs(xline) <= R_coil(jj)/2,1, 'first'),find(abs(xline) <= R_coil(jj)/2,1, 'last')];
        subplot(4,3,jj)
        imagesc(xline(ind(1):ind(2)).*1e3, yline(ind(1):ind(2)).*1e3, breal(ind(1):ind(2),ind(1):ind(2)))
        xlabel 'X [mm]'; ylabel 'Y [m]'
        title (['coil side length = ',num2str(R_coil(jj)*1e3),' [mm]']); polarmap
        c = colorbar; axis equal; axis([-R_coil(jj)/2.*1e3,R_coil(jj)/2.*1e3,-R_coil(jj)/2.*1e3,R_coil(jj)/2.*1e3])
    end




