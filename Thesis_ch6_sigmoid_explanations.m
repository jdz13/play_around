%% script to straighten out the sigmoidal section of the code - Ch VI

%% start with the basic generation of a sigmoid

x = 1:3000; y = sigmf(x,[0.15, 1950]);
hh = figure; plot(x,y); xlabel ' Field [Oe]'; ylabel 'Membership function'
text(500,0.8, compose('c = 1950 [Oe]\na = 0.15 [Oe^-^1]'))
thesis_fig_gen(hh.Number)
clear hh x y 

%% start with the basic generation of a sigmoid

x = 1:3000; y = sigmf(x,[0.1, 1950]);
hh = figure; plot(x,y); xlabel ' Field [Oe]'; ylabel 'Membership function'
text(500,0.8, compose('c = 1950 [Oe]\na = 0.1 [Oe^-^1]'))
thesis_fig_gen(hh.Number)
clear hh x y 

%% start with the basic generation of a sigmoid

x = 1:5000; y = sigmf(x,[0.15, 4000]);
hh = figure; plot(x,y); xlabel ' Field [Oe]'; ylabel 'Membership function'
text(1000,0.8, compose('c = 4000 [Oe]\na = 0.1 [Oe^-^1]'))
thesis_fig_gen(hh.Number)
clear hh x y 

%% now plot the sigmoid for multiple channels, all of constant a

a = 0.1;
x = 1:3000; y = sigmf(x,[a, 1500]);
hh = figure; plot(x,y); xlabel ' Field [Oe]'; ylabel 'Membership function'
hold on;
y = sigmf(x,[a, 500]); plot(x,y)
y = sigmf(x,[a, 1000]); plot(x,y)
y = sigmf(x,[a, 2000]); plot(x,y)
y = sigmf(x,[a, 2500]); plot(x,y)
title (compose(['Channels centred around n*500 [Oe]\nAll with a = ',num2str(a),' [Oe^-^1]']))
thesis_fig_gen(hh.Number)
clear hh x y 

%% Now look to show how this looks - equivalent graph to 5.21

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV24p1.mat')
ist  = SaveVar24p1;

Yin = linspace(-1e-3,1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26);
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]

[particle_loc] = plane_mask(Yin,Zin,ist.varst.s_rad);

tt = 21;

r = ist.probe_line(tt,find(ist.MxB(tt,:) > ist.varst.RES.*1.05, 1, 'last'));
[main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
[IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';

Bxnew = Xunitx.*cos(ist.MLOC(1,1,tt)) +Yunitx.*sin(ist.MLOC(1,1,tt));

a = 0.15; % decay parameter - [Oe^-1]
BZM = sigmf(Bxnew,[a.*1e4,ist.varst.RES]);
CM = BZM .* particle_loc'; 

hh = figure;
subplot(2,2,3)
imagesc(Yin.*1e3, Zin.*1e3, Bxnew)
xlabel 'X [mm]'
ylabel 'Y [mm]'
axis equal; axis([Yin(1),Yin(end),Zin(1),Zin(end)].*1e3)
c = colorbar; c.Ruler.TickLabelFormat='%g [T]';
thesis_fig_gen(hh.Number)
subplot(2,2,4)
imagesc(Yin.*1e3, Zin.*1e3, CM)
xlabel 'X [mm]'
ylabel 'Y [mm]'
axis equal; axis([Yin(1),Yin(end),Zin(1),Zin(end)].*1e3)
c = colorbar; caxis([0,1])
thesis_fig_gen(hh.Number)

subplot(2,2,2)
semilogy((ist.probe_line(tt,:) - (ist.varst.PM(tt)/2)).*1e3, ist.MxB(tt,:))
xlabel 'p [mm]'
ylabel 'B_m_a_x(p) [T]'
vline((r-(ist.varst.PM(tt)/2)).*1e3, 'r:')
hold on 
semilogy((r-(ist.varst.PM(tt)/2)).*1e3,ist.varst.RES,'ro')
thesis_fig_gen(hh.Number)

SAA = sum(particle_loc,'all'); 
theta = deg2rad(linspace(10,25,1501));
NSA = zeros(1,length(theta));
subplot(2,2,1)
for thetac = 1:length(theta)
    Bxnew = Xunitx.*cos(theta(thetac)) +Yunitx.*sin(theta(thetac));
    BZM = sigmf(Bxnew,[a.*1e4,ist.varst.RES]);
    CM = BZM .* particle_loc'; 
    NSA(thetac) = sum(CM,'all')/SAA;
end
plot(rad2deg(theta), NSA)
xlabel 'Theta [deg]'
ylabel 'NSA'
hold on
plot(rad2deg(ist.MLOC(1,1,tt)),0.5,'ro')
f1 = find(NSA>0.7, 1,'last');
f2 = find(NSA>0.3, 1,'last');
vline(rad2deg(theta([f1,f2])),'r:')
thesis_fig_gen(hh.Number)

%%

clear hh c r ist SaveVar24p1 Yin Zin M IB particle_loc IBs main tt Xunitx Yunitx Bxnew BZM CM