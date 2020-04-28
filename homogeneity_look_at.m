function [] = homogeneity_look_at(inputStr, figno, KRV, StChan, pm, StartB, L)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

M = 1e6;

SH0 = inputStr.SH0(KRV, StChan, pm, StartB, L);
swinit = inputStr.SWres(KRV, StChan, pm, StartB, L);

    [particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
    control = sum(sum(particle_loc));

    pzcut =  find(inputStr.MxB(pm,:,L) >= SH0, 1, 'last');

    [Xunitx,Yunitx] = Bandit_Cac_UVs(inputStr.probe_line(pm,pzcut),...
                        inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(L)./2,inputStr.varst.PM(pm)./2,M);
                   
                       
    pind = (inputStr.ind1res(KRV, StChan, pm, StartB, L):inputStr.ind2res(KRV, StChan, pm, StartB, L));
                    
for pull = 1:length(pind)
    
           new.Bxnew = (Xunitx.*cos(inputStr.varst.theta(pind(pull))) + Yunitx.*sin(inputStr.varst.theta(pind(pull))))'; 
                              
           %Find out how much of this areas is above or below the threshold
           new.BZM = (new.Bxnew >= swinit) - (new.Bxnew <= -swinit);
           % Correlate with where the particles actually are in the world

           new.CM = new.BZM .* particle_loc';
           % Find a qualitative number for how much is 'on'
           new.vc = sum(sum(new.CM));
           % Compare this to how many are in the sample space 
           new.NVC(1,pull) = new.vc./control;
           
           keepers.Bx(:,:,pull) = new.Bxnew;
           keepers.BZM(:,:,pull) = new.BZM;
           keepers.CM(:,:,pull) = new.CM;
           
end 
           keepers.NVC = new.NVC;
% [FWHMX(1),MLOC(1),indout] = FWHMNVC(new.NVC(1,:),inputStr.varst.theta,inputStr.varst.CON);



[keepers.gradY, keepers.gradZ,keepers.gradTheta] = gradient(keepers.Bx);

for count = 1:size(keepers.Bx,3)
    keepers.AvY(count) = mean(keepers.gradY(:,:,count),'all');
    keepers.AvZ(count) = mean(keepers.gradZ(:,:,count),'all');
    keepers.AvTheta(count) = mean(keepers.gradTheta(:,:,count),'all');
end

pltx = rad2deg(inputStr.varst.theta(pind));

figure(figno); clf;
plot(pltx, keepers.AvY, pltx, keepers.AvZ, pltx, keepers.AvTheta)
xlabel 'angle [deg]'
ylabel 'gradient (\Delta)'
legend ('\DeltaY','\DeltaZ','\Delta\theta','location', 'East')

end

