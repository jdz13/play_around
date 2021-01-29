%% plotter for all single sample measurements, major and minor. 

fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Ge Particles\Minor loops\text files\SP8313 - 7s -Ge particles  0.1Hz');
SP8313_GeP_min = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Ge Particles\Major loops\SP8313 - 7s -Ge particles  0.05Hz');
SP8313_GeP_maj = readmatrix(fileID);
h1 = figure; clf;
plot(SP8313_GeP_maj(:,1),rescale(SP8313_GeP_maj(:,2)),'k',SP8313_GeP_min(:,1),rescale(SP8313_GeP_min(:,2)).*0.5886,'r')
title 't_P_t = 0.50[nm] - Patterned Ge'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
[c1,c2] = ischange(SP8313_GeP_min(:,2), 'Threshold',20);
f1 = find(c1); f2 = SP8313_GeP_min(f1,1); vline(mean(f2),'r:');
y=get(gca,'ylim'); txt = '\leftarrow J'; t = text(mean(f2),0.8.*y(2),txt);
t.Color = 'r'; [d1,d2] = ischange(SP8313_GeP_maj(:,2), 'Threshold',20);
f3 = find(d1); f4 = SP8313_GeP_maj(f3,1); vline(f4(2),'k:','\leftarrow H_4')
thesis_fig_gen(h1.Number)


%%
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Si Particles\Major Loops\SP8313- 7s - Si particles 0.05Hz');
SP8313_SiP_maj = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Si Particles\Minor loops\SP8313 - 7s - Si particles 0.1Hz');
SP8313_SiP_min = readmatrix(fileID);
h2 = figure; clf;
plot(SP8313_SiP_maj(:,1),rescale(SP8313_SiP_maj(:,2)),'k',SP8313_SiP_min(:,1),rescale(SP8313_SiP_min(:,2)-(2.5e-5.*SP8313_SiP_min(:,1))).*0.5475,'r')
title 't_P_t = 0.50[nm] - Patterned Si'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
[c1,c2] = ischange(SP8313_SiP_min(:,2), 'Threshold',20);
f1 = find(c1); f2 = SP8313_SiP_min(f1,1); vline(mean(f2),'r:');
y=get(gca,'ylim'); txt = '\leftarrow J'; t = text(mean(f2),0.8.*y(2),txt);
t.Color = 'r'; [d1,d2] = ischange(SP8313_SiP_maj(:,2), 'Threshold',20);
f3 = find(d1); f4 = SP8313_SiP_maj(f3,1); vline(f4(2),'k:','\leftarrow H_4')
thesis_fig_gen(h2.Number)

%%
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Si films\Major loops\4 - 0.05Hz - 6s.txt');
SP8313_SiF_maj = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Si films\Minor loops\4 - 0.2Hz - 6s.txt');
SP8313_SiF_min = readmatrix(fileID);
h3 = figure; clf;
plot(SP8313_SiF_maj(:,1),rescale(SP8313_SiF_maj(:,2)),'k',SP8313_SiF_min(:,1),rescale(SP8313_SiF_min(:,2)-(2.5e-5.*SP8313_SiF_min(:,1))).*0.5945,'r')
title 't_P_t = 0.50[nm] - Si Film'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
[c1,c2] = ischange(SP8313_SiF_min(:,2), 'Threshold',20);
f1 = find(c1); f2 = SP8313_SiF_min(f1,1); vline(mean(f2),'r:');
y=get(gca,'ylim'); txt = '\leftarrow J'; t = text(mean(f2),0.8.*y(2),txt);
t.Color = 'r'; [d1,d2] = ischange(SP8313_SiF_maj(:,2), 'Threshold',20);
f3 = find(d1); f4 = SP8313_SiF_maj(f3,1); vline(f4(2),'k:','\leftarrow H_4')
thesis_fig_gen(h3.Number)

clear t f1 f2 f3 f4 c1 c2 d1 d2 y txt fileID

clear SP8313_SiF_maj SP8313_SiF_min SP8313_SiP_maj SP8313_SiP_min SP8313_GeP_maj SP8313_GeP_min h1 h2 h3