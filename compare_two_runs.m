%% This compares two methods - plotting FOM's against one another. 

%-------------------------FILL THESE IN------------------------------------
% To get this to work properly, comment out lines 39 and 41 in the plotter function and add [plotter] into output space. Will work just fine then. 
figno = 131;
ist1 = SaveVar11p1;
ist2 = SaveVar12p3;
%--------------------------------------------------------------------------


figure(figno); clf; 
subplot(1,3,1)
[pl2] = saved_var_plotter_V5_comparison (SaveVar11p1, 131, SaveVar11p1.MxB);
title 'Old method - binary logic'

subplot(1,3,3)
[pl1] = saved_var_plotter_V5_comparison (ist2, 131, ist2.MxB);
title 'New method - 0% sigmoid'

subplot(1,3,2)
imagesc(flipud(squeeze(pl1 - pl2)'));
ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(ist1.varst.Lengths)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
yticks(trial);    yticklabels((fliplr(ist1.varst.Lengths)*100));

trial = linspace(ax.XLim(1),ax.XLim(2),length(ist1.varst.PM)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
xticks(trial);    xticklabels(((ist1.varst.PM)*100));
xlabel 'PM size [cm]'; ylabel 'Lengths [cm]'; colorbar;
title 'Difference beween new and old method'

clear trial ist1 ist2 pl2 pl1 figno


