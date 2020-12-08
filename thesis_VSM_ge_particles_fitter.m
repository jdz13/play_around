

ind1 = [208,395,602,791];

% figno = figno+1;
% figure(figno); clf; plot(SP8313_VSM(1:ind1(1),1),SP8313_VSM(1:ind1(1),2)*1e6);
% hold on; plot(SP8313_VSM(ind1(1):ind1(2),1),SP8313_VSM(ind1(1):ind1(2),2)*1e6);
% hold on; plot(SP8313_VSM(ind1(2):ind1(3),1),SP8313_VSM(ind1(2):ind1(3),2)*1e6);
% hold on; plot(SP8313_VSM(ind1(3):ind1(4),1),SP8313_VSM(ind1(3):ind1(4),2)*1e6);
% legend ('H_2','H_3','H_4','H_5','Location','Northwest')
% xlabel 'Field [Oe]'; ylabel 'Moment [\muemu]'; 
% title 'Seperated transitions - SP8313'
% thesis_fig_gen(figno0:figno)


% Set up fittype and options. Define the eq. for a sigmoid here.
    ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    
    [xData, yData] = prepareCurveData(SP8313_VSM(4:ind1(1),1),normalize(SP8313_VSM(4:ind1(1),2),'range'));

    % apply these properties
    opts.StartPoint = [10, -1500];

    % Fit model to data.
    [H2fit, ~] = fit( xData, yData, ft, opts );

    
    [xData, yData] = prepareCurveData(SP8313_VSM(ind1(1):ind1(2),1), SP8313_VSM(ind1(1):ind1(2),2)*1e6);
    opts.StartPoint = [0.1, 2200]; [H3fit, ~] = fit( xData, yData, ft, opts );
    [xData, yData] = prepareCurveData(SP8313_VSM(ind1(2):ind1(3),1), SP8313_VSM(ind1(2):ind1(3),2)*1e6);
    opts.StartPoint = [0.1, 1500]; [H4fit, ~] = fit( xData, yData, ft, opts );
    [xData, yData] = prepareCurveData(SP8313_VSM(ind1(3):ind1(4),1), SP8313_VSM(ind1(3):ind1(4),2)*1e6);
    opts.StartPoint = [0.1, -2200];[H5fit, ~] = fit( xData, yData, ft, opts );
    
    figure(28); hold on;
    plot(H2fit)