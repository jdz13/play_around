function [Bx,By,Bz] = Vec_feild_cyl_conv(Brho,Bphi,Bzin, phi, phiM)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

Bx = (Brho*cos(phi+phiM)) - (Bphi*sin(phi+phiM));
By = (Brho*sin(phi+phiM)) + (Bphi*cos(phi+phiM));
Bz = Bzin;

end

