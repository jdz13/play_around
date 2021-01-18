cd ('C:\Users\JDZ\Documents\MATLAB\GIT\stray-field-CMC')

[zz] = fol_data_ext_function();

no = 3;

xdata = zz(3).data(:,9);
SP7816 = zz(6).data(:,11) - zz(no).data(:,11); SP7816 = SP7816 + ((4e-9).*xdata);
SP7817 = zz(7).data(:,11) - zz(no).data(:,11); SP7817 = SP7817 + ((4e-9).*xdata);
SP7818 = zz(8).data(:,11) - zz(no).data(:,11); SP7818 = SP7818 + ((5.5e-9).*xdata);
SP7819 = zz(9).data(:,11) - zz(no).data(:,11); SP7819 = SP7819 + ((4.5e-9).*xdata);

figure(1); clf
subplot(2,2,1)
plot(xdata, SP7816.*1e6);
xlabel 'Field Oe'
ylabel 'Moment \muemu'
title 't_C_o_F_e_B = 0.7nm - HA'

subplot(2,2,2)
plot(xdata, SP7817.*1e6);
xlabel 'Field Oe'
ylabel 'Moment \muemu'
title 't_C_o_F_e_B = 0.8nm - HA'

subplot(2,2,3)
plot(xdata, SP7818.*1e6);
xlabel 'Field Oe'
ylabel 'Moment \muemu'
title 't_C_o_F_e_B = 1.1nm - HA'

subplot(2,2,4)
plot(xdata, SP7819.*1e6);
xlabel 'Field Oe'
ylabel 'Moment \muemu'
title 't_C_o_F_e_B = 1.3nm - HA'


t_CoFeB = [0.7,0.8,1.1,1.3];
H_k = [7200,5400,2998,1797];% [7200, 5800, 3397, 2197];
H_c = [92, 76.5, 71, 62.4];
Ms = 1.05e6;

Hk_t = (H_k./1e4).*(t_CoFeB./1e9).*Ms./2;

figure(2); clf
subplot(2,1,1)
plot(t_CoFeB, Hk_t.*1e3,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel '^{1}/_{2}M_s\cdotH_K\cdott_C_o_F_e_B [mJ\cdotm^-^2]'
lsline 
title 'H_K analysis - Single CoFeB layers'
subplot(2,1,2)
plot(t_CoFeB, H_c,'bx')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'H_C [Oe]'
lsline
title 'H_C analysis - Single CoFeB layers'

fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\CoFeB single layers\SP7816 - 0.7nM pm1k 1Hz.txt');
SP7816_MOKE = readmatrix(fileID);
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\CoFeB single layers\SP7817 - 0.8nM pm1k 1Hz.txt');
SP7817_MOKE = readmatrix(fileID);
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\CoFeB single layers\SP7818 - 1.1nm pm1k 1Hz.txt');
SP7818_MOKE = readmatrix(fileID);
fileID =('C:\Users\JDZ\Documents\MOKE\July 2020\CoFeB single layers\SP7819 - 1.3nm pm1k 1Hz.txt');
SP7819_MOKE = readmatrix(fileID);

figure(3); clf
subplot(2,2,1)
plot(SP7816_MOKE(:,1), SP7816_MOKE(:,2))
xlabel 'Field Oe'
ylabel 'Kerr rotation'
title 't_C_o_F_e_B = 0.7nm - EA'

subplot(2,2,2)
plot(SP7817_MOKE(:,1), SP7817_MOKE(:,2))
xlabel 'Field Oe'
ylabel 'Kerr rotation'
title 't_C_o_F_e_B = 0.8nm - EA'

subplot(2,2,3)
plot(SP7818_MOKE(:,1), SP7818_MOKE(:,2))
xlabel 'Field Oe'
ylabel 'Kerr rotation'
title 't_C_o_F_e_B = 1.1nm'

subplot(2,2,4)
plot(SP7819_MOKE(:,1), SP7819_MOKE(:,2))
xlabel 'Field Oe'
ylabel 'Kerr rotation'
title 't_C_o_F_e_B = 1.3nm'

for cnt = 1:4
    figure(1);
    subplot(2,2,cnt);
    figure(3);
    subplot(2,2,cnt);
    figure(2);
    subplot(2,1,round(cnt/2));
    thesis_fig_gen([1,2,3])
end

Hk_t = (H_k./1e4).*(t_CoFeB./1e9).*Ms./2;

figure(4);clf
plot(t_CoFeB, Hk_t.*1e3,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel '^{1}/_{2}M_s\cdotH_K\cdott_C_o_F_e_B [mJ\cdotm^-^2]'
lsline 
title 'H_K analysis - Single CoFeB layers'


figure(5); clf;
plot(t_CoFeB, H_c,'x')
xlabel 't_C_o_F_e_B [nm]'
ylabel 'H_C [Oe]'
lsline
title 'H_C analysis - Single CoFeB layers'

thesis_fig_gen([4,5])

% cd ('C:\Users\JDZ\Documents\MATLAB\GIT\play_around')