%% Data in

[GeP, GePfitting] = MOKE_data_in(44, [300,820], [4:10]);
[SiP, SiPfitting] = MOKE_data_in(44, [300,820], [3,5:9]);
[SiF, SiFfitting] = MOKE_data_in(44, [200,800], [3:10]);

%% Exponential fit 

        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( 'a*exp(x./-b)', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6];     
        
%% Exponential fit plus DC shift

        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( 'a*exp(x./-b)+c', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6 1];  
        
%% Exponential fit plus independent DC shift

        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( 'a*exp(x./-b)-350', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        opts.StartPoint = [1e4 1/6];  
%% Plotting results (all)

        [xData, yData] = prepareCurveData( SiF.Pt_nm, SiF.c );
        [SiFfit, ~] = fit( xData, yData, ft, opts );
        [xData, yData] = prepareCurveData( SiP.Pt_nm, SiP.c );
        [SiPfit, ~] = fit( xData, yData, ft, opts );
        [xData, yData] = prepareCurveData( GeP.Pt_nm, GeP.c );
        [GePfit, ~] = fit( xData, yData, ft, opts );


Ptc = 0.053;
figure(1); clf;
errorbar(SiF.Pt_nm, SiF.c, ones(size (SiF.Pt_nm)).*Ptc.*0.5, ones(size (SiF.Pt_nm)).*Ptc.*0.5, 'horizontal', 'rx')
hold on;
plot(SiFfit,'r-')
errorbar(GeP.Pt_nm, GeP.c, ones(size (GeP.Pt_nm)).*Ptc.*0.5, ones(size (GeP.Pt_nm)).*Ptc.*0.5, 'horizontal', 'kx')
plot(GePfit,'k-')
errorbar(SiP.Pt_nm, SiP.c, ones(size (SiP.Pt_nm)).*Ptc.*0.5, ones(size (SiP.Pt_nm)).*Ptc.*0.5, 'horizontal', 'gx')
plot(SiPfit,'g-')

xlabel 'T_P_t [nm]'
ylabel 'Channel value [Oe]'
fstring = evalc('ft'); fstring(1:12) = []; title(fstring)

legend ('Si films', 'Fit of Si Films', 'Ge particles', 'Fit of Ge particles', 'Si particles', 'Fit of Si particles')

%% Plotting results (two)

        [xData, yData] = prepareCurveData( SiF.Pt_nm, SiF.c );
        [SiFfit, ~] = fit( xData, yData, ft, opts );
        [xData, yData] = prepareCurveData( SiP.Pt_nm, SiP.c );
        [SiPfit, ~] = fit( xData, yData, ft, opts );
        [xData, yData] = prepareCurveData( GeP.Pt_nm, GeP.c );
        [GePfit, ~] = fit( xData, yData, ft, opts );


Ptc = 0.053;
figure(2); clf;
errorbar(SiF.Pt_nm, SiF.c, ones(size (SiF.Pt_nm)).*Ptc.*0.5, ones(size (SiF.Pt_nm)).*Ptc.*0.5, 'horizontal', 'rx')
hold on;
plot(SiFfit,'r-')
errorbar(GeP.Pt_nm, GeP.c, ones(size (GeP.Pt_nm)).*Ptc.*0.5, ones(size (GeP.Pt_nm)).*Ptc.*0.5, 'horizontal', 'kx')
plot(GePfit,'k-')


xlabel 'T_P_t [nm]'
ylabel 'Channel value [Oe]'
fstring = evalc('ft'); fstring(1:12) = []; title(fstring)

legend ('Si films', 'Fit of Si Films', 'Ge particles', 'Fit of Ge particles')

fstringGep = evalc('GePfit'); fstringGep(1:13) = [];
fstringSiF = evalc('SiFfit'); fstringSiF(1:13) = [];    

yL=get(gca,'YLim'); 
xL=get(gca,'XLim'); 
xtSiF = xL(1) + 0.33*(diff(xL));
ytSiF = yL(2) - 0.33*(diff(yL));
xtGeP = xL(1) + 0.1*(diff(xL));
ytGeP = yL(1) + 0.2*(diff(yL));


text(xtGeP,ytGeP, fstringGep)
text(xtSiF,ytSiF, fstringSiF,'Color', 'r')
