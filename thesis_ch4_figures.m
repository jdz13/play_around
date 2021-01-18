

%% IDEAL PARTICLE SET IMAGE (USED IN CH IV BUT ALSO INTO CH V)

x = linspace(0,6000,6001);
y1 = zeros (size(x));y2 = zeros (size(x));y3 = zeros (size(x));y4 = zeros (size(x));y5 = zeros (size(x));
y1(1000) = 1; y2(2000) = 1; y3(3000) = 1; y4(4000) = 1; y5(5000) = 1;
h7 = figure;
plot(x,y1,x,y2,x,y3,x,y4,x,y5)
ylim([0,1.2])
% title 'Ideal channel system'
xlabel 'Field'
ylabel 'Signal'
legend ('Channel 1', 'Channel 2', 'Channel 3', 'Channel 4', 'Channel 5', 'Location','northwest','NumColumns',3)
thesis_fig_gen(h7.Number); clear y1 y2 y3 y4 y5 x
set(gca, 'ytick',[0,1],'yticklabel',{'low';'high'});
set(gca, 'xtick',[1000,2000,3000,4000,5000],'xticklabel',{'H_J_1';'H_J_2';'H_J_3';'H_J_4';'H_J_5'});

%% Single layer CoFeB studies - MOKE. 

t_CoFeB = [0.7,0.8,1.1,1.3];
H_k = [7200,5400,2998,1797];% [7200, 5800, 3397, 2197];
H_c = [92, 76.5, 71, 62.4];
Ms = 1.05e6;

Hk_t = (H_k./1e4).*(t_CoFeB./1e9).*Ms./2;

h1 = figure;
plot(t_CoFeB, Hk_t.*1e3,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'K_e_f_f\cdott_C_o_F_e_B [mJ\cdotm^-^2]'
lsline 
% title 'H_K analysis - Single CoFeB layers'


h2 = figure;
plot(t_CoFeB, H_c,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'H_C [Oe]'
lsline
% title 'H_C analysis - Single CoFeB layers'

thesis_fig_gen([h2.Number, h1.Number])

clear t_CoFeB H_k H_c Ms Hk_t h1 h2

%% SW Astroid plotting 

openfig 'C:\Users\JDZ\Documents\Thesis\Figures\Chapter 4 - Particle studies\SW_Astroid figure.fig';
h1 = gcf; 
subplot(2,3,1);ax1 = gca;
subplot(2,3,2);ax2 = gca;
subplot(2,3,3);ax3 = gca;
subplot(2,3,4);ax4 = gca;
subplot(2,3,5);ax5 = gca;
subplot(2,3,6);ax6 = gca;
h11 = figure; %create new figure
s2 = subplot(2,2,1); %create and get handle to the subplot axes
fig2 = get(ax2,'children'); %get handle to all the children in the figure
copyobj(fig2,s2); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal; 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'a)'; 
s3 = subplot(2,2,2);
fig3 = get(ax3,'children'); %get handle to all the children in the figure
copyobj(fig3,s3); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal; 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top');
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'b)'; 
s5 = subplot(2,2,3);
fig5 = get(ax5,'children'); %get handle to all the children in the figure
copyobj(fig5,s5); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; axis equal;
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'c)'; 
s6 = subplot(2,2,4);
fig6 = get(ax6,'children'); %get handle to all the children in the figure
copyobj(fig6,s6); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin';  axis equal;
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); 
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'd)'; 
polarmap

h12 = figure; %create new figure
s1 = gca;%create and get handle to the subplot axes
fig1 = get(ax1,'children'); %get handle to all the children in the figure
copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; set(s1, 'Xlim', s1.YLim); 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); polarmap
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'a)'; axis equal; 
axis(ax,[-750,750,-750,750])
h13 = figure; %create new figure
s4 = gca; fig4 = get(ax4,'children'); %get handle to all the children in the figure
copyobj(fig4,s4); %copy children to new parent axes i.e. the subplot axes
colorbar; ax = gca; ax.XAxisLocation = 'origin'; set(s4, 'Xlim', s4.YLim); 
ax.YAxisLocation = 'origin'; set(ax ,'Layer', 'Top'); polarmap
xlabel 'B_|_| [Oe]'; ylabel 'B_\perp [Oe]'; title 'b)'; axis equal; 
axis(ax,[-750,750,-750,750])

clear h1 h11 h12 h13 ax ax1 ax2 ax3 ax4 ax5 ax6 h11 s1 s2 s3 s4 s5 s6 fig1 fig2 fig3 fig4 fig5 fig6

%%

