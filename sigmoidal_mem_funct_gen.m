function[gtest] = sigmoidal_mem_funct_gen(inputx, channelB, pmpc, figno)
%% will create a sigmoidal membership function based off the inputs
% inputx is the array of B to probe (universe of discourse), say 0:0.001:0.5
% channel B is the switching field value (idealised)
% pmpc is the plus-minus percentage that would be seen from experimental
% switching, the 'sharpness' of our transitions.

gtest.x = inputx; gtest.params = zeros(1,2); gtest.params(1) = channelB;   % first parameter moves maxima location, second gives it breadth.
gtest.factp = pmpc; gtest.globfac = 100/gtest.factp*2*pi; gtest.params(2) = gtest.globfac/gtest.params(1);
figure(figno); clf; 
gtest.Sigmoidy = 1./(1 + exp(-gtest.params(2).*(gtest.x - gtest.params(1))));
plot(gtest.x, gtest.Sigmoidy)
title(compose("Sigmoidal function\nc = " + num2str(gtest.params(1)) + "[T] \\pm " + num2str(gtest.factp) + "%" + ", a = " + num2str(gtest.params(2)) ))
xlabel 'B [T]'
ylabel (compose("Consequent \\mu\nEquivalent to M/Msat"))

end 