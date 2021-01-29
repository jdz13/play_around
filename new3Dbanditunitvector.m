function [Bcart] = new3Dbanditunitvector(Xin,Yin,Zin,L,R,M)
% WORKING NOW - USABLE. Can't believe this wasn't set up as a function
% before today (26/01/2021). With Caciagli, we only really use a single
% component on a plane, and all of the other codes were set up to give you
% just that. This will allow a full comparison with a Mumax output.
%   Use just like the Bandit_Cac_UVs function. So if you're validating a
%   toroid, you'll need to do this twice. Obviously will take a little
%   while to run (9 minutes for a 125K point space [50,50,50]).
%   The great thing that this code allows us to do is to probe the
%   alternate planes, such as through the cylinder/toroid. 
% Remember that the variables are permuted between the two systems!
tic 

[X,Y,Z] = meshgrid(Xin, Yin, Zin);
SWAP = [1 3 2];
if length(Xin) == 1
    Y = permute(Y,SWAP); Z = permute(Z,SWAP); X = Xin.*ones(size(Z));
else
    X = permute(X,SWAP); Y = permute(Y,SWAP); Z = permute(Z,SWAP);
end 

mu0 = 4*pi*1e-7;

Bpolar = zeros(size(Y,1),size(Y,2),size(Y,3),3,2); Bcartpri = Bpolar; 
Coord_polar = Bpolar; Bcart = Bpolar;

PhiM = [0, pi/2];

for n_axi = 1:2

    for xcount = 1:size(X,1)

        for ycount = 1:size(Y,2)

            for zcount = 1:size(Z,3)

                phiM = PhiM(n_axi);

                x = X(xcount,ycount, zcount); y = Y(xcount,ycount, zcount); z = Z(xcount,ycount, zcount);


                xprime = x.*cos(-phiM) - y.*sin(-phiM);
                yprime = x.*sin(-phiM) + y.*cos(-phiM);
                zprime = z;

                [Hrho1] = Hrho(M, xprime, yprime, zprime, L, R);
                [Hphi1] = Hphi(M, xprime, yprime, zprime, L, R);
                [Hz1] = Hz(M, xprime, yprime, zprime, L, R);

                [Coord_polar(xcount,ycount,zcount,2,n_axi),Coord_polar(xcount,ycount,zcount,1,n_axi),Coord_polar(xcount,ycount,zcount,3,n_axi)] = cart2pol(x,y,z);

                Bpolar(xcount,ycount,zcount,1,n_axi) = mu0*Hrho1; Bpolar(xcount,ycount,zcount,2,n_axi) = mu0*Hphi1; Bpolar(xcount,ycount,zcount,3,n_axi) = mu0*Hz1; 
                [Bcartpri(xcount,ycount,zcount,1,n_axi),Bcartpri(xcount,ycount,zcount,2,n_axi),Bcartpri(xcount,ycount,zcount,3,n_axi)] = Vec_feild_cyl_conv(Bpolar(xcount,ycount,zcount,1,n_axi), Bpolar(xcount,ycount,zcount,2,n_axi), Bpolar(xcount,ycount,zcount,3,n_axi), Coord_polar(xcount,ycount,zcount,2,n_axi),-phiM);

                Bcart(xcount,ycount,zcount,1,n_axi) = (Bcartpri(xcount,ycount,zcount,1,n_axi).*cos(phiM) - Bcartpri(xcount,ycount,zcount,2,n_axi).*sin(phiM));
                Bcart(xcount,ycount,zcount,2,n_axi) = (Bcartpri(xcount,ycount,zcount,1,n_axi).*sin(phiM) + Bcartpri(xcount,ycount,zcount,2,n_axi).*cos(phiM));
                Bcart(xcount,ycount,zcount,3,n_axi) = (Bcartpri(xcount,ycount,zcount,3,n_axi));

               clear Hrho1 Hz1 Hphi1

            end 
        end 
    end 
end 

Xunitx = Bcart(:,:,:,1,1); % X component for a X unit vector 
Yunitx = Bcart(:,:,:,1,2); % X component for a Y unit vector 

toc
end