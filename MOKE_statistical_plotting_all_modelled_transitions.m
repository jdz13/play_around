x = 1:2500; kk = figure; subplot(1,3,1)
for count = 1:size(min_all_bigstr,2)
y = 1 - 1./(1+exp((x+min_all_bigstr(count).fitresult1st.c)/min_all_bigstr(count).fitresult1st.a));
plot(x,y); hold on
end
xlabel 'Field [Oe]'
ylabel 'Modelled transitions'
title 'H_1 transitions'
thesis_fig_gen(kk.Number)

subplot(1,3,2)
for count = 1:size(min_all_bigstr,2)
y = 1 - 1./(1+exp((x+min_all_bigstr(count).fitresult2nd.c)/min_all_bigstr(count).fitresult2nd.a));
plot(x,y); hold on
end

for count = 1:size(maj_all_bigstr,2)
y = 1 - 1./(1+exp((x-maj_all_bigstr(count).fitresult1st.c)/maj_all_bigstr(count).fitresult1st.a));
plot(x,y); hold on
end

for count = 1:size(maj_all_bigstr,2)
y = 1 - 1./(1+exp((x+maj_all_bigstr(count).fitresult3rd.c)/maj_all_bigstr(count).fitresult3rd.a));
plot(x,y); hold on
end
xlabel 'Field [Oe]'
ylabel 'Modelled transitions' 
title 'H_2 transitions'
thesis_fig_gen(kk.Number)

subplot(1,3,3)

for count = 1:size(maj_all_bigstr,2)
y = 1 - 1./(1+exp((x+maj_all_bigstr(count).fitresult2nd.c)/maj_all_bigstr(count).fitresult2nd.a));
plot(x,y); hold on
end

for count = 1:size(maj_all_bigstr,2)
y = 1 - 1./(1+exp((x-maj_all_bigstr(count).fitresult4th.c)/maj_all_bigstr(count).fitresult4th.a));
plot(x,y); hold on
end
xlabel 'Field [Oe]'
ylabel 'Modelled transitions'
title 'H_3 transitions'
thesis_fig_gen(kk.Number)