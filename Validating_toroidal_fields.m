%% Validating Mumax fields against Caciagli. Full script that will allow to do it from nothing. 

% Here you will need to add in as many fields as you want to test, but at
% least Xunit, Yunit and an angle I would assume. 

[UnitX] = Mumax_data_extractor();
[UnitY] = Mumax_data_extractor();
[X23] = Mumax_data_extractor();
[X137] = Mumax_data_extractor();

% The function is now set up so that you shouldn't have to do any more than
% this. 

num = 50;

PhiM = [0,deg2rad(90)];

% Based on what was in here before, it looks like this was in the wrong
% direction (negative sign). Adjust if this is true.

xline = UnitX.Mdl_dtl.purelinex; % linspace(-5, 5,100);
yline = UnitX.Mdl_dtl.pureliney; % linspace(-5, 5,100);
[X,Y] = meshgrid(xline, yline);

mu0 = 4*pi*1e-7;

l = 1e-2; R = 1e-2; M = 1e6;

Bpolar = zeros(size(X,1),size(X,2),3,3); Bcartpri = Bpolar; BAkoun = Bpolar;
Coord_polar = Bpolar; Bcart = Bpolar;

tic

for n_axi = 1:2

    for xcount = 1:size(xline,2)

        for ycount = 1:size(yline,2)
        
            phiM = PhiM(n_axi);
            
            x = X(xcount,ycount); y = Y(xcount,ycount); z = UnitX.Mdl_dtl.purelinez(num);


            xprime = x.*cos(-phiM) - y.*sin(-phiM);
            yprime = x.*sin(-phiM) + y.*cos(-phiM);
            zprime = z;
                      
            [Hrho] = Hrho(M, xprime, yprime, zprime, l, R);
            [Hphi] = Hphi(M, xprime, yprime, zprime, l, R);
            [Hz] = Hz(M, xprime, yprime, zprime, l, R);

            [HyAkoun, HzAkoun, HxAkoun] = Jannsen(yprime,zprime,xprime,[2*l,2*l,2*l]);

            [Coord_polar(xcount,ycount,2,n_axi),Coord_polar(xcount,ycount,1,n_axi),Coord_polar(xcount,ycount,3,n_axi)] = cart2pol(x,y,z);

            Bpolar(xcount,ycount,1,n_axi) = mu0*Hrho; Bpolar(xcount,ycount,2,n_axi) = mu0*Hphi; Bpolar(xcount,ycount,3,n_axi) = mu0*Hz; 
            [Bcartpri(xcount,ycount,1,n_axi),Bcartpri(xcount,ycount,2,n_axi),Bcartpri(xcount,ycount,3,n_axi)] = Vec_feild_cyl_conv(Bpolar(xcount,ycount,1,n_axi), Bpolar(xcount,ycount,2,n_axi), Bpolar(xcount,ycount,3,n_axi), Coord_polar(xcount,ycount,2,n_axi),-phiM);

            Bcart(xcount,ycount,1,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*cos(phiM) - Bcartpri(xcount,ycount,2,n_axi).*sin(phiM));
            Bcart(xcount,ycount,2,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*sin(phiM) + Bcartpri(xcount,ycount,2,n_axi).*cos(phiM));
            Bcart(xcount,ycount,3,n_axi) = Bcartpri(xcount,ycount,3,n_axi);

            BAkoun(xcount,ycount,1,n_axi) = (HxAkoun.*cos(phiM) - HyAkoun.*sin(phiM))/4/pi; BAkoun(xcount,ycount,2,n_axi) = (HxAkoun.*sin(phiM) + HyAkoun.*cos(phiM))/4/pi/4/pi; BAkoun(xcount,ycount,3,n_axi) = HzAkoun/4/pi; 

            clear Hrho Hz Hphi HxAkoun HyAkoun HzAkoun

        end 
    end 
end 


Bcart_str.outer = Bcart;
BAkoun_str.outer = BAkoun;

R = 3e-3;

