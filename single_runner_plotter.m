<<<<<<< HEAD
%%

% generate the data
single_runner
%% Plot it up. Can use method 1 (tester4) or method 2 (tester2).

% define which method you want to look at.
ist = tester4;

% extract the relevant information.
maxes = rad2deg(nonzeros(ist.MLOC));
widths = rad2deg(nonzeros(ist.FWHMres));
xtheta = rad2deg(ist.varst.theta);
NSAdata = ist.masterNVC;

% plot it up nicely.
jo = figure; subplot(2,1,1)
plot(xtheta, NSAdata);
h = gca;vline(maxes)
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlim([0,90])
vline(maxes+(KRV*widths),'b:')
xlabel '\theta_m [deg]'
ylabel 'NSA'
set(h,'Xtick', maxes)
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

Bmax = zeros (1, length(theta));
for pull = 1:length(theta)
    Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 
    Bmax(pull) = max(Bxnew, [], 'all');
end 
    % plot it up nicely.
subplot(2,1,2)
plot(Bmax, NSAdata);
h = gca;
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlabel 'Feild [T]'
ylabel 'NSA';[~,col] = find(theta == nonzeros(ist.MLOC));
set(h,'Xtick', fliplr(Bmax(col)))
vline(Bmax(col))
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

%%

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
ylabel 'NSA';
set(h,'Xtick', sort(xtickvals))
vline(xtickvals)
set(h,'Ytick', [0,0.5,1])
=======
%%

% generate the data
single_runner
%% Plot it up. Can use method 1 (tester4) or method 2 (tester2).

% define which method you want to look at.
ist = tester4;

% extract the relevant information.
maxes = rad2deg(nonzeros(ist.MLOC));
widths = rad2deg(nonzeros(ist.FWHMres));
xtheta = rad2deg(ist.varst.theta);
NSAdata = ist.masterNVC;

% plot it up nicely.
jo = figure; subplot(2,1,1)
plot(xtheta, NSAdata);
h = gca;vline(maxes)
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlim([0,90])
vline(maxes+(KRV*widths),'b:')
xlabel '\theta_m [deg]'
ylabel 'NSA'
set(h,'Xtick', maxes)
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

Bmax = zeros (1, length(theta));
for pull = 1:length(theta)
    Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 
    Bmax(pull) = max(Bxnew, [], 'all');
end 
    % plot it up nicely.
subplot(2,1,2)
plot(Bmax, NSAdata);
h = gca;
legendCell = cellstr(num2str(widths, 'W_0_._3_-_0_._7 = %-g [deg]')); 
legend(legendCell, 'Location', 'Northwest')
xlabel 'Feild [T]'
ylabel 'NSA';[~,col] = find(theta == nonzeros(ist.MLOC));
set(h,'Xtick', fliplr(Bmax(col)))
vline(Bmax(col))
set(h,'Ytick', [0,0.5,1])
thesis_fig_gen(jo.Number)

%%

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
ylabel 'NSA';
set(h,'Xtick', sort(xtickvals))
vline(xtickvals)
set(h,'Ytick', [0,0.5,1])
>>>>>>> refs/remotes/origin/master
thesis_fig_gen(jo.Number)