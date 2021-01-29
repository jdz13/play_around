%% 

% folder name >> C:\Users\JDZ\Documents\MuMax\Particle_Jake_V6_thesis.out\
% file name >> Particle_Jake_V6_thesis.mat
[zz1] = Mumax_data_extractor();

%%
xline = zz1.Mdl_dtl.purelinex;
yline = zz1.Mdl_dtl.pureliney;
zline = zz1.Mdl_dtl.purelinez;

HxAkoun = zeros(size(zz1.Bz));
HyAkoun = zeros(size(zz1.Bz));
HzAkoun = zeros(size(zz1.Bz));

magD = [2e-5, 2e-5, 2e-5]; Msat = 1e6; mu0 = 4*pi*1e-7;

for kk = 1:size(xline,2)
    for jj = 1:size(yline,2)
        for pp = 1:size(zline,2)
            [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xline(kk),yline(jj),zline(pp),magD);
        end
    end 
end
[HxAkoun, HyAkoun, HzAkoun] = multiply(Msat*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);

%%
noin = 4;

zz1.modB = sqrt(zz1.Bx.^2 + zz1.By.^2 + zz1.Bz.^2);
modBAk = sqrt(HxAkoun.^2 + HyAkoun.^2 + HzAkoun.^2);

testAk = HzAkoun(:,:,noin);
testMm = zz1.Bz(:,:,noin);

diff12 = testAk - testMm;
pcdiff = diff12./testMm;

h0 = figure;
subplot(1,4,1)
imagesc(testAk)
colorbar

subplot(1,4,2)
imagesc(testMm)
colorbar

subplot(1,4,3)
imagesc(diff12)
colorbar

subplot(1,4,4)
imagesc(pcdiff)
colorbar

%%
clear space
[space.X,space.Y,space.Z] = meshgrid(xline, yline, zline);
path = 'C:\Users\JDZ\Documents\MATLAB\GIT\stray-field-CMC';
oldFol = cd(path);
[Test_struc] = Checks_on_code_rough(HzAkoun, zz1.Bz, space); cd(oldFol)
h1 = gcf;  thesis_fig_gen(h1.Number)
h2 = figure; slice(space(1).X,space(1).Y,space(1).Z, HzAkoun*100, 0,0,[]);
colorbar; caxis([-0.1,0.1]); thesis_fig_gen(h2.Number)
xlabel 'X [m]'; ylabel 'Y [m]'; zlabel 'Z [m]'; 
title 'Z component profile'; 

%%

g1 = figure;
subplot(1,2,1)
slice(space(1).X,space(1).Y,space(1).Z, HzAkoun, 0,0,[])
title 'B_z component'; colorbar; axis equal; 
xlabel 'X [m]'; ylabel 'Y [m]'; zlabel 'Z [m]'
thesis_fig_gen(g1.Number); caxis([-0.001,0.001])
subplot(1,2,2)
slice(space(1).X,space(1).Y,space(1).Z, Test_struc.TESTVI*100, 0,0,[])
title 'Percentage error over all space'; colorbar; axis equal; 
caxis([-1,1]); thesis_fig_gen(g1.Number)
xlabel 'X [m]'; ylabel 'Y [m]'; zlabel 'Z [m]'
set(g1,'Position', [100 150 1000 420])

%%
clear space
[space.X,space.Y,space.Z] = meshgrid(xline, yline, zline);
path = 'C:\Users\JDZ\Documents\MATLAB\GIT\stray-field-CMC';
oldFol = cd(path);
[Test_struc] = Checks_on_code_rough(modBAk, zz1.modB, space); cd(oldFol)
h1 = gcf;  thesis_fig_gen(h1.Number)
h2 = figure; slice(space(1).X,space(1).Y,space(1).Z, modBAk*100, 0,0,[]);
colorbar; caxis([-0.1,0.1]); thesis_fig_gen(h2.Number)
xlabel 'X [m]'; ylabel 'Y [m]'; zlabel 'Z [m]'; 
title 'Z component profile'; 

    
%%

 figure
    subplot(3,1,3)
    bar(Test_struc.graph.cats,Test_struc.graph.values*100); xlabel 'Location';  ylabel 'Percentage error'
    title 'Percentage error locations over 1%' ;
    subplot(3,1,[1,2])
    slice(space(1).X,space(1).Y,space(1).Z, Test_struc.TESTVI*100, 0,0,[])
    title 'Percentage error over all space'; colorbar; 
%     caxis([-1,1]);
    xlabel 'X [m]'; ylabel 'Y [m]'; zlabel 'Z [m]'