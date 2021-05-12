%% four element schematic to show the process of section 6.3.3
% Non-ideal model 

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\non_ideal_1144_full_V2.mat')

    theta = deg2rad(17.5);
    RES = 0.4; % Start field values. 
    pm_cl = 6e-2; % Magnet outer diameters.
    Lengths = 2e-2; % Magnet lengths
    s_rad = 1e-3; % define the sample radius (where the particles will actually be
    Yin = linspace(-1e-3, 1e-3,40); % Probe plane points in Y 
    Zin = Yin(1:20); % Probe plane points in Z 
    % xin = SaveVar29p6.probe_line(11,find(SaveVar29p6.MxB(11,:,1) >= 1.05*RES, 1, 'last'));
    xin = 0.0351200000000000;
    IB = 6e-3;
    M = 1e6;
    a = 0.1; 

    sr = 1e-3; dx = 5e-5;
    x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
    [Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
    magDp = [2e-5, 2e-5, 2e-9];
    mu0 = 4*pi*1e-7;

    xline = linspace(-1e-3,1e-3,251);
    yline = xline;
    zline = 10e-5;

    tic

    [particle_loc1] = plane_mask(Yin,Zin,s_rad);
    % Completed for positive half only, so flip and add to array (skip middle)
    particle_loc = [particle_loc1, fliplr(particle_loc1)];
    % create a control variable - total cells within the sample area (all 'on')
    control = sum(sum(particle_loc));

    [XunitX,YunitX] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,pm_cl./2,M);
    % Now we need to take the internal bore and subtract
    % this to get the proper field values.
    [IBx, IBy] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,IB./2,M);
    % Create the real unit vectors, subtractions of the
    % magnet with the internal bore.
    Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;
    
    Bxnew = Xunitx.*cos(theta) + Yunitx.*sin(theta); 
    
    new.Bxnew = Bxnew;

   % Use this data to flip the field about the
   % symmetry axis. Allows for 2x faster code.
   new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2)));
   new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
   new.temp = fliplr(new.Bxnew);
   new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))) = new.temp;

   % feed this back into the old variable 
   Bxnew = new.newBxnew;

    BZM = sigmf(Bxnew,[a.*1e4,RES]);
    toc
    
    
ist = non_ideal_1144_full_V2;
gg = figure;

