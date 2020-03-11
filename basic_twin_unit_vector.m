num = 50;

PhiM = [0,deg2rad(90)];

% Based on what was in here before, it looks like this was in the wrong
% direction (negative sign). Adjust if this is true.

xline = Mdl_dtl.purelinex; % linspace(-5, 5,100);
yline = Mdl_dtl.pureliney; % linspace(-5, 5,100);
[X,Y] = meshgrid(xline, yline);

mu0 = 4*pi*1e-7;

l = 1e-2; R = 1e-2; M = 1e6;

Bpolar = zeros(size(X,1),size(X,2),3,3); Bcartpri = Bpolar; BAkoun = Bpolar;
Coord_polar = Bpolar; Kvis = Bpolar; Bcart = Bpolar;

tic

for n_axi = 1:2

    for xcount = 1:size(xline,2)

        for ycount = 1:size(yline,2)
        
            phiM = PhiM(n_axi);
            
            x = X(xcount,ycount); y = Y(xcount,ycount); z = Mdl_dtl.purelinez(num);


            xprime = x.*cos(-phiM) - y.*sin(-phiM);
            yprime = x.*sin(-phiM) + y.*cos(-phiM);
            zprime = z;

                        % xprime = sample.X.*cos(pull) - sample.Z.*sin(pull);
                        % yprime = sample.Y;
                        % zprime = sample.X.*sin(pull) + sample.Z.*cos(pull);
                        % 
                        % [Akoun(np)] = Janssen_with_meshgrid(xprime,yprime,zprime,PM_mag_size);
                        % 
                        % rotfield(np).fbx = Akoun(np).HxAkoun*cos(-pull) - Akoun(np).HzAkoun.*sin(-pull);
                        % rotfield(np).fby = Akoun(np).HyAkoun;
                        % rotfield(np).fbz = Akoun(np).HxAkoun.*sin(-pull) + Akoun(np).HzAkoun.*cos(-pull);
                        % rotfield(np).fbtot = sqrt(rotfield(np).fbx.^2 + rotfield(np).fby.^2 + rotfield(np).fbz.^2);

            [Hrho] = Hrho(M, xprime, yprime, zprime, l, R);
            [Hphi] = Hphi(M, xprime, yprime, zprime, l, R);
            [Hz] = Hz(M, xprime, yprime, zprime, l, R);


            [HyAkoun, HzAkoun, HxAkoun] = Jannsen(yprime,zprime,xprime,[2*l,2*l,2*l]);

            [Coord_polar(xcount,ycount,2,n_axi),Coord_polar(xcount,ycount,1,n_axi),Coord_polar(xcount,ycount,3,n_axi)] = cart2pol(x,y,z);

            [Kvis(xcount,ycount,1,n_axi)] = K(z,l, Coord_polar(xcount,ycount,1,n_axi), R, 'p'); [Kvis(xcount,ycount,2,n_axi)] = K(z,l, Coord_polar(xcount,ycount,1,n_axi), R, 'm'); 

            Bpolar(xcount,ycount,1,n_axi) = mu0*Hrho; Bpolar(xcount,ycount,2,n_axi) = mu0*Hphi; Bpolar(xcount,ycount,3,n_axi) = mu0*Hz; 
            [Bcartpri(xcount,ycount,1,n_axi),Bcartpri(xcount,ycount,2,n_axi),Bcartpri(xcount,ycount,3,n_axi)] = Vec_feild_cyl_conv(Bpolar(xcount,ycount,1,n_axi), Bpolar(xcount,ycount,2,n_axi), Bpolar(xcount,ycount,3,n_axi), Coord_polar(xcount,ycount,2,n_axi),-phiM);

            Bcart(xcount,ycount,1,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*cos(phiM) - Bcartpri(xcount,ycount,2,n_axi).*sin(phiM));
            Bcart(xcount,ycount,2,n_axi) = (Bcartpri(xcount,ycount,1,n_axi).*sin(phiM) + Bcartpri(xcount,ycount,2,n_axi).*cos(phiM));
            Bcart(xcount,ycount,3,n_axi) = Bcartpri(xcount,ycount,3,n_axi);


            %[Bcart(xcount,ycount,1),Bcart(xcount,ycount,2),Bcart(xcount,ycount,3)] = pol2cart(Bpolar(xcount,ycount,2), Bpolar(xcount,ycount,1), Bpolar(xcount,ycount,3));
            BAkoun(xcount,ycount,1,n_axi) = (HxAkoun.*cos(phiM) - HyAkoun.*sin(phiM))/4/pi; BAkoun(xcount,ycount,2,n_axi) = (HxAkoun.*sin(phiM) + HyAkoun.*cos(phiM))/4/pi/4/pi; BAkoun(xcount,ycount,3,n_axi) = HzAkoun/4/pi; 

            clear Hrho Hz Hphi HxAkoun HyAkoun HzAkoun

        end 
    end 
end 

toc