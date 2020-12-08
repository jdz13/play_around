

fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Ge Particles\Minor loops\text files\SP8313 - 7s -Ge particles  0.1Hz');
SP8313_GeP_min = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Ge Particles\Major loops\SP8313 - 7s -Ge particles  0.05Hz');
SP8313_GeP_maj = readmatrix(fileID);
figure(1); clf;
plot(SP8313_GeP_maj(:,1),rescale(SP8313_GeP_maj(:,2)),'k',SP8313_GeP_min(:,1),rescale(SP8313_GeP_min(:,2)).*0.5886,'r')
title 'SP8313 - Patterned Ge'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
thesis_fig_gen(1)


%%
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Si Particles\Major Loops\SP8313- 7s - Si particles 0.05Hz');
SP8313_SiP_maj = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Si Particles\Minor loops\SP8313 - 7s - Si particles 0.1Hz');
SP8313_SiP_min = readmatrix(fileID);
figure(2); clf;
plot(SP8313_SiP_maj(:,1),rescale(SP8313_SiP_maj(:,2)),'k',SP8313_SiP_min(:,1),rescale(SP8313_SiP_min(:,2)-(2.5e-5.*SP8313_SiP_min(:,1))).*0.5475,'r')
title 'SP8313 - Patterned Si'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
thesis_fig_gen(2)

%%
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\Si films\Major loops\4 - 0.05Hz - 6s.txt');
SP8313_SiF_maj = readmatrix(fileID);
fileID = ('C:\Users\JDZ\Documents\MOKE\July 2020\Si films\Minor loops\4 - 0.2Hz - 6s.txt');
SP8313_SiF_min = readmatrix(fileID);
figure(3); clf;
plot(SP8313_SiF_maj(:,1),rescale(SP8313_SiF_maj(:,2)),'k',SP8313_SiF_min(:,1),rescale(SP8313_SiF_min(:,2)-(2.5e-5.*SP8313_SiF_min(:,1))).*0.5945,'r')
title 'SP8313 - Si Film'
xlabel 'Field [Oe]'
ylabel 'Normalised Kerr rotation'
legend ('Major loop','Minor loop', 'Location','Northwest')
thesis_fig_gen(3)
