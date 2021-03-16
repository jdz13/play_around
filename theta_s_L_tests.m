%% plotting the cross sectional field profile for different magnet lengths
ist =SaveVar24p2;
R = ist.varst.PM; 
L1 = 2e-2;
M = 1e6;
IB = 6e-3;

%extract data using user inputs
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = linspace(-1e-3, 1e-3,51);
PL1 = 4.68e-3+R./2; tic
[ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
[ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
ZY2 = ZY2a-ZY2b;
L2 = 5e-2;PL2 = 6.07e-3+R./2;
[ZY5a] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,R./2,M);
[ZY5b] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,IB./2,M);
ZY5 = ZY5a-ZY5b;
L3 = 10e-2;PL3 = 5.69e-3+R./2;
[ZY10a] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,R./2,M);
[ZY10b] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,IB./2,M);
ZY10 = ZY10a-ZY10b;

ff = figure;
subplot(1,3,1); imagesc(Zin.*1e3, Yin.*1e3, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [mm]'; ylabel 'Z [mm]';  axis([-1,1,-1,1]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin.*1e3, Yin.*1e3, ZY5(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-1,1,-1,1]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin.*1e3, Yin.*1e3, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-1,1,-1,1]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
%%
ist =SaveVar24p2;
R = ist.varst.PM; 
L1 = 2e-2;
M = 1e6;
IB = 6e-3;

%extract data using user inputs
Yin = linspace(-100e-3, 100e-3,51); % Probe plane points in Y 
Zin = linspace(-100e-3, 100e-3,51);
PL1 = 4.68e-3+R./2; tic
[ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
[ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
ZY2 = ZY2a-ZY2b;
L2 = 5e-2;PL2 = 6.07e-3+R./2;
[ZY5a] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,R./2,M);
[ZY5b] = new3Dbanditunitvector(PL2,Yin,Zin,L2./2,IB./2,M);
ZY5 = ZY5a-ZY5b;
L3 = 10e-2;PL3 = 5.69e-3+R./2;
[ZY10a] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,R./2,M);
[ZY10b] = new3Dbanditunitvector(PL3,Yin,Zin,L3./2,IB./2,M);
ZY10 = ZY10a-ZY10b;

ff = figure;
subplot(1,3,1); imagesc(Zin.*1e3, Yin.*1e3, ZY2(:,:,1,1,1));axis equal;colorbar;
xlabel 'Y [mm]'; ylabel 'Z [mm]';  axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,2); imagesc(Zin.*1e3, Yin.*1e3, ZY5(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)
subplot(1,3,3); imagesc(Zin.*1e3, Yin.*1e3, ZY10(:,:,1,1,1));colorbar;axis equal
xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
% caxis([-0.6,0]); 
thesis_fig_gen(ff.Number)

%%

%extract data using user inputs
Yin = linspace(-100e-3, 100e-3,101); % Probe plane points in Y 
Zin = linspace(-100e-3, 100e-3,101);
L1 = 2e-2; tic
inp = [1,2,3,4,5,6,7].*1e-3;

for pp = 1:length(inp)
    PL1 = inp(pp)+R./2;
    [ZY2a] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,R./2,M);
    [ZY2b] = new3Dbanditunitvector(PL1,Yin,Zin,L1./2,IB./2,M);
    ZY2 = ZY2a-ZY2b;

    [ZY5a] = new3Dbanditunitvector(PL1,Yin,Zin,L2./2,R./2,M);
    [ZY5b] = new3Dbanditunitvector(PL1,Yin,Zin,L2./2,IB./2,M);
    ZY5 = ZY5a-ZY5b;

    [ZY10a] = new3Dbanditunitvector(PL1,Yin,Zin,L3./2,R./2,M);
    [ZY10b] = new3Dbanditunitvector(PL1,Yin,Zin,L3./2,IB./2,M);
    ZY10 = ZY10a-ZY10b;
    
    datastr(pp).ZY2 = ZY2;
    datastr(pp).ZY5 = ZY5;
    datastr(pp).ZY10 = ZY10;
    
end 
    
    %%
ff = figure;
for op = 1:length(inp)
    subplot(3,7,0+op); imagesc(Zin.*1e3, Yin.*1e3, datastr(op).ZY2(:,:,1,1,1));axis equal;colorbar;
    xlabel 'Y [mm]'; ylabel 'Z [mm]';  axis([-100,100,-100,100]); 
    thesis_fig_gen(ff.Number)
    subplot(3,7,7+op); imagesc(Zin.*1e3, Yin.*1e3, datastr(op).ZY5(:,:,1,1,1));colorbar;axis equal
    xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
    thesis_fig_gen(ff.Number); 
    subplot(3,7,14+op); imagesc(Zin.*1e3, Yin.*1e3, datastr(op).ZY10(:,:,1,1,1));colorbar;axis equal
    xlabel 'Y [mm]'; ylabel 'Z [mm]'; axis([-100,100,-100,100]); 
    thesis_fig_gen(ff.Number)
end