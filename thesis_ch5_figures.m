% Chapter 5 thesis figure generators

%%
% Comparison of Mumax and Caciagli sample boundaries. 

h1 = openfig('keep1.fig','reuse'); ax1 = gca;
h2 = openfig('keep2.fig','reuse'); ax2 = gca;
h3 = figure; %create new figure
s1 = subplot(2,1,1); %create and get handle to the subplot axes
s2 = subplot(2,1,2);
fig1 = get(ax1,'children'); %get handle to all the children in the figure
fig2 = get(ax2,'children');
copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
copyobj(fig2,s2); polarmap

subplot(2,1,1)
xlabel 'Distance (x) [m]'; ylabel 'Distance (y) [m]'
title 'Field profile - Mumax'; colorbar; axis equal
subplot(2,1,2)
xlabel 'Distance (x) [m]'; ylabel 'Distance (y) [m]'
title 'Field profile - Mumax'; colorbar; axis equal

set(s1, 'clim', [-0.65,0.65]); set(s1,'fontsize', 11)
set(s1, 'xlim', [-0.015,0.015]); set(s1, 'ylim', [-0.015,0.015])
set(s2, 'clim', [-0.65,0.65]); set(s2,'fontsize', 11)
set(s2, 'xlim', [-0.015,0.015]); set(s2, 'ylim', [-0.015,0.015])

set(gcf, 'Position',  [1600, 0, 540, 800]) 

close ([h1 h2])
clear s1 s2 ax1 ax2 h1 h2 h3 fig1 fig2


%%

