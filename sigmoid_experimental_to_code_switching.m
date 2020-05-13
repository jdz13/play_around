%% Plotting tool to demonstrate what fitted experimental particle data would look like in the code. 
% Also then looks to provide information on how close together the channels
% are and what their spreads are. 

%-------------------------FILL THESE IN------------------------------------
gtest.A1real = [-0.19971, 0.95527,  0.54737, 0.94671, 1.07665, 0.84641, 0.99836]; 
gtest.A2real = [-5.87522, -5.80891,  -6.05674, -5.84569, -6.13417, -6.33291, -6.35834];
gtest.x = 1:1:7000;
gtest.x0 = [5564.77083, 4062.50963,  3053.66748, 2300.29563, 1596.12585, 996.00269, 658.92998]; 
gtest.dx = [82.51629, 17.71886,  10.60671, 7.14877, 6.37933, 4.81466, 6.86015];
figno = 2;
%--------------------------------------------------------------------------

figure(figno); clf
gtest.pcs = 200*pi./gtest.x0.*gtest.dx;
gtest.pcarray = cellstr(num2str(gtest.pcs', '\\pm%-g%%'));
gtest.posarray = cellstr(num2str(gtest.x0', 'c = %-g%Oe'));
gtest.A1 = 1;
gtest.A2 = 0;
legstr = cell(1,length(gtest.pcs));

for ro = 1:length(gtest.x0)
    gtest.sigmoidy  = gtest.A2 + (gtest.A1-gtest.A2)./(1 + exp((gtest.x-gtest.x0(ro))./gtest.dx(ro)));
    plot(gtest.x, gtest.sigmoidy); hold on 
    legstr(ro) = append(gtest.posarray(ro),gtest.pcarray(ro));
end 
xlabel 'B [T]'
ylabel (compose("Consequent \\mu\nEquivalent to M/Msat"))
set(gca,'Xdir','reverse')
title 'Normalised - sigmoids to be used in the code'


figure(figno+1); clf
for ro = 1:length(gtest.x0)
    gtest.sigmoidy  = gtest.A2real(ro) + (gtest.A1real(ro)-gtest.A2real(ro))./(1 + exp((gtest.x-gtest.x0(ro))./gtest.dx(ro)));
    plot(gtest.x, gtest.sigmoidy); hold on 
end 
xlabel 'B [T]'
ylabel (compose("Consequent \\mu\nEquivalent to M/Msat"))
set(gca,'Xdir','reverse')
title 'Equivalent matlab graph - proof of concept'
legend (legstr, 'Location', 'Northwest')
set(gca,'Ylim',[-7,3])

gtest.diff = diff(gtest.x0); gtest.diff(length(gtest.x0)) = 1;
gtest.pdiff = 100./(gtest.x0./gtest.diff); gtest.pdiff(length(gtest.pdiff)) = [];
figure(figno+2); subplot(1,2,1); plot(abs(gtest.pdiff),'--d'); hline(33,'--k','33%')
xlabel 'adjacent channel number'; ylabel '% difference between channels'
set(gca,'xlim',[1,length(gtest.pdiff)]); set(gca,'xtick',1:length(gtest.pdiff))
subplot(1,2,2); plot(gtest.pcs,'--rd'); hline(5,'--k','5%')
xlabel 'Channel number'; ylabel '\pm% used in sigmoid';


clear ro legstr figno