for n_axi = 1:2

    for xcount = 1:size(xline,2)

        for ycount = 1:size(yline,2)
        
            phiM = PhiM(n_axi);
            
            x = X(xcount,ycount); y = Y(xcount,ycount); z = UnitX.Mdl_dtl.purelinez(num);


            xprime = x.*cos(-phiM) - y.*sin(-phiM);
            yprime = x.*sin(-phiM) + y.*cos(-phiM);
            zprime = z;
                      
            [Hrho] = Hrho(M, xprime, yprime, zprime, l, R);
            [Hphi] = Hphi(M, xprime, yprime, zprime, l, R);
            [Hz] = Hz(M, xprime, yprime, zprime, l, R);

            [HyAkoun, HzAkoun, HxAkoun] = Jannsen(yprime,zprime,xprime,[2*l,2*l,2*l]);

            [Coord_polar(xcount,ycount,2,n_axi),Coord_polar(xcount,ycount,1,n_axi),Coord_polar(xcount,ycount,3,n_axi)] = cart2pol(x,y,z);

            Bpolar(xcount,ycount,1,n_axi) = mu0*Hrho; Bpolar(xcount,ycount,2,n_axi) = mu0*Hphi; Bpolar(xcount,ycount,3,n_axi) = mu0*Hz; 
            [Bcartpri(xcount,ycount,1,n_axi),Bcartpri(xcount,ycount,2,n_axi),Bcartpri(xcount,ycount,3,n_axi)] = Vec_feild_cyl_conv(Bpolar(xcount,ycount,1,n_axi), Bpolar(xcount,ycount,2,n_axi), Bpolar(xcount,ycount,3,n_axi), Coord_polar(xcount,ycount,2,n_axi),-phiM);

            Bcart(xcount,ycount,1,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*cos(phiM) - Bcartpri(xcount,ycount,2,n_axi).*sin(phiM));
            Bcart(xcount,ycount,2,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*sin(phiM) + Bcartpri(xcount,ycount,2,n_axi).*cos(phiM));
            Bcart(xcount,ycount,3,n_axi) = Bcartpri(xcount,ycount,3,n_axi);

            BAkoun(xcount,ycount,1,n_axi) = (HxAkoun.*cos(phiM) - HyAkoun.*sin(phiM))/4/pi; BAkoun(xcount,ycount,2,n_axi) = (HxAkoun.*sin(phiM) + HyAkoun.*cos(phiM))/4/pi/4/pi; BAkoun(xcount,ycount,3,n_axi) = HzAkoun/4/pi; 

            clear Hrho Hz Hphi HxAkoun HyAkoun HzAkoun

        end 
    end 
end 


Bcart_str.inner = Bcart;
BAkoun_str.inner = BAkoun;

clear PhiM xline yline X Y mu0 L R M Bpolar Bcart BAkoun Kvis  n_axi l n x y z xcount ycount zcount xprime yprime zprime 


Bcart_str.toroidal = Bcart_str.outer - Bcart_str.inner;
BAkoun_str.toroidal = BAkoun_str.outer  - BAkoun_str.inner;

toc

%% Plotting properly, and alternating angle without firing the whole script

% Validating that we can use the code, checking against Mumax (single). 

% Fill in this bit - what angle is needed and corresponding Mumax file.
phiM = 23;

testy = X23; % which are you wanting to compare with?

testmat = (Bcart_str.toroidal(:,:,1,1).*cosd(phiM) + Bcart_str.toroidal(:,:,1,2).*sind(phiM));

PCdif = (testmat - testy.Bx(:,:,num)')./testmat.*100;

figure(4); 
subplot(1,3,1); imagesc(UnitX.Mdl_dtl.purelinex,UnitX.Mdl_dtl.pureliney, testmat);
title 'Linear combination'; xlabel 'X'; ylabel 'Y'; colorbar; caxis([-0.85,0.65])
subplot(1,3,2); imagesc(UnitX.Mdl_dtl.purelinex,UnitX.Mdl_dtl.pureliney, testy.Bx(:,:,num)');
title 'Mumax'; xlabel 'X'; ylabel 'Y'; colorbar; caxis([-0.85,0.65]); polarmap

subplot(1,3,3); imagesc(UnitX.Mdl_dtl.purelinex, UnitX.Mdl_dtl.pureliney, PCdif)
title 'Plotting % difference'; xlabel 'X'; ylabel 'Y';
colorbar;  caxis([-5, 5])
