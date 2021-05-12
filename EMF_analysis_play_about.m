theta = deg2rad(17.5);
[outstr51] = Thesis_E_signal_function(theta, 51, 'ideal');
[outstr75] = Thesis_E_signal_function(theta, 75, 'ideal');
[outstr101] = Thesis_E_signal_function(theta, 101, 'ideal');
[outstr125] = Thesis_E_signal_function(theta, 125, 'ideal');
[outstr151] = Thesis_E_signal_function(theta, 151, 'ideal');
[outstr175] = Thesis_E_signal_function(theta, 175, 'ideal');
[outstr201] = Thesis_E_signal_function(theta, 201, 'ideal');
[outstr225] = Thesis_E_signal_function(theta, 225, 'ideal');
[outstr251] = Thesis_E_signal_function(theta, 251, 'ideal');
[outstr275] = Thesis_E_signal_function(theta, 275, 'ideal');
[outstr301] = Thesis_E_signal_function(theta, 301, 'ideal');
[outstr401] = Thesis_E_signal_function(theta, 401, 'ideal');
[outstr501] = Thesis_E_signal_function(theta, 501, 'ideal');


figure;
ist = outstr51;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
hold on; xlabel 'X [mm]'; ylabel 'Field [T]'
ist = outstr75;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr101;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr125;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr151;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr175;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr201;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr225;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr251;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr275;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr301;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr401;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))
ist = outstr501;
plot(ist.xline, ist.HzAkoun_sum(round(size(ist.HzAkoun_sum,2)),:))



figure;
ist = outstr51;
plot(ist.xline, ist.HzAkoun_sum(1,:))
hold on; xlabel 'X [mm]'; ylabel 'Field [T]'
ist = outstr75;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr101;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr125;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr151;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr175;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr201;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr225;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr251;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr275;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr301;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr401;
plot(ist.xline, ist.HzAkoun_sum(1,:))
ist = outstr501;
plot(ist.xline, ist.HzAkoun_sum(1,:))


%%

ist = non_ideal_1144_full_V2;
hh = figure;
yyaxis left; plot(rad2deg(ist.theta), ist.phi)
ylabel 'Flux \Phi [Wb]'; xlabel '\theta_M [deg]'; yyaxis right
plot(rad2deg(ist.theta), ist.Bav); ylabel 'Average field [T]'
legend('Flux \Phi', 'Average field'); xlim([15,20]);
thesis_fig_gen(hh.Number);

%%
speed = 20; % [Hz]
ist = non_ideal_1144_full_V2;
t = ist.theta./2./pi./speed; % [s]
EMF = -diff(ist.phi)./(t(2)-t(1));
hh = figure;
yyaxis left; plot(t, ist.phi)
ylabel 'Flux \Phi [Wb]'; xlabel 'time [s]'; yyaxis right
plot(t(1:end-1), EMF); ylabel '\epsilon [V]'
legend('Flux \Phi', '\epsilon'); 
thesis_fig_gen(hh.Number);
EMFav = mean(nonzeros(EMF));

%%

folpath = 'C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI';
[non_ideal_251] = Thesis_E_signal_function(deg2rad(linspace(14,21,141)), 251, 'non ideal');
[oldfolder] = cd(folpath);
filename = 'non_ideal_251.mat';
save(filename, 'non_ideal_251')
cd(oldfolder);

%%

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV30p6.mat')
theta = SaveVar30p6.varst.theta(SaveVar30p6.ind1res(1,1,11,1,1)-10:SaveVar30p6.ind2res(1,1,11,1,1)+10);


%%
gg = figure;
plot(rad2deg(ist.theta), ist.NVC)
xlabel '\theta_M [deg]'
ylabel 'NSA'
thesis_fig_gen(gg.Number);
clear gg

gg = figure; count = 0;

for uu = [1,ceil((1:5).*(length(ist.theta)/5))]
    count = count+1; subplot(2,3,count)
    imagesc(ist.xline.*1e3, ist.xline.*1e3, fliplr(ist.HzAkoun_sum(:,:,uu)'))
    polarmap
    xlabel 'X [mm]'
    ylabel 'Y [mm]'
    colorbar
    title (['Field within a coil at ', num2str(rad2deg(ist.theta(uu))),' [deg]'])
    axis equal; axis([-1,1,-1,1]); thesis_fig_gen(gg.Number)
end

%%

gg = figure; yyaxis left; plot(rad2deg(ist.theta), ist.phi)
ylabel 'Flux \Phi [Wb]'; xlabel '\theta_M [deg]';
g = gca; f = g.YLim; yyaxis right
plot(rad2deg(ist.theta), ist.Bav,'--'); ylabel 'Average field [T]'
legend('Flux \Phi', 'Average field'); 
xlim([rad2deg(ist.theta(1)),rad2deg(ist.theta(end))]);
R_coil = 1e-3; ylim(f./pi./(R_coil^2));
thesis_fig_gen(gg.Number);

%%

clear

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter VI\1144_particle_Phi_ideal_V2.mat')

speed = 20; % [Hz]
ist = outstr;
gg = figure; yyaxis left; plot(rad2deg(ist.theta), ist.phi)
ylabel 'Flux \Phi [Wb]'; xlabel '\theta_M [deg]';
g = gca; f = g.YLim; yyaxis right
plot(rad2deg(ist.theta), ist.Bav,'--'); ylabel ('$\overline{B} [T]$', 'Interpreter', 'latex')
legend ('$flux , \Phi$','$\overline{B}$','Interpreter','latex')
xlim([rad2deg(ist.theta(1)),rad2deg(ist.theta(end))]);
R_coil = 1e-3; ylim(f./pi./(R_coil^2));
thesis_fig_gen(gg.Number);
