% Choose the folder:
% C:\Users\JDZ\Documents\MOKE\July 2020\Statistical analysis\SP8313 - Si\Major\text files
% when prompted by the loop input function 

[maj_all_sup, maj_all_bigstr] = loop_input_moke_options(32, 'major');

figno = 2;


runnerx = linspace(-3000,3000,6001);

figure(figno); clf

plot(maj_all_sup.datax, maj_all_sup.additiveMnorm)

H2 = ((0.4106) ./(1+exp(-maj_all_sup.fitresult2nd.a*(runnerx(1:3000)-maj_all_sup.fitresult2nd.c))));
hold on; plot(runnerx(1:3000),H2,'--');

H3 = ((1-0.4106) ./(1 + exp(-maj_all_sup.fitresult1st.a*(runnerx(3000:end)-maj_all_sup.fitresult1st.c))))+0.4106;
hold on; plot(runnerx(3000:end),H3,'--');

H4 = ((-0.5853+1) ./(1+exp(-maj_all_sup.fitresult4th.a*(runnerx(3000:end)-maj_all_sup.fitresult4th.c))))+0.5853;
hold on; plot(runnerx(3000:end),H4,'--');

H5 = ((0.5853) ./(1+exp(-maj_all_sup.fitresult3rd.a*(runnerx(1:3000)-maj_all_sup.fitresult3rd.c))));
hold on; plot(runnerx(1:3000),H5,'--');

title 'Summation of major loops'
xlabel 'Field [Oe]'
ylabel 'Normalised summation of all data'
legend ('Normalised superposed data','Fit, H_2','Fit, H_3','Fit, H_4','Fit, H_5', 'Location', 'Northwest')

clear H2 H3 H4 H5  runnerx

thesis_fig_gen(figno)
