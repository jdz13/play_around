for iio = [1,2,3,6]
fig = figure(iio);
print(fig,'-Phpljm477-304b (HP Color LaserJet MFP M477fdw)', '-bestfit','-dwinc')
end

for sl = 1:10
stravlin = ['C:\Users\JDZ\Documents\Dot Meetings\05 May\May 2020, 28th (Thurs)\Figure_no_' num2str(sl) '.jpg'];
fig = figure(sl+74);
set(gcf, 'Position', get(0, 'Screensize')); % Makes the figure full screen
saveas(fig,stravlin);
end