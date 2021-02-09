
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\CoFeB Single layers\sp7616.txt','r');
formatSpec = '%f %f';
A = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\CoFeB Single layers\sp7617.txt','r');
formatSpec = '%f %f';
B = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\CoFeB Single layers\sp7618.txt','r');
formatSpec = '%f %f';
C = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\CoFeB Single layers\sp7619.txt','r');
formatSpec = '%f %f';
D = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

%%

H4 = figure;
plot(A{1,1}, normalize(A{1,2}), B{1,1}, normalize(B{1,2}), C{1,1}, normalize(C{1,2}), D{1,1}, normalize(D{1,2}))
legend('T_C_o_F_e_B = 0.7 [nm]','T_C_o_F_e_B = 0.9 [nm]','T_C_o_F_e_B = 1.1 [nm]','T_C_o_F_e_B = 1.3 [nm]', 'Location', 'Southeast')
axis([-500,500,-1.05,1.05]); xlabel 'Field [Oe]'; ylabel 'Normalised Kerr signal'
thesis_fig_gen(H4.Number)
clear H4 

%%

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 - film.txt','r');
formatSpec = '%f %f';
F = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 - film - minor.txt','r');
formatSpec = '%f %f';
Fm = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 -SiP.txt','r');
formatSpec = '%f %f';
SiP = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 -SiP - minor.txt','r');
formatSpec = '%f %f';
SiPm = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 -GeP.txt','r');
formatSpec = '%f %f';
GeP = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\Feb 2021\sp8314 -GeP - minor.txt','r');
formatSpec = '%f %f';
GePm = textscan(fileID,formatSpec,'HeaderLines',1);
fclose(fileID);

%%

h5 = figure;
plot(F{1,1},normalize(F{1,2},'range', [0 1]), 'k',(Fm{1,1}),normalize(Fm{1,2},'range', [0 1]).*0.609,'r')
xlabel 'Field [Oe]'; ylabel 'Normalised Kerr signal'; title 'Si Films'; axis([-2000,2000,-0.05,1.05])
 vline(-848, 'r:', 'J');  vline(595.6, 'k:', 'H_4');
legend ('Major loop', 'Minor loop', 'Location', 'East'); thesis_fig_gen(h5.Number);

h6 = figure;
plot(SiP{1,1},normalize(SiP{1,2},'range', [0 1]), 'k',(SiPm{1,1}),normalize(SiPm{1,2},'range', [0 1]).*0.5912,'r')
xlabel 'Field [Oe]'; ylabel 'Normalised Kerr signal'; title 'Si Particles'; axis([-2000,2000,-0.05,1.05])
vline(-961, 'r:', 'J');  vline(468, 'k:', 'H_4');
legend ('Major loop', 'Minor loop', 'Location', 'East'); thesis_fig_gen(h6.Number); 

h7 = figure;
plot(GeP{1,1},normalize(GeP{1,2},'range', [0 1]), 'k',(GePm{1,1}),normalize(GePm{1,2},'range', [0 1]).*0.5939,'r')
xlabel 'Field [Oe]'; ylabel 'Normalised Kerr signal'; title 'Ge Particles'; axis([-2000,2000,-0.05,1.05])
 vline(-960, 'r:', 'J');  vline(483.2, 'k:', 'H_4');
legend ('Major loop', 'Minor loop', 'Location', 'East'); thesis_fig_gen(h7.Number);

