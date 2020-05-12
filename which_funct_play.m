clear gtest

gtest.x = 0:0.001:1; gtest.params = [0.5, 100]; % first parameter moves maxima location, second gives it breadth.

gtest.Gaussy = exp((-(gtest.x - gtest.params(1)).^2)./(2.*(gtest.params(2).^2)));

figure(55); clf; 
subplot(1,3,1)
plot(gtest.x, gtest.Gaussy)
title(compose("Gaussian function\n\\sigma = " + num2str(gtest.params(2)) + ", c = " + num2str(gtest.params(1)))) 

gtest.Sigmoidy = 1./(1 + exp(-gtest.params(2).*(gtest.x - gtest.params(1))));

subplot(1,3,2)
plot(gtest.x, gtest.Sigmoidy)
title(compose("Sigmoidal function\nc = " + num2str(gtest.params(1)) + ", a = " + num2str(gtest.params(2))))

%gtest.dGaussy = -(2.^(1/2)*pi^(1/2).*erf((2.^(1/2)*(gtest.params(2) - gtest.x).*(1/gtest.params(1).^2).^(1/2))/2))/(2.*(1/gtest.params(1).^2).^(1/2));
gtest.dGaussy = (exp(-(gtest.params(1) - gtest.x).^2/(2.*gtest.params(2).^2)).*(2.*gtest.params(1) - 2.*gtest.x))./(2.*gtest.params(2).^2);

subplot(1,3,3)
plot(gtest.x, gtest.dGaussy)
title(compose("Differentiated Gaussian\n\\sigma = " + num2str(gtest.params(2)) + ", c = " + num2str(gtest.params(1)))) 

syms s a b 
f = exp((-(s - a)^2)/(2*(b^2)));
dff = diff(f,s);
igf = int(f,s);
