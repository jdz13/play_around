%%

D_prac = 10e-2; N_probe = 10001; M = 1e6; pm_cl = [2,3,4]*1e-2;

[MxB, SaveVar1p1.probe_line] = MxBProbeMulti(M,pm_cl, pm_cl,D_prac,N_probe);


all(le (SaveVar1p1.MxB - MxB, 1e-9),'all');

%%

L = 1e-2; 
R = 1e-2; 
M = 1e6;

Xin = Mdl_dtl.purelinex(50);
Yin = Mdl_dtl.pureliney;
Zin = Mdl_dtl.purelinez;

[Xunitx,Yunitx] = Bandit_Cac_UVs(Xin,Yin,Zin,L,R,M);


%%

phi = deg2rad(linspace(1,720,73));

figure(6)

    for p = 1:length(phi)

        tester = Xunitx.*cos(phi(p)) + Yunitx.*sin(phi(p));
        imagesc(Mdl_dtl.pureliney,Mdl_dtl.purelinez, tester)
        xlabel 'Y'; ylabel 'Z'; title 'checking rotation'
        colorbar
        pause(0.25)

    end 
    
    %%
    
% small piece of code so that we can get the mumax parameter space probed.
% input in this code is Bobj, but can be called anything (just make sure it
% knows).

Mdl_dtl.CellNo = size(Bobj(1).BXx); % Finding out how many cells there are in the world in each dimension
Mdl_dtl.gridsize = Bobj(1).object.GridSize'; % Finding out how big each cell is in each dimension;
Mdl_dtl.wrldSz = Mdl_dtl.gridsize.* Mdl_dtl.CellNo; % Total worldsize
% This should be consistent for all data, so the first structure variable
% is used (there should always be a first one!). This also holds for all of
% the purelines below as well as the extents.
Mdl_dtl.extents = Mdl_dtl.wrldSz./2;
Mdl_dtl.purelinex = linspace(-Mdl_dtl.extents(1)+Mdl_dtl.gridsize(1)/2,Mdl_dtl.extents(1)-Mdl_dtl.gridsize(1)/2,Mdl_dtl.CellNo(1));
Mdl_dtl.pureliney = linspace(-Mdl_dtl.extents(2)+Mdl_dtl.gridsize(2)/2,Mdl_dtl.extents(2)-Mdl_dtl.gridsize(2)/2,Mdl_dtl.CellNo(2));
Mdl_dtl.purelinez = linspace(-Mdl_dtl.extents(3)+Mdl_dtl.gridsize(3)/2,Mdl_dtl.extents(3)-Mdl_dtl.gridsize(3)/2,Mdl_dtl.CellNo(3));


%%

 % looking at the main plots to compare mumax and caciagli paper data. 
n = num; 

