 M = 1e6; IB = 6e-3;
    cnt.StartB = 1; cnt.StChan = 1; cnt.KRV = 1;

    [particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
    control = sum(sum(particle_loc));
    
    crook = 1;
    
 pm = 1;
 L = 1;

            cnt.L = L;
            cnt.pm = pm;

            SH0 = inputStr.SH0(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);
            swinit = inputStr.SWres(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);

                pzcut =  find(inputStr.MxB(cnt.pm,:,cnt.L) >= SH0, 1, 'last');

                [XunitX,YunitX] = Bandit_Cac_UVs(inputStr.probe_line(cnt.pm,pzcut),...
                                    inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(cnt.L)./2,inputStr.varst.PM(cnt.pm)./2,M);
                                
                [IBx, IBy] = Bandit_Cac_UVs(inputStr.probe_line(cnt.pm,pzcut),...
                                    inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(cnt.L)./2,IB./2,M);
                    
                Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;


                pind = (inputStr.ind1res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L):inputStr.ind2res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L));
                
                clear new keepers

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

            propkeepers(crook).pm = inputStr.varst.PM(cnt.pm);
            propkeepers(crook).L = inputStr.varst.Lengths(cnt.L);
            propkeepers(crook).AvY = keepers.AvY;
            propkeepers(crook).AvZ = keepers.AvZ;
            propkeepers(crook).AvTheta = keepers.AvTheta;
            propkeepers(crook).MeanAvY = mean(keepers.AvY);
            propkeepers(crook).MeanAvZ = mean(keepers.AvZ);
            propkeepers(crook).MeanAvTheta = mean(keepers.AvTheta);
            propkeepers(crook).pltx = pltx;
            
            crook = crook + 1;

            