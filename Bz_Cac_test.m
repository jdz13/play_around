function [Bz] = Bz_Cac_test(M, x, y, z,L, R)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[phi,rho,z] = cart2pol(x,y,z);
mu0 = 4*pi*1e-7;

% if rho == 0
%     
%     Bz = 0;

% 
% if rho == R 
%     
%     Bz = 0;
%     
% elseif abs(z) == L && rho <= R
%     
%     Bz = 0;
    
% else
 
    Bz = ((mu0*M*R)./(pi*(rho+R)))*((Beta(z, L, rho, R, 'p')*P2fun(z,L, rho, R, 'p')) - (Beta(z, L, rho, R, 'm')*P2fun(z,L, rho, R, 'm')));

% end
end