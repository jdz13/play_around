%%

% generate the data
single_runner

%% Plot it up.  Starting with method 1

% define which method you want to look at.
ist = tester4;

% extract the relevant information.
maxes = rad2deg(nonzeros(ist.MLOC));
widths = rad2deg(nonzeros(ist.FWHMres));
xtheta = rad2deg(ist.varst.theta);
NSAdata = ist.masterNVC;

% plot it up nicely.
jo = figure; subplot(3,1,2)
plot(xtheta, NSAdata);
h = gca;vline(maxes)
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Southwest')
xlim([0,90])
vline(maxes+(KRV*widths),'b:')
xlabel '\theta_m [deg]'
ylabel 'NSA'
set(h,'Xtick', maxes)
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

Bmax = ist.B_maxes(:,size(maxes,1));
    % plot it up nicely.
subplot(3,1,1)
plot(Bmax, NSAdata);
h = gca;
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlabel 'Feild [T]'
ylabel 'NSA';[~,col] = find(ist.varst.theta == nonzeros(ist.MLOC));
set(h,'Xtick', sort(Bmax(col)))
vline(Bmax(col))
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

subplot(3,1,3)
for kk = 1:size(NSAdata,1)
    plot(xtheta(1:end-1), smooth(diff(NSAdata(kk,:),1,2),100));
    hold on
end
h = gca;vline(maxes)
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
hlegend = legend(legendCell, 'Location', 'South');
hlegend.NumColumns=5;
xlim([0,90])
vline(maxes+(KRV*widths),'b:')
xlabel '\theta_m [deg]'
ylabel (compose('smoothed \n differentiated NSA'))
set(h,'Xtick', maxes)
set(h,'Ytick', [])
ylim([-0.004,0])
thesis_fig_gen(jo.Number)
%% And now method 2

% define which method you want to look at.
ist = tester2;

% extract the relevant information.
maxes = rad2deg(nonzeros(ist.MLOC));
widths = rad2deg(nonzeros(ist.FWHMres));
fields = (nonzeros(ist.SWres));
xtheta = rad2deg(ist.varst.theta);
NSAdata = ist.masterNVC;
xfields = ist.B_maxes(:,1:size(maxes,1))';
xtickvals = zeros(1, size(maxes,1));
[row,col] = find(theta == nonzeros(ist.MLOC));

% plot it up nicely.
jo = figure; 
for gg = 1:size(maxes,1)
    plot(xfields(gg,:), NSAdata(gg,:));
    hold on
    xtickvals(gg) = xfields(row(gg),col(gg));
end 
h = gca;
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlabel 'Feild [T]'
ylabel 'NSA'; xtickband = sort(xtickvals);
set(h,'Xtick', sort(xtickband([1,5,8,10,12:end])))
vline(xtickvals)
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

%% Differentiated method 2
jo = figure; 
for gg = 1:size(maxes,1)
    plot(xfields(gg,1:end-1), smooth(diff(NSAdata(gg,:),1,2),100));
    hold on
    xtickvals(gg) = xfields(row(gg),col(gg));
end 
h = gca;
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlabel 'Feild [T]'
ylabel (compose('Smoothed differentiated NSA'))
set(h,'Xtick', sort(xtickband([1,5,8,10,12:end])))
vline(xtickvals)
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)