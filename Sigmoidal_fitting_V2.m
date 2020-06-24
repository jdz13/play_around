
All_input_x = -1000:0.1:7000;
All_Pt_s = [3,4,5,6,7,8,9,10];

Si_p.A1 = [0.06503,  NaN, 0.02614, 0.01692, 0.00942, 0.00513, 0.00645, -0.00132];
Si_p.A2 = [0.96733, NaN, 0.94678, 0.94614, 0.95188,0.97987, 0.9692, 0.97933];
Si_p.x0 = [5020.6106, NaN, 2273.70629, 1640.19765, 851.87969, 285.24345, 565.05298, -427.23511];
Si_p.dx = [13.06693, NaN, 30.60431, 21.78625, 73.37485, 33.53821, 0.67123, 28.13617];
Si_p.pcs = 200*pi./Si_p.x0.*Si_p.dx;
Si_p.diff = diff(Si_p.x0); Si_p.diff(length(Si_p.x0)) = 1;
Si_p.pdiff = 100./(Si_p.x0./Si_p.diff); Si_p.pdiff(length(Si_p.pdiff)) = [];

Si_f.A1 = [0.03317, 0.00878, 0.01418, 0.00718, 0.00601, 0.01401, 0.00782, NaN ];
Si_f.A2 = [0.95555, 0.99506, 0.99373, 0.98857, 0.99031, 0.99371, 0.99139, NaN ];
Si_f.x0 = [5564.36162, 4062.55699, 3053.44868, 2300.14233, 1595.73034, 996.36555, 658.90125, NaN ];
Si_f.dx = [83.28545, 17.02497, 9.80349, 6.80291, 5.95787, 5.24586, 6.83284, NaN ];
Si_f.pcs = 200*pi./Si_f.x0.*Si_f.dx;
Si_f.diff = diff(Si_f.x0); Si_f.diff(length(Si_f.x0)) = 1;
Si_f.pdiff = 100./(Si_f.x0./Si_f.diff); Si_f.pdiff(length(Si_f.pdiff)) = [];

Ge_p.A1 = [0.06022, 0.03576, 0.016, 0.02598, 0.00544, 0.01931, 0.01138, 0.0515];
Ge_p.A2 = [0.86754, 0.96525, 0.9922, 0.98391, 0.98956, 0.9846, 0.99076, 0.96877];
Ge_p.x0 = [4763.23151, 3647.48693, 2598.21072, 1680.98024, 1181.67134, 603.50125, 94.41173, -99.82146];
Ge_p.dx = [42.63449, 0.1144, 9.24801, 14.77906, 35.96091, 9.81336, 12.53915, 13.98655];
Ge_p.pcs = 200*pi./Ge_p.x0.*Ge_p.dx;
Ge_p.diff = diff(Ge_p.x0); Ge_p.diff(length(Ge_p.x0)) = 1;
Ge_p.pdiff = 100./(Ge_p.x0./Ge_p.diff); Ge_p.pdiff(length(Ge_p.pdiff)) = [];

figure(1); clf; 
plot(All_Pt_s, Ge_p.x0./1e3, 'o--', All_Pt_s, Si_p.x0./1e3, 'o--', All_Pt_s, Si_f.x0./1e3, 'o--')
legend('Ge particles', 'Si particles', 'Si films')
ylabel 'Channel centre (x0) equivalent to coupling [kOe]'
xlabel 'Platinum thickness [s]'
title 'Channel values for identical films, patterned/non-patterned'

figure(2); clf; 
plot(All_Pt_s, Ge_p.dx,  'o--', All_Pt_s, Si_p.dx, 'o--', All_Pt_s, Si_f.dx, 'o--')
legend('Ge particles', 'Si particles', 'Si films')
ylabel 'Channel breadth - sigmoidal spread (dx)'
xlabel 'Platinum thickness [s]'

figure(3); clf; 
plot(All_Pt_s, Ge_p.pcs,  'o--', All_Pt_s, Si_p.pcs, 'o--', All_Pt_s, Si_f.pcs, 'o--')
legend('Ge particles', 'Si particles', 'Si films')
ylabel 'Channel breadth - percentage (a) [%]'
xlabel 'Platinum thickness [s]'



%%

ist = Si_f;
figno = 4;
figure(figno); clf 

for ff = 1:length(ist.x0)
     sigmoidal_mem_funct_gen(All_input_x, ist.x0(ff), ist.pcs(ff), figno); hold on 
end 

title 'Si films'; 
xlabel 'Field [Oe]'; ylabel 'M/M_S'
legc = cellstr(num2str(All_Pt_s', 'T_P_t = %-g [s] ')); legend (legc, 'Location', 'Southeast')


figure(figno+3); clf; 

for ff = 1:length(ist.x0)
    sigmoidy  = ist.A2(ff) + (ist.A1(ff)-ist.A2(ff))./(1 + exp((All_input_x-ist.x0(ff))./ist.dx(ff)));
    plot(All_input_x, sigmoidy); hold on 
end 

title 'Si films'
xlabel 'Field [Oe]'; ylabel 'M/M_S'
legc = cellstr(num2str(All_Pt_s', 'T_P_t = %-g [s] ')); legend (legc, 'Location', 'Southeast')


%%


figure(10); clf;

legc1 = {'Si films', 'Si particles', 'Ge particles'};

ist = Si_f;
subplot(1,2,1); plot(abs(ist.pdiff),'--d'); hold on; 
xlabel 'Adjacent channel number'; ylabel '% difference between channels'
set(gca,'xlim',[1,length(ist.pdiff)]); set(gca,'xtick',1:length(ist.pdiff))
subplot(1,2,2); plot(ist.pcs,'--d'); hold on; 
xlabel 'Channel number'; ylabel '\pm% used in sigmoid';
ist = Si_p;
subplot(1,2,1); plot(abs(ist.pdiff),'--d');
subplot(1,2,2); plot(ist.pcs,'--d');
ist = Ge_p;
subplot(1,2,1); plot(abs(ist.pdiff),'--d'); legend (legc1, 'Location', 'Northwest')
subplot(1,2,2); plot(ist.pcs,'--d'); legend (legc1, 'Location', 'Northwest')



