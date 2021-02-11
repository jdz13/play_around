%% first thing, testing the decay from our dried particle solution. 

xline= 0; yline = xline;
zline = logspace(-9,-2,1000);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun1 = HxAkoun;

magD = [1e-3, 1e-3, 2e-9]; Msat = 1.27e5; mu0 = 4*pi*1e-7;

for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun1(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[~, ~, HzAkoun1] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun1);

jj = figure; loglog(zline,squeeze(HzAkoun1));
xlabel 'Distance from sample [m]'; ylabel 'Field [T]'; vline(magD(1))
thesis_fig_gen(jj.Number)

clear jj kk pp 
%%

xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-6,-2,100);

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;

magD = [2e-3, 2e-3, 2e-9]; Msat = 1.27e5; mu0 = 4*pi*1e-7;

for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[~, ~, HzAkoun] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);

clear kk jj pp
%%

R_coil = 2.5e-3;

[Mask] = plane_mask(xline, yline,R_coil);

xres = xline(1) - xline(2);
yres = yline(1) - yline(2);

carea = xres.*yres;

Breal = HzAkoun.*Mask;

n = 50;
phi2 = sum(Breal(:,:,n),'all').*carea; clear n

%%

R_coil = linspace(1e-4,2.5e-3,241);

phi = zeros(length(R_coil),length(zline));ncell = phi; bsum = phi; 
Bav = phi; dA = phi; B_av = zeros(1,length(zline));

for kk = 1:length(zline)
    
    B_av(kk) = mean(HzAkoun(:,:,kk),'all');
    
    for jj = 1:length(R_coil)
        
        [Mask] = plane_mask(xline, yline,R_coil(jj));
        ncell(jj,kk) = sum(Mask, 'all');
        breal = HzAkoun(:,:,kk).*Mask;
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

t = figure;
loglog(zline,B_av)
% title 'Average field at a distance (2.5 [mm])^2 plane'
ylabel 'Average field [T]'; xlabel 'Distance from the sample [m]'
vline(1e-3); thesis_fig_gen(t.Number); clear t

%%
n = 100; MsatC = 1e6; 
sr = 1e-3; dx = sqrt(pi*(sr^2)/n);
x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
[Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
magDp = [2e-5, 2e-5, 2e-9]; 
As = pi*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*N;
Mdil = MsatC * ApN / As;


xline = linspace(-2.5e-3,2.5e-3,251);
yline = xline;
zline = logspace(-6,-2,100);

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
%%
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
                        [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magDp);
                    end
                end
            end 
            HzAkoun_sum = HzAkoun_sum + HzAkoun;
        end 
    end
end
[~, ~, HzAkoun_sum] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa

%%
B_av_Momd = zeros(1,length(zline));
B_av_sum = zeros(1,length(zline));
for kk = 1:length(zline)
    B_av_Momd(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    B_av_sum(kk) = mean(HzAkoun_sum(:,:,kk),'all');
end 

kk = figure;
loglog(zline,B_av_Momd,'b--', zline, B_av_sum,'r--');
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
legend ('Obtained by moment dilution', 'Obtained by multiple particles')
thesis_fig_gen(kk.Number);

%%
% f = 20; %[Hz]
% EMF = -2*pi*f*phi*diff(tester2.masterNVC(19,:))./(tester2.varst.theta(2) - tester2.varst.theta(1));
% 
% figure; plot(tester2.varst.theta(2:end),EMF); 
%%

n = 100; MsatC = 1e6; 
sr = 1e-3; dx = sqrt(pi*(sr^2)/n);
x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
[Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
magDp = [2e-5, 2e-5, 2e-9]; 
As = pi*(sr^2); Ap1 = (magDp(1))^2; ApN = Ap1*N;
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
%%
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
                        [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magDp);
                    end
                end
            end 
            HzAkoun_sum = HzAkoun_sum + HzAkoun;
        end 
    end
end
[~, ~, HzAkoun_sum] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun_sum);

toc
clear kk jj bb aa

%%
B_av_Momd = zeros(1,length(zline));
B_av_sum = zeros(1,length(zline));
for kk = 1:length(zline)
    B_av_Momd(kk) = mean(HzAkoun_Momd(:,:,kk),'all');
    B_av_sum(kk) = mean(HzAkoun_sum(:,:,kk),'all');
end 

kk = figure;
loglog(zline,B_av_Momd,'b--', zline, B_av_sum,'r--');
xlabel 'Distance from sample [m]'; ylabel 'Average field [T]'
legend ('Obtained by moment dilution', 'Obtained by multiple particles')
thesis_fig_gen(kk.Number);

