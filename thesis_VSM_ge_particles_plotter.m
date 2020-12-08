clear SP8314_VSM_S SP8314_VSM_SH SP8313_VSM_S SP8313_VSM_SH SP8314_VSM SP8313_VSM SP8312_VSM_S SP8312_VSM_SH SP8312_VSM

fileID = ('C:\Users\JDZ\Documents\VSM 2020\SP8314\Output\SP8314-Hys-02.txt');
[SP8314_VSM_S] = readmatrix(fileID);

fileID = ('C:\Users\JDZ\Documents\VSM 2020\SP8314\Output\Sample Holder 01.txt');
[SP8314_VSM_SH] = readmatrix(fileID);

fileID = ('C:\Users\JDZ\Documents\VSM 2020\initialtests-SP8313\Output\initialtests-SP8313-Hys-good.txt');
[SP8313_VSM_S] = readmatrix(fileID);

fileID = ('C:\Users\JDZ\Documents\VSM 2020\Sampleholder\SP8313\Output\Sampleholder-Hys-02.txt');
[SP8313_VSM_SH] = readmatrix(fileID);


fileID = ('C:\Users\JDZ\Documents\VSM 2020\SP8312\Output\SP8312-proper.txt');
[SP8312_VSM_S] = readmatrix(fileID);

fileID = ('C:\Users\JDZ\Documents\VSM 2020\SP8312\Output\SP8312-Hys.txt');
[SP8312_VSM_SH] = readmatrix(fileID);

figno = 20; figno0 = figno;

SP8313_VSM(:,1) = SP8313_VSM_S(:,9);
SP8313_VSM(:,2) = SP8313_VSM_S(:,11) - SP8313_VSM_SH(:,11);
SP8313_VSM(:,2) = SP8313_VSM(:,2) + ((SP8313_VSM(:,1).*3e-9));

SP8314_VSM(:,1) = SP8314_VSM_S(:,9);
SP8314_VSM(:,2) = SP8314_VSM_S(:,11) - SP8314_VSM_SH(:,11);
SP8314_VSM(:,2) = SP8314_VSM(:,2) + ((SP8314_VSM(:,1).*7e-9));

SP8312_VSM(:,1) = SP8312_VSM_S(:,9);
SP8312_VSM(:,2) = SP8312_VSM_S(:,11) - SP8312_VSM_SH(:,11);
SP8312_VSM(:,2) = SP8312_VSM(:,2) + ((SP8312_VSM(:,1).*1.4e-8));

figure(figno); clf; 
plot(SP8313_VSM(:,1),SP8313_VSM(:,2)*1e6)
% hline(0)
title 'SP8313 - Ge particles - VSM'
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'

figno = figno + 1;
figure(figno); clf; 
plot(SP8314_VSM(:,1),SP8314_VSM(:,2)*1e6)
% hline(0)
xlim([-3.5e3, 3.5e3])
title 'SP8314 - Ge particles - VSM'
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'

figno = figno + 1;
figure(figno); clf; 
plot(SP8312_VSM(:,1),SP8312_VSM(:,2)*1e6)
% hline(0)
xlim([-3.5e3, 3.5e3])
title 'SP8312 - Ge particles - VSM'
xlabel 'Field [Oe]'
ylabel 'Moment [\muemu]'

SP8313_VSM(1:791,3) = diff(smoothdata(SP8313_VSM(1:792,2),'gaussian',40));
SP8314_VSM(1:939,3) = diff(smoothdata(SP8314_VSM(1:940,2),'gaussian',30));
SP8312_VSM(1:897,3) = diff(smoothdata(SP8312_VSM(1:898,2),'gaussian',25));

figno = figno + 1;
figure(figno); clf;
subplot(1,2,1)
plot(SP8314_VSM(2:938,3))
subplot(1,2,2)
plot(SP8314_VSM(2:938,1),SP8314_VSM(2:938,3))

figno = figno + 1;
figure(figno); clf;
subplot(1,2,1)
plot(SP8313_VSM(1:791,3))
subplot(1,2,2)
plot(SP8313_VSM(1:791,1),SP8313_VSM(1:791,3))

figno = figno + 1;
figure(figno); clf;
subplot(1,2,1)
plot(SP8312_VSM(1:897,3))
subplot(1,2,2)
plot(SP8312_VSM(1:897,1),SP8312_VSM(1:897,3))

figno = figno + 1;
figure(figno); clf;
subplot(1,3,1)
plot(SP8312_VSM(1:897,1),SP8312_VSM(1:897,3))
title 'SP8312'; xlabel 'Field [Oe]'; ylabel 'Differentiated moment'
subplot(1,3,2)
plot(SP8313_VSM(1:791,1),SP8313_VSM(1:791,3))
title ({['Smoothed, differentiated data'], ['SP8313']}); xlabel 'Field [Oe]'; ylabel 'Differentiated moment'
subplot(1,3,3)
plot(SP8314_VSM(1:938,1),SP8314_VSM(1:938,3))
title 'SP8314'; xlabel 'Field [Oe]'; ylabel 'Differentiated moment'

figno = figno + 1;
figure(figno); clf;
subplot(1,2,1)
plot(SP8313_VSM(1:791,1),SP8313_VSM(1:791,3))
title ({'Smoothed, differentiated data', 'SP8313'}); xlabel 'Field [Oe]'; ylabel 'Differentiated moment'
subplot(1,2,2)
plot(SP8314_VSM(1:938,1),SP8314_VSM(1:938,3))
title ({'Smoothed, differentiated data', 'SP8314'}); xlabel 'Field [Oe]'; ylabel 'Differentiated moment'


ind1 = [208,395,602,791];

figno = figno+1;
figure(figno); clf; plot(SP8313_VSM(1:ind1(1),1),SP8313_VSM(1:ind1(1),2)*1e6);
hold on; plot(SP8313_VSM(ind1(1):ind1(2),1),SP8313_VSM(ind1(1):ind1(2),2)*1e6);
hold on; plot(SP8313_VSM(ind1(2):ind1(3),1),SP8313_VSM(ind1(2):ind1(3),2)*1e6);
hold on; plot(SP8313_VSM(ind1(3):ind1(4),1),SP8313_VSM(ind1(3):ind1(4),2)*1e6);
legend ('H_2','H_3','H_4','H_5','Location','Northwest')
xlabel 'Field [Oe]'; ylabel 'Moment [\muemu]'; 
title 'Seperated transitions - SP8313'
thesis_fig_gen(figno0:figno)

