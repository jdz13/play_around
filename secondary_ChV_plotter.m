% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p2.mat')

% Right, so we;re trying to extract the P(B_0) for different magnet
% diameters. 

%holder so I don't have to type it out each time.
ist =SaveVar22p6;

% Start with defining the OD array. 
s_rad = ist.varst.s_rad;
OD = 4e-2;

% Now the trickier bit, extracting p(B_0). The field value will be found in
% the definitions.
B0 = ist.varst.RES;

% Correlate this to the MxB probe array, for each magnet OD.
PB01 = squeeze(ist.FWHMres);
PB1 = rad2deg(PB01(1,:));
PB3 = rad2deg(PB01(3,:));
PB5 = rad2deg(PB01(5,:));
PB7 = rad2deg(PB01(7,:));
ff = figure;
plot(s_rad.*1e3,PB1,s_rad.*1e3,PB3,s_rad.*1e3,PB5,s_rad.*1e3,PB7)
ylabel 'FWHM [deg]'; hold on
xlabel 'S_r_a_d [mm]'
h1 = legend ('1^s^t channel', '3^r^d channel', '5^t^h channel', '7^t^h channel');
 set(h1 ,'Location','Northwest');
thesis_fig_gen(ff.Number)
%%

R = 4e-2; 
L = 2e-2;
M = 1.27e6;
IB = 6e-3;

%extract data using user inputs
Zin50 = linspace(-6e-2,6e-2,150); Yin50 = linspace(-4e-2,4e-2, 100);
Xin50 = 0; tic
[ZY2] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);

L = 6e-2;
[ZY6] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);
L = 10e-2;
[ZY10] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);

ff = figure;
subplot(1,3,1); imagesc(Zin50, Yin50, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [m]'; ylabel 'Z [m]';  axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin50, Yin50, ZY6(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [m]'; ylabel 'Z [m]'; axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin50, Yin50, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [m]'; ylabel 'Z [m]'; axis([-6e-2,6e-2,-4e-2,4e-2]); 
caxis([-0.6,0]); thesis_fig_gen(ff.Number)

%%
in = '--';
semilogy((ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,1), in, (ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,21),  in,(ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,41), in, (ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,61), in,(ist.probe_line - ist.varst.PM/2).*100, ist.MxB(:,:,81),in)
ylim([0.3,0.8]); xlim ([0,0.5]);

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

plotter = zeros(length(SaveVar21p2.varst.Lengths),length(SaveVar21p2.varst.PM));
for ff = 1:length(SaveVar21p2.varst.Lengths)
    for gg = 1:length(SaveVar21p2.varst.PM)
        
        plotter(ff,gg) = nnz(SaveVar21p2.SWres(4,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(SaveVar21p2.varst.Lengths.*100,SaveVar21p2.varst.PM.*100,plotter') 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%%
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p6.mat')
ist = SaveVar22p6;
in = '+--';
ff = figure;
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,1)))-1,nonzeros(ist.SWres(1,:,1,1,1,1)),in); hold on
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,21)))-1,nonzeros(ist.SWres(1,:,1,1,1,21)),in)
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,41)))-1,nonzeros(ist.SWres(1,:,1,1,1,41)),in)
semilogy(0:length(nonzeros(ist.SWres(1,:,1,1,1,61)))-1,nonzeros(ist.SWres(1,:,1,1,1,61)),in)
xlabel 'Channel number (n)'; ylabel 'Channel field [T]'
legend ('S_r_a_d = 0.25 [mm]', 'S_r_a_d = 0.5 [mm]', 'S_r_a_d = 0.75 [mm]', 'S_r_a_d = 1 [mm]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p4.mat')
ist = SaveVar22p4;
in = '+--';

