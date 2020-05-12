
j = figure(23);
set(j,'WindowStyle','docked')
imagesc(inputStr.varst.PM*100, inputStr.varst.Lengths*100, rad2deg(squeeze(inputStr.FWHMres(ICS.KRV, ICS.StChan, :, ICS.StartB, :))'))
xlabel 'OD [cm]'; ylabel 'L [cm]'; title 'FWHM of first transition'
colorbar

ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(inputStr.varst.Lengths)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

trial = linspace(ax.XLim(1),ax.XLim(2),length(inputStr.varst.PM)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
xticks(trial);    xticklabels(((inputStr.varst.PM)));

%%

    a = cellstr(num2str(inputStr.varst.PM'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(inputStr.varst.Lengths'.*100, 'L = %-gcm '));
    count = 1;

    legendCellPM = cell(1,(size(inputStr.varst.Lengths,2)));
    legendCellL = cell(1,(size(inputStr.varst.PM,2)));
    
figure(24); clf;
subplot(1,2,1)
for jj = 1:size(inputStr.varst.Lengths,2)
    
    plt = inputStr.SWres(ICS.KRV,:, size(inputStr.varst.PM,2), ICS.StartB, jj);
    plt(plt==0) = [];
    semilogy(plt,'x--')
    hold on
    title (compose("Fixed OD at " + num2str(inputStr.varst.PM(size(inputStr.varst.PM,2))*100) + "cm, n = " + num2str(jj)))
    legendCellPM(count) = append(a(size(inputStr.varst.PM,2)),b(jj)); count = count+1;
    xlabel 'Channel number'; ylabel 'Field value for a particular channel [T]'
    
end 
legend (legendCellPM)

count = 1;
subplot(1,2,2)
for jj = 1:size(inputStr.varst.PM,2)
    
    plt = inputStr.SWres(ICS.KRV,:, jj, ICS.StartB, size(inputStr.varst.Lengths,2));
    plt(plt==0) = [];
    semilogy(plt,'x--')
    hold on
    title (compose("Fixed L at " + num2str(inputStr.varst.Lengths(size(inputStr.varst.Lengths,2))*100) + "cm, n = " + num2str(jj)))
    legendCellL(count) = append(a(jj),b(size(inputStr.varst.Lengths,2))); count = count+1;
    xlabel 'Channel number'; ylabel 'Field value for a particular channel [T]'
    
end    

legend (legendCellL)

%%

figure(25); clf;
subplot(1,2,1)
for jj = 1:size(inputStr.varst.Lengths,2)
    
    plt = inputStr.SWres(ICS.KRV,:, size(inputStr.varst.PM,2), ICS.StartB, jj);
    plt(plt==0) = []; plt = diff(plt);
    semilogy(plt,'x--')
    hold on
    title (compose("Fixed OD at " + num2str(inputStr.varst.PM(size(inputStr.varst.PM,2))*100) + "cm, n = " + num2str(jj)))
    xlabel 'Channel number'; ylabel 'Field difference between adjacent channels [T]'
    
end 
legend (legendCellPM, 'Location', 'Southeast')

subplot(1,2,2)
for jj = 1:size(inputStr.varst.PM,2)
    
    plt = inputStr.SWres(ICS.KRV,:, jj, ICS.StartB, size(inputStr.varst.Lengths,2));
    plt(plt==0) = []; plt = diff(plt);
    semilogy(plt,'x--')
    hold on
    title (compose("Fixed L at " + num2str(inputStr.varst.Lengths(size(inputStr.varst.Lengths,2))*100) + "cm, n = " + num2str(jj)))
    xlabel 'Channel number'; ylabel 'Field difference between adjacent channels [T]'
    
end    

legend (legendCellL, 'Location', 'Southeast')

%%

    a = cellstr(num2str(inputStr.varst.PM'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(inputStr.varst.Lengths'.*100, 'L = %-gcm '));
    count = 1;

    legendCell1 = cell(1,4);
       
figure(24); clf;
subplot(1,2,1)
for jj = [1,11]
    for kk = [1,11]
        plt = inputStr.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
        plt(plt==0) = [];
        semilogy(plt,'x--')
        hold on
        title (compose("Four corners, Optimum channels" ))
        legendCell1(count) = append(a(kk),b(jj)); count = count+1;
        xlabel 'Channel number'; ylabel 'Field value for a particular channel [T]'
    end
end 
legend (legendCell1)



subplot(1,2,2)
for jj = [1,11]
    for kk = [1,11]
        plt = inputStr.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
        plt(plt==0) = []; plt = diff(plt);
        semilogy(plt,'x--')
        hold on
        title (compose("Four corners, difference between channels  " ))
        xlabel 'Channel number'; ylabel 'Field difference between adjacent channels [T]'
    end
end    

legend (legendCell1, 'Location', 'Southeast')