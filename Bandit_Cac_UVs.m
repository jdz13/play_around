function [Xunitx,Yunitx] = Bandit_Cac_UVs(Xin,Yin,Zin,L,R,M)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[Y,Z] = meshgrid(Yin, Zin);

Y = Y'; Z = Z';

mu0 = 4*pi*1e-7;

Bpolar = zeros(size(Y,1),size(Y,2),3,2); Bcartpri = Bpolar; 
Coord_polar = Bpolar; Bcart = Bpolar;

PhiM = [0, pi/2];

for n_axi = 1:2

    for ycount = 1:size(Yin,2)

        for zcount = 1:size(Zin,2)
        
            phiM = PhiM(n_axi);
            
            x = Xin; y = Y(ycount, zcount); z = Z(ycount, zcount);


            xprime = x.*cos(-phiM) - y.*sin(-phiM);
            yprime = x.*sin(-phiM) + y.*cos(-phiM);
            zprime = z;

            [Hrho1] = Hrho(M, xprime, yprime, zprime, L, R);
            [Hphi1] = Hphi(M, xprime, yprime, zprime, L, R);
            [Hz1] = Hz(M, xprime, yprime, zprime, L, R);

            [Coord_polar(ycount,zcount,2,n_axi),Coord_polar(ycount,zcount,1,n_axi),Coord_polar(ycount,zcount,3,n_axi)] = cart2pol(x,y,z);

            Bpolar(ycount,zcount,1,n_axi) = mu0*Hrho1; Bpolar(ycount,zcount,2,n_axi) = mu0*Hphi1; Bpolar(ycount,zcount,3,n_axi) = mu0*Hz1; 
            [Bcartpri(ycount,zcount,1,n_axi),Bcartpri(ycount,zcount,2,n_axi),Bcartpri(ycount,zcount,3,n_axi)] = Vec_feild_cyl_conv(Bpolar(ycount,zcount,1,n_axi), Bpolar(ycount,zcount,2,n_axi), Bpolar(ycount,zcount,3,n_axi), Coord_polar(ycount,zcount,2,n_axi),-phiM);

            Bcart(ycount,zcount,1,n_axi) = (Bcartpri(ycount,zcount,1,n_axi).*cos(phiM) - Bcartpri(ycount,zcount,2,n_axi).*sin(phiM));
                     
           clear Hrho1 Hz1 Hphi1

        end 
    end 
end 

Xunitx = Bcart(:,:,1,1);
Yunitx = Bcart(:,:,1,2);

end