ff = figure;
pt = nonzeros(ist.SWres(1,:,1,1));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,1))),in); hold on
pt = nonzeros(ist.SWres(1,:,1,11));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,11))),in); hold on
pt = nonzeros(ist.SWres(1,:,1,21));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,21))),in); hold on
pt = nonzeros(ist.SWres(1,:,1,31));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,31))),in); hold on
pt = nonzeros(ist.SWres(1,:,1,41));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,41))),in); hold on
pt = nonzeros(ist.SWres(1,:,1,51));
plot(pt(1:end-1), rad2deg(nonzeros(ist.FWHMres(1,:,1,51))),in); hold on
xlabel 'Channel field [T]'; ylabel 'FWHM [deg]'
legend ('B_s_t_a_r_t = 0.6 [T]','B_s_t_a_r_t = 0.5 [T]','B_s_t_a_r_t = 0.4 [T]','B_s_t_a_r_t = 0.3 [T]','B_s_t_a_r_t = 0.2 [T]','B_s_t_a_r_t = 0.1 [T]', 'Location', 'Southeast')
thesis_fig_gen(ff.Number)

%%
ist = SaveVar22p2;
in = '--';
ff = figure; x = ist.probe_line - ist.varst.PM/2;
semilogy(x,ist.MxB(1,:,1),in); hold on
semilogy(x,ist.MxB(1,:,21),in); hold on
semilogy(x,ist.MxB(1,:,41),in); hold on
semilogy(x,ist.MxB(1,:,61),in); hold on
semilogy(x,ist.MxB(1,:,81),in); hold on
xlabel 'p [mm]'; ylabel 'B_m_a_x(p) [T]'
legend ('L = 20 [mm]','L = 40 [mm]','L = 60 [mm]','L = 80 [mm]','L = 100 [mm]', 'Location', 'Northeast')
thesis_fig_gen(ff.Number)

%%

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

plotter = zeros(length(SaveVar21p2.varst.RES),length(SaveVar21p2.varst.PM));
for ff = 1:length(SaveVar21p2.varst.RES)
    for gg = 1:length(SaveVar21p2.varst.PM)
        
        plotter(ff,gg) = nnz(SaveVar21p2.SWres(4,:,gg,ff,5))-1;
        
    end 
end

ff = figure; 
subplot(1,2,1)
imagesc(SaveVar21p2.varst.RES,SaveVar21p2.varst.PM.*100,plotter') 
xlabel 'B_0 [T]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);


plotter = zeros(length(SaveVar21p2.varst.RES),length(SaveVar21p2.varst.Lengths));
for hh = 1:length(SaveVar21p2.varst.RES)
    for gg = 1:length(SaveVar21p2.varst.Lengths)
        
        plotter(hh,gg) = nnz(SaveVar21p2.SWres(4,:,5,hh,gg))-1;
        
    end 
end

subplot(1,2,2)
imagesc(SaveVar21p2.varst.RES,SaveVar21p2.varst.Lengths.*100,plotter') 
xlabel 'B_0 [T]'; ylabel 'L [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);

%%

% load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p4.mat')
ist = SaveVar22p4;
in = '+--';

ff = figure;
pt6 = nonzeros(ist.SWres(1,:,1,1));
pt5 = nonzeros(ist.SWres(1,:,1,11));
pt4 = nonzeros(ist.SWres(1,:,1,21));
pt3 = nonzeros(ist.SWres(1,:,1,31));

cmp6 = diff(pt6);
cmp5 = diff(pt5);
cmp4 = diff(pt4);
cmp3 = diff(pt3);
plot(cmp6); hold on; plot(cmp5); plot(cmp4); plot(cmp3);
legend ('B_s_t_a_r_t = 0.6 [T]','B_s_t_a_r_t = 0.5 [T]','B_s_t_a_r_t = 0.4 [T]','B_s_t_a_r_t = 0.3 [T]', 'Location', 'Southeast')
thesis_fig_gen(ff.Number)
%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV22p7.mat')

ist = SaveVar22p7;
plotter = zeros(length(ist.varst.Lengths),length(ist.varst.PM));
for ff = 1:length(ist.varst.Lengths)
    for gg = 1:length(ist.varst.PM)
        
        plotter(ff,gg) = nnz(ist.SWres(1,:,gg,1,ff))-1;
        
    end 
end

ff = figure; 
imagesc(ist.varst.Lengths.*100,ist.varst.PM.*100,plotter') 
xlabel 'L [cm]'; ylabel 'OD [cm]'; colorbar
title 'Number of possible channels'; thesis_fig_gen(ff.Number);