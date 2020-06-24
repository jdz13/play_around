%% Figure of merit study for varying a values


%-------------------------FILL THESE IN------------------------------------
inputStrBin = SaveVar11p1;
inputStr0 = SaveVar12p3;
inputStr2p5 = SaveVar12p4;
inputStr5 = SaveVar12p1;
inputStr10 = SaveVar12p5;
inputStr20 = SaveVar12p6;

ICS.PMn = 11; 
ICS.Ln = 11;
ICS.KRVn = 1;
ICS.StartB = 1;

ICS.fign = 111; 
%--------------------------------------------------------------------------

h = figure(ICS.fign); clf; 
plt = inputStr0.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--x'); hold on
plt = inputStr2p5.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--x');
plt = inputStr5.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--x');
plt = inputStr10.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--x');
plt = inputStr20.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--x');
plt = inputStrBin.SWres(ICS.KRVn, :, ICS.PMn, ICS.StartB, ICS.Ln);
plt(plt==0) = [];
plot(plt*1e4,'--o');

xlabel 'Number of available channels';
ylabel 'Field corresponding to optimal channel [kOe]'
legend ('Sigmoidal - 0%', 'Sigmoidal - 2.5%', 'Sigmoidal - 5%', 'Sigmoidal - 10%', 'Sigmoidal - 20%', 'Binary logic - old code')
title 'Showing how sigmoidal breadth affects figure of merit'

clear PMn Ln inputStrBin inputStr0 inputStr5 inputStr10 inputStr20 inputStr2p5 fign h ICS plt 


ylabel 'Field corresponding to optimal channel [Oe]'
ylim ([0,300])