
PtCal = 0.072; %[nm/s]
CoFeBt = 1; % [nm]
Ms = 1e6; % [A/m]

GeP.Jstar = [-4992.1, -3869.5, -2745.1, -1992.4, -1425.6, -954.6, -585.5, -373.3];
GeP.TPt = 3:10;
GeP.TPtnm = GeP.TPt.*PtCal;
GeP.J = GeP.Jstar .* Ms .* CoFeBt .* 1e-7 .*1e-3;

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( GeP.TPtnm, abs(GeP.Jstar./CoFeBt));
        [GeP.fit, ~] = fit( xData, yData, ft, opts );

%%

PtCal = 0.072; %[nm/s]
CoFeBt = 1; % [nm]
Ms = 1e6; % [A/m]

SiP.Jstar = [-5211.1, -2602.4, -1957.8, -1252.7, -919.7];
SiP.TPt = [3,5:8];
SiP.TPtnm = SiP.TPt.*PtCal;
SiP.J = SiP.Jstar .* Ms .* CoFeBt .* 1e-7 .*1e-3;

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( SiP.TPtnm, abs(SiP.Jstar./CoFeBt));
        [SiP.fit, ~] = fit( xData, yData, ft, opts );


%%

PtCal = 0.072; %[nm/s]
CoFeBt = 1; % [nm]
Ms = 1e6; % [A/m]

SiF.Jstar = [-3802.8, -2852.8, -2199.7, -1595.3, -1156.1, -825.7];
SiF.TPt = 4:9;
SiF.TPtnm = SiF.TPt.*PtCal;
SiF.J = SiF.Jstar .* Ms .* CoFeBt .* 1e-7 .*1e-3;

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( SiF.TPtnm, abs(SiF.Jstar./CoFeBt));
        [SiF.fit, ~] = fit( xData, yData, ft, opts );


%%
% Plot a single graph - remember to change IST at the beginning and also to
% change the title, at the end.  (others following - update 22/09/20)

figno = 9;
IST = GeP;

figure(figno); clf; 

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( IST.TPtnm, abs(IST.Jstar./CoFeBt));
        [IST.fit, ~] = fit( xData, yData, ft, opts );
        
errorbar(IST.TPtnm, abs(IST.Jstar.*CoFeBt), ones(size (IST.TPtnm)).*PtCal.*0.5, ones(size (IST.TPtnm)).*PtCal.*0.5, 'horizontal', 'kx')
hold on; plot(IST.fit,'k-')

fstring = evalc('IST.fit'); fstring(1:12) = []; %title(fstring)
yL=get(gca,'YLim'); 
xL=get(gca,'XLim'); 
xt = xL(1) + 0.33*(diff(xL));
yt = yL(2) - 0.33*(diff(yL));

text(xt,yt, fstring)
xlabel 'Platinum thickness - t_P_t [nm]'
ylabel 'H_J [Oe]'
title 'J vs t_P_t - Ge Particles'

legend ('off')
yL=get(gca,'YLim');
yyaxis right 
ylim(yL.* Ms .* CoFeBt .* 1e-7 .*1e-3)
ylabel 'J [Jm^-^2]'
xlabel 'Platinum thickness - t_P_t [nm]'

%%

figno = 8;
IST = SiF;

figure(figno); clf; 

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( IST.TPtnm, abs(IST.Jstar./CoFeBt));
        [IST.fit, ~] = fit( xData, yData, ft, opts );
        
errorbar(IST.TPtnm, abs(IST.Jstar.*CoFeBt), ones(size (IST.TPtnm)).*PtCal.*0.5, ones(size (IST.TPtnm)).*PtCal.*0.5, 'horizontal', 'rx')
hold on; plot(IST.fit,'r-')

fstring = evalc('IST.fit'); fstring(1:12) = []; %title(fstring)
yL=get(gca,'YLim'); 
xL=get(gca,'XLim'); 
xt = xL(1) + 0.33*(diff(xL));
yt = yL(2) - 0.33*(diff(yL));

text(xt,yt, fstring)
xlabel 'Platinum thickness - t_P_t [nm]'
ylabel 'H_J [Oe]'
title 'J vs t_P_t - Si Films'
legend('off')

yL=get(gca,'YLim');
yyaxis right 
ylim(yL.* Ms .* CoFeBt .* 1e-7 .*1e-3)
ylabel 'J [Jm^-^2]'
xlabel 'Platinum thickness - t_P_t [nm]'

%%

figno = 7;
IST = SiP;

figure(figno); clf; 

ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6]; 
        
        [xData, yData] = prepareCurveData( IST.TPtnm, abs(IST.Jstar./CoFeBt));
        [IST.fit, ~] = fit( xData, yData, ft, opts );

errorbar(IST.TPtnm, abs(IST.Jstar.*CoFeBt), ones(size (IST.TPtnm)).*PtCal.*0.5, ones(size (IST.TPtnm)).*PtCal.*0.5, 'horizontal', 'bx')
hold on; plot(IST.fit,'b-')

fstring = evalc('IST.fit'); fstring(1:12) = []; %title(fstring)
yL=get(gca,'YLim'); 
xL=get(gca,'XLim'); 
xt = xL(1) + 0.33*(diff(xL));
yt = yL(2) - 0.33*(diff(yL));

text(xt,yt, fstring)
xlabel 'Platinum thickness - t_P_t [nm]'
ylabel 'H_J [Oe]'
title 'J vs t_P_t - Si Particles'
legend('off')

yL=get(gca,'YLim');
yyaxis right 
ylim(yL.* Ms .* CoFeBt .* 1e-7 .*1e-3)
ylabel 'J [Jm^-^2]'
xlabel 'Platinum thickness - t_P_t [nm]'

%%
% Plot all three together 

