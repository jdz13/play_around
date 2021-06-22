function[gtest] = sigmoidal_mem_funct_gen_real_a(inputx, c, a, figno)
%% will create a sigmoidal membership function based off the inputs
% inputx is the array of B to probe (universe of discourse), say 0:0.001:0.5
% channel B is the switching field value (idealised)
% pmpc is the plus-minus percentage that would be seen from experimental
% switching, the 'sharpness' of our transitions.

gtest.x = inputx; gtest.c = c; gtest.a = a;
figure(figno); %clf; 
gtest.Sigmoidy = 1./(1 + exp(-(1./a).*(gtest.x - gtest.c)));
plot(gtest.x, gtest.Sigmoidy)
xlabel 'Field [Oe]'
ylabel ('Membership function \chi')
ylim([-0.05, 1.05]); hline(0); hline(1);
gc = gca;
text((diff(gc.XLim).*0.15)+gc.XLim(1), (diff(gc.YLim).*0.8)+gc.YLim(1),(compose("c = " + num2str(gtest.c) + "[Oe]\na = " + num2str(gtest.a) + " [Oe]")))
thesis_fig_gen(figno)

end 