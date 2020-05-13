%% A quick test to look at the effect of a in the sigmoid. Seeing how/if we can return to the old code (binary logic)
% Also feel free to change the percentages but rememeber to replicate in
% the legend.

%-------------------------FILL THESE IN------------------------------------
figno = 66;
%--------------------------------------------------------------------------

[gtest1] = sigmoidal_mem_funct_gen(0:0.001:1, 0.4, 1, 66);
[gtest10] = sigmoidal_mem_funct_gen(0:0.001:1, 0.4, 10, 66);
[gtest20] = sigmoidal_mem_funct_gen(0:0.001:1, 0.4, 20, 66);
[gtest0p1] = sigmoidal_mem_funct_gen(0:0.001:1, 0.4, 0.1, 66);

figure(figno); clf
plot(gtest0p1.x, gtest0p1.Sigmoidy); hold on 
xlabel 'B [T]'
ylabel (compose("Consequent \\mu\nEquivalent to M/Msat"))

plot(gtest1.x, gtest1.Sigmoidy)
plot(gtest10.x, gtest10.Sigmoidy)
plot(gtest20.x, gtest20.Sigmoidy)

title(compose("Sigmoidal function for various (a) values"))
legend ('a = 0.1%' ,'a = 1%' ,'a = 10%' ,'a = 20%' )

[gtest0] = sigmoidal_mem_funct_gen(0:0.001:1, 0.4, 0, 67);

clear gtest0 gtest1 gtest10 gtest20 gtest0p1 figno