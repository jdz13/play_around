
[SP8313_SiF] = fol_data_ext_function();

% C:\Users\JDZ\Documents\Thesis\Data\Si_Film_S8313

%% Plotting the EA loop for SP8313 - Si Films

ist = SP8313_SiF;

EAx = ist(39).data(1:303,6);
EAsy = ist(39).data(1:303,11);

EAshy = ist(35).data(1:303,11);
EAy = EAsy - EAshy;

hh = figure;
plot(EAx, EAy.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
xlim([-3000,3000])
thesis_fig_gen(hh.Number)

clear hh

%% Plotting the individual transitions for SP8313 - Si Films

ind = [1,76,153,227,303];
transitions.H2x = EAx(ind(1):ind(2));
transitions.H2y = normalize(EAy(ind(1):ind(2)), 'range');
transitions.H2yn = transitions.H2y./(abs(diff([mean(transitions.H2y(1:10)),mean(transitions.H2y(end-10:end))]))) - min([mean(transitions.H2y(1:10)),mean(transitions.H2y(end-10:end))]);

transitions.H3x = EAx(ind(2):ind(3));
transitions.H3y = normalize(EAy(ind(2):ind(3)), 'range');
transitions.H3yn = transitions.H3y./(abs(diff([mean(transitions.H3y(1:10)),mean(transitions.H3y(end-10:end))]))) - min([mean(transitions.H3y(1:10)),mean(transitions.H3y(end-10:end))]);

transitions.H4x = EAx(ind(3):ind(4));
transitions.H4y = normalize(EAy(ind(3):ind(4)), 'range');
transitions.H4yn = transitions.H4y./(abs(diff([mean(transitions.H4y(1:10)),mean(transitions.H4y(end-10:end))]))) - min([mean(transitions.H4y(1:10)),mean(transitions.H4y(end-10:end))]);

transitions.H5x = EAx(ind(4):ind(5));
transitions.H5y = normalize(EAy(ind(4):ind(5)), 'range');
transitions.H5yn = transitions.H5y./(abs(diff([mean(transitions.H5y(1:10)),mean(transitions.H5y(end-10:end))]))) - min([mean(transitions.H5y(1:10)),mean(transitions.H5y(end-10:end))]);

hh = figure;
subplot(2,2,1)
plot(transitions.H2x,transitions.H2yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_2 - P-AP'
vline ([-982,-842])
legend 'Transition width - 140 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,2)
plot(transitions.H3x,transitions.H3yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_3 - AP-P'
vline ([1145,1415])
legend 'Transition width - 270 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,3)
plot(transitions.H4x,transitions.H4yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_4 - P-AP'
vline ([835,975])
legend 'Transition width - 140 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,4)
plot(transitions.H5x,transitions.H5yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_5 - AP-P'
vline ([-1142,-1411])
legend 'Transition width - 269 [Oe]'
thesis_fig_gen(hh.Number)

%% Fitting those transitions 

        [xData, yData] = prepareCurveData(transitions.H2x,transitions.H2yn);
        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        % find rough parameters for the fit 
        % start with a. Easiest to find the midway point (where == 0.5 on
        % normalised curve)
        cstartin = find(transitions.H2yn <= 0.5, 1,'last');
        cstart = transitions.H2x(1+cstartin);        
        % inverse of property found through Origin. Seems to work well. 
        astart = 20/(max(xData) - min(xData));
        % apply these properties
        opts.StartPoint = [astart cstart];
        % Fit model to data.
        [transitions.H2fit, ~] = fit( xData, yData, ft, opts );
    
        [xData, yData] = prepareCurveData(transitions.H3x,transitions.H3yn);
        cstartin = find(transitions.H3yn <= 0.5, 1,'last');
        cstart = transitions.H3x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions.H3fit, ~] = fit( xData, yData, ft, opts );
        
        [xData, yData] = prepareCurveData(transitions.H4x,transitions.H4yn);
        cstartin = find(transitions.H4yn <= 0.5, 1,'first');
        cstart = transitions.H4x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions.H4fit, ~] = fit( xData, yData, ft, opts );
        
        [xData, yData] = prepareCurveData(transitions.H5x,transitions.H5yn);
        cstartin = find(transitions.H5yn <= 0.5, 1,'first');
        cstart = transitions.H5x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions.H5fit, ~] = fit( xData, yData, ft, opts );
        
clear xData yData cstartin cstart astart 

hh = figure;
    
hh = figure;
subplot(2,2,1)
plot(transitions.H2fit, transitions.H2x,transitions.H2yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_2 - P-AP'
vline ([-982,-842])
subplot(2,2,2)
plot(transitions.H3fit,transitions.H3x,transitions.H3yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_3 - AP-P'
vline ([1145,1415])
subplot(2,2,3)
plot(transitions.H4fit,transitions.H4x,transitions.H4yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_4 - P-AP'
vline ([835,975])
subplot(2,2,4)
plot(transitions.H5fit,transitions.H5x,transitions.H5yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_5 - AP-P'
vline ([-1142,-1411])
thesis_fig_gen(hh.Number)
[transitions.H2fit.a,transitions.H3fit.a,transitions.H4fit.a,transitions.H5fit.a]
[transitions.H2fit.c,transitions.H3fit.c,transitions.H4fit.c,transitions.H5fit.c]
%% Now for the high resolution angular measurments

transitions.rot_P2APx = ist(51).data(1:151,7);
transitions.rot_P2APy = normalize(ist(51).data(1:151,12),'range');
transitions.rot_AP2Px = ist(49).data(1:101,7);
transitions.rot_AP2Py = normalize(ist(49).data(1:101,12),'range');

hh = figure;
subplot(2,1,1)
plot(transitions.rot_P2APx,transitions.rot_P2APy)
xlabel 'Angle [deg]'
ylabel 'Normalised moment'
title 'Rotational field - P-AP transition, Si Film'
legend 'Transition width - 1.6 [deg]'
vline([70.9,72.1])
thesis_fig_gen(hh.Number)
subplot(2,1,2)
plot(transitions.rot_AP2Px,transitions.rot_AP2Py)
xlabel 'Angle [deg]'
ylabel 'Normalised moment'
title 'Rotational field - AP-P transition, Si Film'
legend 'Transition width - 3.4 [deg]'
vline([112.6,116])
thesis_fig_gen(hh.Number)

% Set up fittype and options. Define the eq. for a sigmoid here.
ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
[xData, yData] = prepareCurveData(transitions.rot_P2APx,transitions.rot_P2APy);
cstartin = find(transitions.rot_P2APy >= 0.5, 1,'last');
cstart = transitions.rot_P2APx(1+cstartin);        
astart = 20/(max(xData) - min(xData));
opts.StartPoint = [astart cstart];
[transitions.rotH4_fit, ~] = fit( xData, yData, ft, opts );

[xData, yData] = prepareCurveData(transitions.rot_AP2Px,transitions.rot_AP2Py);
cstartin = find(transitions.rot_AP2Py <= 0.5, 1,'last');
cstart = transitions.rot_AP2Px(1+cstartin);        
astart = 20/(max(xData) - min(xData));
opts.StartPoint = [astart cstart];
[transitions.rotH5_fit, ~] = fit( xData, yData, ft, opts );

[transitions.rotH4_fit.a,transitions.rotH5_fit.a]
[transitions.rotH4_fit.c,transitions.rotH5_fit.c]

clear xData yData hh 

%% Now time to look into the data for S1813 particles.

[SP8313_SiP] = fol_data_ext_function();

% C:\Users\JDZ\Documents\Thesis\Data\Thesis fodder\Rotational_switching_astroids_SAF_SP8313\SP8313_rotational_switching_as\Si_P_EA_JDZ

%%

ist  = SP8313_SiP;

EAx = ist(3).data(1:521,6);
EAsy = ist(3).data(1:521,11);

EAshy = ist(5).data(1:521,11);
EAy = EAsy - EAshy;
fac = -1.2e-8;
EAy = EAy - fac.*EAx;

 hh = figure;
plot(EAx, EAy.*1e6)
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'
xlim([-3500,3500])
thesis_fig_gen(hh.Number)

clear hh

%% Looking at individual transitions from this EA loop. 

ind = [3,135,144,251,267,395,406,513];
transitions2.H2x = EAx(ind(1):ind(2));
transitions2.H2y = normalize(EAy(ind(1):ind(2)), 'range');
transitions2.H2yn = transitions2.H2y./(abs(diff([mean(transitions2.H2y(1:10)),mean(transitions2.H2y(end-10:end))]))) - min([mean(transitions2.H2y(1:10)),mean(transitions2.H2y(end-10:end))]);

transitions2.H3x = EAx(ind(3):ind(4));
transitions2.H3y = normalize(EAy(ind(3):ind(4)), 'range');
transitions2.H3yn = transitions2.H3y./(abs(diff([mean(transitions2.H3y(1:10)),mean(transitions2.H3y(end-10:end))]))) - min([mean(transitions2.H3y(1:10)),mean(transitions2.H3y(end-10:end))]);

transitions2.H4x = EAx(ind(5):ind(6));
transitions2.H4y = normalize(EAy(ind(5):ind(6)), 'range');
transitions2.H4yn = transitions2.H4y./(abs(diff([mean(transitions2.H4y(1:10)),mean(transitions2.H4y(end-10:end))]))) - min([mean(transitions2.H4y(1:10)),mean(transitions2.H4y(end-10:end))]);

transitions2.H5x = EAx(ind(7):ind(8));
transitions2.H5y = normalize(EAy(ind(7):ind(8)), 'range');
transitions2.H5yn = transitions2.H5y./(abs(diff([mean(transitions2.H5y(1:10)),mean(transitions2.H5y(end-10:end))]))) - min([mean(transitions2.H5y(1:10)),mean(transitions2.H5y(end-10:end))]);

hh = figure;
subplot(2,2,1)
plot(transitions2.H2x,transitions2.H2yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_2 - P-AP'
vline ([-1451,-752])
legend 'Transition width - 689 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,2)
plot(transitions2.H3x,transitions2.H3yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_3 - AP-P'
vline ([1556,1766])
legend 'Transition width - 210 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,3)
plot(transitions2.H4x,transitions2.H4yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_4 - P-AP'
vline ([765, 1445])
legend 'Transition width - 690 [Oe]'
thesis_fig_gen(hh.Number)

subplot(2,2,4)
plot(transitions2.H5x,transitions2.H5yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_5 - AP-P'
vline ([-1771,-1541])
legend 'Transition width - 230 [Oe]'
thesis_fig_gen(hh.Number)

%% Fitting those transitions 

        [xData, yData] = prepareCurveData(transitions2.H2x,transitions2.H2yn);
        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        % find rough parameters for the fit 
        % start with a. Easiest to find the midway point (where == 0.5 on
        % normalised curve)
        cstartin = find(transitions2.H2yn <= 0.5, 1,'last');
        cstart = transitions2.H2x(1+cstartin);        
        % inverse of property found through Origin. Seems to work well. 
        astart = 20/(max(xData) - min(xData));
        % apply these properties
        opts.StartPoint = [astart cstart];
        % Fit model to data.
        [transitions2.H2fit, ~] = fit( xData, yData, ft, opts );
    
        [xData, yData] = prepareCurveData(transitions2.H3x,transitions2.H3yn);
        cstartin = find(transitions2.H3yn <= 0.5, 1,'last');
        cstart = transitions2.H3x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions2.H3fit, ~] = fit( xData, yData, ft, opts );
        
        [xData, yData] = prepareCurveData(transitions2.H4x,transitions2.H4yn);
        cstartin = find(transitions2.H4yn <= 0.5, 1,'first');
        cstart = transitions2.H4x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions2.H4fit, ~] = fit( xData, yData, ft, opts );
        
        [xData, yData] = prepareCurveData(transitions2.H5x,transitions2.H5yn);
        cstartin = find(transitions2.H5yn <= 0.5, 1,'first');
        cstart = transitions2.H5x(1+cstartin);        
        astart = 20/(max(xData) - min(xData));
        opts.StartPoint = [astart cstart];
        [transitions2.H5fit, ~] = fit( xData, yData, ft, opts );
        
clear xData yData cstartin cstart astart 

hh = figure;
    
hh = figure;
subplot(2,2,1)
plot(transitions2.H2fit, transitions2.H2x,transitions2.H2yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_2 - P-AP'
vline ([-1431,-752])
subplot(2,2,2)
plot(transitions2.H3fit,transitions2.H3x,transitions2.H3yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_3 - AP-P'
vline ([1556,1766])
subplot(2,2,3)
plot(transitions2.H4fit,transitions2.H4x,transitions2.H4yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
thesis_fig_gen(hh.Number)
title 'H_4 - P-AP'
vline ([765,1445])
subplot(2,2,4)
plot(transitions2.H5fit,transitions2.H5x,transitions2.H5yn)
xlabel 'Field [Oe]'
ylabel 'Normalised moment'
title 'H_5 - AP-P'
vline ([-1771,-1541])
thesis_fig_gen(hh.Number)
[transitions2.H2fit.a,transitions2.H3fit.a,transitions2.H4fit.a,transitions2.H5fit.a]
[transitions2.H2fit.c,transitions2.H3fit.c,transitions2.H4fit.c,transitions2.H5fit.c]

%%

%%

%% Below here was from another untitled script, but looks like it belongs here!


[EA13] = fol_data_ext_function();
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\Thesis fodder\Rotational_switching_astroids_SAF_SP8313\SP8313_rotational_switching_as\Si_P_EA_JDZ

%%

fulldatx = EA13(3).data(1:521,6);
fulldaty = EA13(3).data(1:521,11) - EA13(5).data(1:521,11);

fac = 1e-8;
fulldaty = fulldaty + fac.*fulldatx;

figure;
plot(fulldatx, fulldaty)
%%
bit(1).x = fulldatx(9:135);
bit(1).y = fulldaty(9:135)+0.4e-8.*bit(1).x;

bit(2).x = fulldatx(142:250);
bit(2).y = fulldaty(142:250);


bit(3).x = fulldatx(275:394);
bit(3).y = fulldaty(275:394);

bit(4).x = fulldatx(406:513);
bit(4).y = fulldaty(406:513);


% figure
for jj = 1:4
    subplot(2,2,jj)
    plot(bit(jj).x, (bit(jj).y).*1e6);
    xlabel 'Field [Oe]'
    ylabel 'Moment [\muemu]'
    title (['H_', num2str(jj+1)])
end

%%

%%

%%



fac = 7.2e-8;
EAx = zz2(15).data(:,6);
EAyt = zz2(15).data(:,11);
EAy = EAyt + fac.*EAx;

figure
plot(EAx,EAy)
% 
% fac2 = 7.2e-8;
% EA15x = zz2(8).data(:,6);
% EA15yt = zz2(8).data(:,11);
% EA15y = EA15yt + fac2.*EA15x;
% plot(EA15x,EA15y)

%%

fac = 7.5e-8;
xpl = Si_P(5).data(1:731,6);
ypl = Si_P(5).data(1:731,11);
yplr = ypl + fac.*xpl;

% figure
subplot(2,1,1)
plot(xpl, yplr)

sdy = smooth(diff(yplr), 20);
subplot(2,1,2)
plot(xpl(2:end), sdy)

