
% [zz10] = fol_data_ext_function();
% data found in: 
% C:\Users\JDZ\Documents\Thesis\Data\VSM data for statistical stuff


fac = 6e-9;

SP8314 = zz10(7).data(:,11) - zz10(6).data(:,11);
SP8314x = zz10(6).data(:,6);
SP8314y = SP8314 + (SP8314x.*fac);

figure;
plot(SP8314x, SP8314y.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
title 'SP8314'

H2_14.x = SP8314x(15:241);
H3_14.x = SP8314x(250:440);
H4_14.x = SP8314x(481:711);
H5_14.x = SP8314x(725:861);

H2_14.y = normalize(SP8314y(15:241),'range');
H3_14.y = normalize(SP8314y(250:440),'range');
H4_14.y = normalize(SP8314y(481:711),'range');
H5_14.y = normalize(SP8314y(725:861),'range');


ist = H2_14;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H2_14.fit, ~] = fit( xData, yData, ft, opts );

ist = H3_14;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y <= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H3_14.fit, ~] = fit( xData, yData, ft, opts );


ist = H4_14;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H4_14.fit, ~] = fit( xData, yData, ft, opts );


ist = H5_14;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H5_14.fit, ~] = fit( xData, yData, ft, opts );


figure;
plot(H2_14.fit,'r')
xlim([-2500,2500])
hold on 
plot(H3_14.fit,'r')
plot(H4_14.fit,'b')
plot(H5_14.fit,'b')
xlabel 'Field [Oe]'
ylabel '\mu, from fits'
legend ('H2','H3','H4','H5','Location', 'Southeast')
title 'SP8314'

[H2_14.fit.a,H3_14.fit.a,H4_14.fit.a,H5_14.fit.a]
[H2_14.fit.c,H3_14.fit.c,H4_14.fit.c,H5_14.fit.c]

%%

fac = 12e-9;

SP8312 = zz10(5).data(:,11) - zz10(4).data(:,11);
SP8312x = zz10(5).data(:,6);
SP8312y = SP8312 + (SP8312x.*fac);

figure;
plot(SP8312x, SP8312y.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
title 'SP8312'

H2_12.x = SP8312x(44:219);
H3_12.x = SP8312x(245:400);
H4_12.x = SP8312x(507:668);
H5_12.x = SP8312x(691:860);

H2_12.y = normalize(SP8312y(44:219),'range');
H3_12.y = normalize(SP8312y(245:400),'range');
H4_12.y = normalize(SP8312y(507:668),'range');
H5_12.y = normalize(SP8312y(691:860),'range');


ist = H2_12;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H2_12.fit, ~] = fit( xData, yData, ft, opts );

ist = H3_12;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y <= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H3_12.fit, ~] = fit( xData, yData, ft, opts );


ist = H4_12;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H4_12.fit, ~] = fit( xData, yData, ft, opts );


ist = H5_12;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H5_12.fit, ~] = fit( xData, yData, ft, opts );


figure;
plot(H2_12.fit,'r')
xlim([-4000,4000])
hold on 
plot(H3_12.fit,'r')
plot(H4_12.fit,'b')
plot(H5_12.fit,'b')
xlabel 'Field [Oe]'
ylabel '\mu, from fits'
legend ('H2','H3','H4','H5','Location', 'Southeast')
title 'SP8312'

[H2_12.fit.a,H3_12.fit.a,H4_12.fit.a,H5_12.fit.a]
[H2_12.fit.c,H3_12.fit.c,H4_12.fit.c,H5_12.fit.c]

%%

%%

fac = 4e-9;

SP8313 = zz10(9).data(:,11) - zz10(8).data(:,11);
SP8313x = zz10(8).data(:,6);
SP8313y = SP8313 + (SP8313x.*fac);

figure;
plot(SP8313x, SP8313y.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
title 'SP8313'

H2_13.x = SP8313x(5:207);
H3_13.x = SP8313x(210:392);
H4_13.x = SP8313x(397:584);
H5_13.x = SP8313x(608:788);

H2_13.y = normalize(SP8313y(5:207),'range');
H3_13.y = normalize(SP8313y(210:392),'range');
H4_13.y = normalize(SP8313y(397:584),'range');
H5_13.y = normalize(SP8313y(608:788),'range');


ist = H2_13;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H2_13.fit, ~] = fit( xData, yData, ft, opts );

ist = H3_13;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y <= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H3_13.fit, ~] = fit( xData, yData, ft, opts );


ist = H4_13;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H4_13.fit, ~] = fit( xData, yData, ft, opts );


ist = H5_13;
[xData, yData] = prepareCurveData( ist.x, ist.y );
% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% find rough parameters for the fit 
% start with a. Easiest to find the midway point (where == 0.5 on
% normalised curve)
cstartin = find(ist.y >= 0.5 , 1,'last');
cstart = ist.x(cstartin);        
% inverse of property found through Origin. Seems to work well. 
astart = 20/(max(xData) - min(xData));
% apply these properties
opts.StartPoint = [astart cstart];
% Fit model to data.
[H5_13.fit, ~] = fit( xData, yData, ft, opts );


figure;
plot(H2_13.fit,'r')
xlim([-4000,4000])
hold on 
plot(H3_13.fit,'r')
plot(H4_13.fit,'b')
plot(H5_13.fit,'b')
xlabel 'Field [Oe]'
ylabel '\mu, from fits'
legend ('H2','H3','H4','H5','Location', 'Southeast')
title 'SP8313'
[H2_13.fit.a,H3_13.fit.a,H4_13.fit.a,H5_13.fit.a]
[H2_13.fit.c,H3_13.fit.c,H4_13.fit.c,H5_13.fit.c]