subplot(2,2,1); imagesc(xline.*1e3, xline.*1e3, (Bxnew'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [T]';
set(get(c,'label'),'string','Field from drive magnet - B_z(x,y,p_0)'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

subplot(2,2,2); imagesc(xline.*1e3, xline.*1e3, (BZM'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear');
set(get(c,'label'),'string','Field \times Membership function'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);


ploc = zeros(3*size(BZM,1), 3*size(BZM,2));
for cx = 1:size(BZM,1)
    for cy = 1:size(BZM,2)
        if BZM(cx,cy)~=0
            ploc(3*cx, 3*cy) = BZM(cx,cy);
        end 
    end 
end 
plocx = linspace(-1e-3, 1e-3,3*size(BZM,1));
plocy = linspace(-1e-3, 1e-3,3*size(BZM,2));

[Mask1] = plane_mask(plocx,plocy,1e-3);
ploc = ploc.*Mask1;

[Mask2] = plane_mask(ist.xline, ist.xline,1e-3);

subplot(2,2,3); imagesc(plocx.*1e3, plocy.*1e3, (ploc'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear');
set(get(c,'label'),'string','Particles states'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

subplot(2,2,4); imagesc(ist.xline.*1e3, ist.xline.*1e3, fliplr(ist.HzAkoun_sum(:,:,51)'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear'); c.Ruler.TickLabelFormat='%g [T]';
set(get(c,'label'),'string','Field from particles in the detection coil'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

%%
% Ideal model

    theta = deg2rad(17.5);
    RES = 0.4; % Start field values. 
    pm_cl = 6e-2; % Magnet outer diameters.
    Lengths = 2e-2; % Magnet lengths
    s_rad = 1e-3; % define the sample radius (where the particles will actually be
    Yin = linspace(-1e-3, 1e-3,40); % Probe plane points in Y 
    Zin = Yin(1:20); % Probe plane points in Z 
    % xin = SaveVar29p6.probe_line(11,find(SaveVar29p6.MxB(11,:,1) >= 1.05*RES, 1, 'last'));
    xin = 0.0351200000000000;
    IB = 6e-3;
    M = 1e6;
    a = 0.1; 

    sr = 1e-3; dx = 5e-5;
    x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
    [Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
    magDp = [2e-5, 2e-5, 2e-9];
    mu0 = 4*pi*1e-7;

    xline = linspace(-1e-3,1e-3,251);
    yline = xline;
    zline = 1e-5;

    tic

    [particle_loc1] = plane_mask(Yin,Zin,s_rad);
    % Completed for positive half only, so flip and add to array (skip middle)
    particle_loc = [particle_loc1, fliplr(particle_loc1)];
    % create a control variable - total cells within the sample area (all 'on')
    control = sum(sum(particle_loc));

    [XunitX,YunitX] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,pm_cl./2,M);
    % Now we need to take the internal bore and subtract
    % this to get the proper field values.
    [IBx, IBy] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,IB./2,M);
    % Create the real unit vectors, subtractions of the
    % magnet with the internal bore.
    Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;
    
    Bxnew = Xunitx.*cos(theta) + Yunitx.*sin(theta); 
    
    new.Bxnew = Bxnew;

   % Use this data to flip the field about the
   % symmetry axis. Allows for 2x faster code.
   new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2)));
   new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
   new.temp = fliplr(new.Bxnew);
   new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))) = new.temp;

   % feed this back into the old variable 
   Bxnew = new.newBxnew;

    BZM = (Bxnew >= RES) - (Bxnew <= -RES);
    toc
    
    
ist = ideal_251;
gg = figure;

subplot(2,2,1); imagesc(xline.*1e3, xline.*1e3, (Bxnew'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','log'); c.Ruler.TickLabelFormat='%g [T]';
set(get(c,'label'),'string','Field from drive magnet - B_z(x,y,p_0)'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

subplot(2,2,2); imagesc(xline.*1e3, xline.*1e3, (BZM'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear'); 
set(get(c,'label'),'string','Field above B_0'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);


ploc = zeros(3*size(BZM,1), 3*size(BZM,2));
for cx = 1:size(BZM,1)
    for cy = 1:size(BZM,2)
        if BZM(cx,cy)~=0
            ploc(3*cx, 3*cy) = BZM(cx,cy);
        end 
    end 
end 
plocx = linspace(-1e-3, 1e-3,3*size(BZM,1));
plocy = linspace(-1e-3, 1e-3,3*size(BZM,2));

[Mask1] = plane_mask(plocx,plocy,1e-3);
ploc = ploc.*Mask1;

[Mask2] = plane_mask(ist.xline, ist.xline,1e-3);

subplot(2,2,3); imagesc(plocx.*1e3, plocy.*1e3, (ploc'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear');
set(get(c,'label'),'string','Particles states'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

subplot(2,2,4); imagesc(ist.xline.*1e3, ist.xline.*1e3, fliplr(ist.HzAkoun_sum(:,:,51)'))
xlabel 'X [mm]'; ylabel 'Y [mm]'; 
c = colorbar;set(gca,'ColorScale','linear'); c.Ruler.TickLabelFormat='%g [T]';
set(get(c,'label'),'string','Field from particles in the detection coil'); 
thesis_fig_gen(gg.Number); axis equal; axis([-1,1,-1,1]);

%% comparison of NSA and normalised Phi

ist = non_ideal_1144_full_V2;

gg = figure;
yyaxis left
plot(rad2deg(ist.theta), ist.NVC)
xlabel '\theta_M [deg]'
ylabel 'NSA'
yyaxis right 
plot(rad2deg(ist.theta), normalize(ist.phi,'range'))
ylabel 'Normalised \Phi'
legend ('NSA','Normalised \Phi')
thesis_fig_gen(gg.Number)
clear gg

%% Membership function for B_0 = 0.4 [T] and a = 0.1 [Oe]

inpx = linspace(0,0.5,501);
gg = figure;
plot(inpx,sigmf(inpx,[0.1*1e4,0.4]))
xlabel 'B_z [T]'
ylabel 'Membership function (\chi)'
thesis_fig_gen(gg.Number)


%zoomed in region
inpx = linspace(0.38,0.42,501);
gg = figure;
plot(inpx,sigmf(inpx,[0.1*1e4,0.4]))
xlabel 'B_z [T]'
ylabel 'Membership function (\chi)'
thesis_fig_gen(gg.Number)