figure(4); clf;
subplot(1,3,1)
imagesc(xline, yline, Bcart(:,:,1)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bcart(:,:,2)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Bcart(:,:,3)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

figure(5); clf;
subplot(1,3,1)
imagesc(xline, yline, Bobj.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Mumax'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bobj.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(1,3,3)

imagesc(xline, yline, Bobj.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

figure(6); clf;
subplot(1,2,1)
quiver(X,Y, Bcart(:,:,1),Bcart(:,:,2))
xlabel 'X'; ylabel 'Y'; title 'Caciagli'; colorbar
subplot(1,2,2)
quiver(X,Y, Bobj.BXx(:,:,n)', Bobj.BXy(:,:,n)')
xlabel 'X'; ylabel 'Y'; title 'Mumax'; colorbar

Btot = sqrt(Bcart(:,:,1).^2 + Bcart(:,:,2).^2 + Bcart(:,:,3).^2);

%%

% looking at the four mumax data sets to try and ascertain which direction
% it rotates in. 

figure(142)
subplot(4,3,1)
imagesc(xline, yline, Xunit.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Xunit'; colorbar

subplot(4,3,2)
imagesc(xline, yline, Xunit.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,3)
imagesc(xline, yline, Xunit.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,4)
imagesc(xline, yline, X23.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - X23'; colorbar

subplot(4,3,5)
imagesc(xline, yline, X23.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,6)
imagesc(xline, yline, X23.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,7)
imagesc(xline, yline, Yunit.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Yunit'; colorbar

subplot(4,3,8)
imagesc(xline, yline, Yunit.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,9)
imagesc(xline, yline, Yunit.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,10)
imagesc(xline, yline, X137.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - X137'; colorbar

subplot(4,3,11)
imagesc(xline, yline, X137.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,12)
imagesc(xline, yline, X137.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar
figure(124)
imagesc(xline, yline, Btot); polarmap;
xlabel 'X'; ylabel 'Y'; title 'Btotal'

%%

% Basic backbone for getting some results out of the method

num = 50;

phiM = (23);

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

for xcount = 1:size(xline,2)
    
    for ycount = 1:size(yline,2)
    
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
    
    [Coord_polar(xcount,ycount,2),Coord_polar(xcount,ycount,1),Coord_polar(xcount,ycount,3)] = cart2pol(x,y,z);
    
    [Kvis(xcount,ycount,1)] = K(z,l, Coord_polar(xcount,ycount,1), R, 'p'); [Kvis(xcount,ycount,2)] = K(z,l, Coord_polar(xcount,ycount,1), R, 'm'); 
    
    Bpolar(xcount,ycount,1) = mu0*Hrho; Bpolar(xcount,ycount,2) = mu0*Hphi; Bpolar(xcount,ycount,3) = mu0*Hz; 
    [Bcartpri(xcount,ycount,1),Bcartpri(xcount,ycount,2),Bcartpri(xcount,ycount,3)] = Vec_feild_cyl_conv(Bpolar(xcount,ycount,1), Bpolar(xcount,ycount,2), Bpolar(xcount,ycount,3), Coord_polar(xcount,ycount,2),-phiM);
    
    Bcart(xcount,ycount,1) = (Bcartpri(xcount,ycount,1).*cos(phiM) - Bcartpri(xcount,ycount,2).*sin(phiM));
    Bcart(xcount,ycount,2) = (Bcartpri(xcount,ycount,1).*sin(phiM) + Bcartpri(xcount,ycount,2).*cos(phiM));
    Bcart(xcount,ycount,3) = Bcartpri(xcount,ycount,3);
    
 
    %[Bcart(xcount,ycount,1),Bcart(xcount,ycount,2),Bcart(xcount,ycount,3)] = pol2cart(Bpolar(xcount,ycount,2), Bpolar(xcount,ycount,1), Bpolar(xcount,ycount,3));
    BAkoun(xcount,ycount,1) = (HxAkoun.*cos(phiM) - HyAkoun.*sin(phiM))/4/pi; BAkoun(xcount,ycount,2) = (HxAkoun.*sin(phiM) + HyAkoun.*cos(phiM))/4/pi/4/pi; BAkoun(xcount,ycount,3) = HzAkoun/4/pi; 
    
    clear Hrho Hz Hphi HxAkoun HyAkoun HzAkoun
    
    end 
end 

toc


%%

% script that demonstrates that we can do the linear combination for three
% examples of angle. Needs the Mumax data to go in with this. 

phiM = 0; Bobj = Xunit;

n = num;

testmat = (Bcart(:,:,1,1).*cos(phiM) + Bcart(:,:,1,2).*sin(phiM));

PCdif = (testmat - Bobj.BXx(:,:,n)')./testmat.*100;

figure(3); 
subplot(3,3,1); imagesc(xline,yline, testmat);
title 'Linear combination'; xlabel 'X'; ylabel 'Y'; colorbar
subplot(3,3,2); imagesc(xline,yline, Bobj.BXx(:,:,n)');
title 'Mumax - \phi_M = 0'; xlabel 'X'; ylabel 'Y'; colorbar

subplot(3,3,3); imagesc(xline, yline, PCdif)
title 'Plotting % differnce'; xlabel 'X'; ylabel 'Y';
colorbar;  caxis([-val, val])

% ------------------------------------------------------------------------

phiM = 23; Bobj = X23;

n = num;

testmat = (Bcart(:,:,1,1).*cos(phiM) + Bcart(:,:,1,2).*sin(phiM));

PCdif = (testmat - Bobj.BXx(:,:,n)')./testmat.*100;

subplot(3,3,4); imagesc(xline,yline, testmat);
title 'Linear combination'; xlabel 'X'; ylabel 'Y'; colorbar
subplot(3,3,5); imagesc(xline,yline, Bobj.BXx(:,:,n)');
title 'Mumax - \phi_M = 23'; xlabel 'X'; ylabel 'Y'; colorbar

subplot(3,3,6); imagesc(xline, yline, PCdif)
title 'Plotting % differnce'; xlabel 'X'; ylabel 'Y';
colorbar;  caxis([-val, val])

% -----------------------------------------------------------------------

phiM = 137; Bobj = X137;

n = num;

testmat = (Bcart(:,:,1,1).*cos(phiM) + Bcart(:,:,1,2).*sin(phiM));

PCdif = (testmat - Bobj.BXx(:,:,n)')./testmat.*100;

subplot(3,3,7); imagesc(xline,yline, testmat);
title 'Linear combination'; xlabel 'X'; ylabel 'Y'; colorbar
subplot(3,3,8); imagesc(xline,yline, Bobj.BXx(:,:,n)');
title 'Mumax - \phi_M = 137'; xlabel 'X'; ylabel 'Y'; colorbar

subplot(3,3,9); imagesc(xline, yline, PCdif)
title 'Plotting % differnce'; xlabel 'X'; ylabel 'Y';
colorbar;  caxis([-val, val])

%%

