function [kappa,epsillon] = KapEpsil(z,l, rho, R, pm)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
[k] = K(z,l, rho, R, pm);

        [kappa,epsillon] = ellipke(1-(k^2), eps*10^7);

end