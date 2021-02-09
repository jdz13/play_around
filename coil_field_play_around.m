xline = linspace(-2.5e-3,2.5e-3,2501);
yline = xline;
zline = 1e-5;

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
[HxAkoun, HyAkoun, HzAkoun] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);

%%

R_coil = 2.5e-3;

[Mask] = plane_mask(xline, yline,R_coil);

xres = xline(1) - xline(2);
yres = yline(1) - yline(2);

carea = xres.*yres;



Breal = HzAkoun.*Mask;

phi = sum(Breal,'all').*carea;
%%

ncell = sum(Mask, 'all');
bsum = sum(Breal,'all');
Bav = bsum/ncell;
dA = pi*(R_coil^2);
phi = Bav*dA;



%%
f = 20; %[Hz]
EMF = -2*pi*f*phi*diff(tester2.masterNVC(19,:))./(tester2.varst.theta(2) - tester2.varst.theta(1));

figure; plot(tester2.varst.theta(2:end),EMF); 

%%

xline= 0; yline = xline;
zline = [5e-9,1e-8,5e-8,1e-7,5e-7,1e-6, 5e-6,1e-5, 5e-5, 1e-4,5e-4,1e-3,5e-3,1e-2,5e-2];

HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
HyAkoun = HxAkoun; HzAkoun = HxAkoun;

magD = [1e-3, 1e-3, 2e-9]; Msat = 1.27e5; mu0 = 4*pi*1e-7;

for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[HxAkoun, HyAkoun, HzAkoun] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);

jj = figure; loglog(zline,squeeze(HzAkoun));
xlabel 'Distance from sample [m]'; ylabel 'Field [T]'
thesis_fig_gen(jj.Number)