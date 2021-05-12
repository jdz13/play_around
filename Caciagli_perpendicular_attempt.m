
L = 1e-9;
R = 1e-5;

Xin = linspace(-2.5e-3,2.5e-3,251);
Yin = Xin;
Zin = logspace(-6,-2,100);
Bz = zeros(size(Xin,2), size(Yin,2), size(Zin,2));
M = 1e6;
count = 0;
tic

for xcount = 1:size(Xin,2)  
    for ycount = 1:size(Yin,2)
        for zcount = 1:size(Zin,2)

            [Bz(xcount,ycount,zcount)] = Bz_Cac_test(M, Xin(xcount), Yin(ycount), Zin(zcount),L, R);
            
        end 
    end 
    count = count+1;
    if rem(xcount,10)==0
        disp(count)
    end 
end

toc

%%

% I used the full Msat in that model - but this is purely a scalar factor.
% Multiply the field values by a normalising factor.

% We're looking at comparing this with the 1144 particle model, so work out
% the scalar factor.

n = 1184; 
Vpart = 2e-5*2e-5*2e-8;
Vtot = Vpart*N;

Vdisk = pi*((2*R)^2)*2*L;
Mfac = M*Vtot/Vdisk;

BZfac = Bz*Mfac;

%%

figure;
imagesc(Xin.*1e3, Yin.*1e3, BZfac(:,:,end))
xlabel 'X [mm]'; ylabel 'Y [mm]'; colorbar
%%

mean(Bz(:,:,end),'all')

%%

m1 = zeros(1,length(Zin));
m2 = m1;

for hh = 1:length(Zin)
    m1(hh) = nanmean(Bz(:,:,hh),'all');
    m2(hh) = mean(HzAkoun_sum(:,:,hh), 'all');
end 

figure
yyaxis left; semilogx(Zin, m1); ylabel 'Mean field [T]'
yyaxis right; semilogx(Zin, m2); ylabel 'Mean field [T]'
xlabel 'Separation [m]'; 
legend ('Cac', 'Akoun - multiparticle','Location', 'South')

%%

L = 1e-9;
R = 1e-3;

n = 1184; 
Vpart = 2e-5*2e-5*2e-8;
Vtot = Vpart*N;

Vdisk = pi*((2*R)^2)*2*L;
Mfac = M*Vtot/Vdisk;

Xin = linspace(-2.5e-3,2.5e-3,251);
Yin = Xin;
Zin = logspace(-6,-2,100);
Bz = zeros(size(Xin,2), size(Yin,2), size(Zin,2));
M = Mfac;
count = 0;
tic

for xcount = 1:size(Xin,2)  
    for ycount = 1:size(Yin,2)
        for zcount = 1:size(Zin,2)

            [Bz(xcount,ycount,zcount)] = Bz_Cac_test(M, Xin(xcount), Yin(ycount), Zin(zcount),L, R);
            
        end 
    end 
    count = count+1;
    if rem(xcount,10)==0
        disp(count)
    end 
end

toc

figure; imagesc(Xin.*1e3, Yin.*1e3, Bz(:,:,end)); colorbar

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI';
[oldfolder] = cd(folpath);
filename = 'Bz_cac_equivalent.mat';
save(filename, 'Bz')
cd(oldfolder);

