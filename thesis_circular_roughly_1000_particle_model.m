MsatC = 1e6;
sr = 1e-3; dx = 5e-5;
x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
[Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
magDp = [2e-5, 2e-5, 2e-9];

As = pi*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*N;
Mdil = MsatC * ApN / As;


xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-4,-2,100);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;
magD = [(pi^0.5)*sr, (pi^0.5)*sr, 2e-9]; 
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
        if Mask(aa,bb) == 1
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
        
        if rem(n,100)==0
            disp(n)
            toc
        end 
        
    end
end
[~, ~, HzAkoun_sum] = multiply(MsatC*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa

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
qq = figure;
cin = 0;
w = [35,51,60,75,100];
for ww = w
    cin = cin+1;
    subplot(2,length(w),cin)
    imagesc(xline.*1e3, yline.*1e3, HzAkoun_Momd(:,:,ww))
    xlabel 'X [mm]'; ylabel 'Y [mm]'
    c = colorbar;set(gca,'ColorScale','log'); 
    title (['B_z at a height ', num2str(zline(ww),'%.1e'), ' [m] - dilution' ])
    subplot(2,length(w),cin+length(w))
    imagesc(xline.*1e3, yline.*1e3, HzAkoun_sum(:,:,ww))
    xlabel 'X [mm]'; ylabel 'Y [mm]'
    c = colorbar;set(gca,'ColorScale','log'); 
    title (['B_z at a height ', num2str(zline(ww),'%.1e'), ' [m] - sum' ])
end 

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

%%
%%


R_coil = linspace(2.5e-4,2.5e-3,10);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

kk = 35;
    
xlineu = xline; xlineu(126) = eps;
ylineu = xline; ylineu(126) = eps;
    figure;
    for jj = 1:length(R_coil)
        ind = [find(abs(xline) <= 0.001,1, 'first'),find(abs(xline) <= 0.001,1, 'last')];
        [Mask] = plane_mask(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(jj,kk) = sum(breal,'all');
        Bav(jj,kk) = bsum(jj,kk)/ncell(jj,kk);
        dA(jj,kk) = pi*(R_coil(jj)^2);
        phi(jj,kk) = Bav(jj,kk)*dA(jj,kk);
        
        
        ind = [find(abs(xline) <= R_coil(jj)/2,1, 'first'),find(abs(xline) <= R_coil(jj)/2,1, 'last')];
        subplot(2,5,jj)
        imagesc(xline(ind(1):ind(2)).*1e3, yline(ind(1):ind(2)).*1e3, breal(ind(1):ind(2),ind(1):ind(2)))
        xlabel 'X [mm]'; ylabel 'Y [m]'
        title (['R_c_o_i_l = ',num2str(R_coil(jj)*1e3),' [mm]'])
        c = colorbar; polarmap
    end