figno = 10;
figure(figno); clf

errorbar(SiF.TPtnm, abs(SiF.Jstar.*CoFeBt), ones(size (SiF.TPtnm)).*PtCal.*0.5, ones(size (SiF.TPtnm)).*PtCal.*0.5, 'horizontal', 'rx')
hold on;
plot(SiF.fit,'r-')
errorbar(GeP.TPtnm, abs(GeP.Jstar.*CoFeBt), ones(size (GeP.TPtnm)).*PtCal.*0.5, ones(size (GeP.TPtnm)).*PtCal.*0.5, 'horizontal', 'kx')
plot(GeP.fit,'k-')
errorbar(SiP.TPtnm, abs(SiP.Jstar.*CoFeBt), ones(size (SiP.TPtnm)).*PtCal.*0.5, ones(size (SiP.TPtnm)).*PtCal.*0.5, 'horizontal', 'bx')
plot(SiP.fit,'b-')

xlim([0.2,0.75])

ylabel 'H_J [Oe]'
title 'J vs t_P_t'

yL=get(gca,'YLim');

yyaxis right
errorbar(SiF.TPtnm, abs(SiF.J.*CoFeBt), ones(size (SiF.TPtnm)).*PtCal.*0.5, ones(size (SiF.TPtnm)).*PtCal.*0.5, 'horizontal', 'rx')
hold on;
plot(SiF.fit,'r-')
errorbar(GeP.TPtnm, abs(GeP.J.*CoFeBt), ones(size (GeP.TPtnm)).*PtCal.*0.5, ones(size (GeP.TPtnm)).*PtCal.*0.5, 'horizontal', 'kx')
plot(GeP.fit,'k-')

ylim(yL.* Ms .* CoFeBt .* 1e-7 .*1e-3)
ylabel 'J [Jm^-^2]'
xlabel 'Platinum thickness - t_P_t [nm]'

legend ('Si films', '', 'Ge particles', '','Si particles','')
%%
% Plot just the Si films and Ge particles 

figno = 11;
figure(figno); clf

errorbar(SiF.TPtnm, abs(SiF.Jstar.*CoFeBt), ones(size (SiF.TPtnm)).*PtCal.*0.5, ones(size (SiF.TPtnm)).*PtCal.*0.5, 'horizontal', 'rx')
hold on;
plot(SiF.fit,'r-')
errorbar(GeP.TPtnm, abs(GeP.Jstar.*CoFeBt), ones(size (GeP.TPtnm)).*PtCal.*0.5, ones(size (GeP.TPtnm)).*PtCal.*0.5, 'horizontal', 'kx')
plot(GeP.fit,'k-')

xlim([0.2,0.75])

ylabel 'H_J [Oe]'
title 'J vs t_P_t'


yL=get(gca,'YLim');

yyaxis right
errorbar(SiF.TPtnm, abs(SiF.J.*CoFeBt), ones(size (SiF.TPtnm)).*PtCal.*0.5, ones(size (SiF.TPtnm)).*PtCal.*0.5, 'horizontal', 'rx')
hold on;
plot(SiF.fit,'r-')
errorbar(GeP.TPtnm, abs(GeP.J.*CoFeBt), ones(size (GeP.TPtnm)).*PtCal.*0.5, ones(size (GeP.TPtnm)).*PtCal.*0.5, 'horizontal', 'kx')
plot(GeP.fit,'k-')

ylim(yL.* Ms .* CoFeBt .* 1e-7 .*1e-3)
ylabel 'J [Jm^-^2]'
xlabel 'Platinum thickness - t_P_t [nm]'

legend ('Si films', '', 'Ge particles','')

%%
c1 = confint(SiF.fit,0.95);
c2 = confint(GeP.fit,0.95);
c3 = confint(SiP.fit,0.95);
figure(12); clf;
subplot(1,2,1)
errorbar(SiF.fit.a,1, abs(SiF.fit.a - c1(1,1)) , abs(SiF.fit.a - c1(2,1)),  'horizontal', 'rx'); hold on
errorbar(GeP.fit.a,3, abs(GeP.fit.a - c2(1,1)) , abs(GeP.fit.a - c2(2,1)),  'horizontal', 'kx')
errorbar(SiP.fit.a,2, abs(SiP.fit.a - c3(1,1)) , abs(SiP.fit.a - c3(2,1)),  'horizontal', 'bx')
title 'Comparison of A values'
ylim([0.5,4])
 xlim([1,1.7].*1e4)
xlabel 'A [J\cdotnm]'
legend('Films on Si',  'Particles on Si', 'Particles on Ge')
thesis_fig_gen(12)
subplot(1,2,2)
errorbar(SiF.fit.b,1, abs(SiF.fit.b - c1(1,2)) , abs(SiF.fit.b - c1(2,2)),  'horizontal', 'rx'); hold on
errorbar(GeP.fit.b,3, abs(GeP.fit.b - c2(1,2)) , abs(GeP.fit.b - c2(2,2)),  'horizontal', 'kx')
errorbar(SiP.fit.b,2, abs(SiP.fit.b - c3(1,2)) , abs(SiP.fit.b - c3(2,2)),  'horizontal', 'bx')
title 'Comparison of t_d values'
ylim([0.5,4])
xlim([0.18,0.27])
xlabel 't_d [nm]'
legend('Films on Si',  'Particles on Si', 'Particles on Ge')
thesis_fig_gen(12)
%%
thesis_fig_gen(7:12)
figure(12); subplot(1,2,1); 
figure(48); subplot(1,2,2); figure(51); subplot(1,2,2); figure(45); subplot(1,2,2); 
thesis_fig_gen([12,48,45,51]);

clear xL yL yt yData xt xdata PtCal opts Ms IST c1 c2 c3 CoFeBt figno fstring ft 