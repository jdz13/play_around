
folpath = 'C:\Users\Jake\Documents\MATLAB\ChVI_additional_results';
[oldfolder] = cd(folpath);
filename = 'new_1000_particle_model_100um_1cm.mat';
save(filename)
cd(oldfolder);

clear

%-------------------------------------------------------------------------
% 100 particles in a square - smaller separation

n = 100; MsatC = 1e6; 
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


folpath = 'C:\Users\Jake\Documents\MATLAB\ChVI_additional_results';
[oldfolder] = cd(folpath);
filename = '100_particles_square_smaller_sep.mat';
save(filename)
cd(oldfolder);

clear

%-------------------------------------------------------------------------
% 100 particles in a square - larger separation

n = 100; MsatC = 1e6; 
sr = 2e-3; dx = round(sqrt(n));
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


folpath = 'C:\Users\Jake\Documents\MATLAB\ChVI_additional_results';
[oldfolder] = cd(folpath);
filename = '100_particles_square_larger_sep.mat';
save(filename)
cd(oldfolder);

clear

clear

%-------------------------------------------------------------------------
% 100 particles in a square - smaller particles

n = 100; MsatC = 1e6; 
sr = 1e-3; dx = round(sqrt(n));
ext = sr-(sr/dx);
x = linspace(-ext,ext,dx); y = x;

magDp = [1e-5, 1e-5, 2e-9]; 
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


folpath = 'C:\Users\Jake\Documents\MATLAB\ChVI_additional_results';
[oldfolder] = cd(folpath);
filename = '100_particles_square_smaller_particles.mat';
save(filename)
cd(oldfolder);

clear

clear

%-------------------------------------------------------------------------
% 100 particles in a square - larger particles

n = 100; MsatC = 1e6; 
sr = 1e-3; dx = round(sqrt(n));
ext = sr-(sr/dx);
x = linspace(-ext,ext,dx); y = x;

magDp = [5e-5, 5e-5, 2e-9]; 
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


folpath = 'C:\Users\Jake\Documents\MATLAB\ChVI_additional_results';
[oldfolder] = cd(folpath);
filename = '100_particles_square_larger_particles.mat';
save(filename)
cd(oldfolder);

clear