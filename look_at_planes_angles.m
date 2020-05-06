 ICS.M = 1e6; ICS.IB = 6e-3;
 ICS.StartB = 1; ICS.StChan = 1; ICS.KRV = 1;
 ICS.crook = 1; ICS.pm = 1; ICS.L = 1;
 inputStr = SaveVar12p1;

 
            ICS.L = ICS.L;
            ICS.pm = ICS.pm;
            
            [ICS.particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
            ICS.control = sum(sum(ICS.particle_loc));

            ICS.SH0 = inputStr.SH0(ICS.KRV, ICS.StChan, ICS.pm, ICS.StartB, ICS.L);
            ICS.swinit = inputStr.SWres(ICS.KRV, ICS.StChan, ICS.pm, ICS.StartB, ICS.L);

                ICS.pzcut =  find(inputStr.MxB(ICS.pm,:,ICS.L) >= ICS.SH0, 1, 'last');

                [Field.XunitX,Field.YunitX] = Bandit_Cac_UVs(inputStr.probe_line(ICS.pm,ICS.pzcut),...
                                    inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(ICS.L)./2,inputStr.varst.PM(ICS.pm)./2,ICS.M);
                                
                [Field.IBx, Field.IBy] = Bandit_Cac_UVs(inputStr.probe_line(ICS.pm,ICS.pzcut),...
                                    inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(ICS.L)./2,ICS.IB./2,ICS.M);
                    
                Field.Xunitx = Field.XunitX - Field.IBx; Field.Yunitx = Field.YunitX - Field.IBy;


                ICS.pind = (inputStr.ind1res(ICS.KRV, ICS.StChan, ICS.pm, ICS.StartB, ICS.L):inputStr.ind2res(ICS.KRV, ICS.StChan, ICS.pm, ICS.StartB, ICS.L));
                
                clear new keepers

            for pull = 1:length(ICS.pind)

                       new.Bxnew = (Field.Xunitx.*cos(inputStr.varst.theta(ICS.pind(pull))) + Field.Yunitx.*sin(inputStr.varst.theta(ICS.pind(pull))))'; 

                       %Find out how much of this areas is above or below the threshold
                       new.BZM = (new.Bxnew >= ICS.swinit) - (new.Bxnew <= -ICS.swinit);
                       % Correlate with where the particles actually are in the world

                       new.CM = new.BZM .* ICS.particle_loc';
                       % Find a qualitative number for how much is 'on'
                       new.vc = sum(sum(new.CM));
                       % Compare this to how many are in the sample space 
                       new.NVC(1,pull) = new.vc./ICS.control;

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

            ICS.pltx = rad2deg(inputStr.varst.theta(ICS.pind));

            propkeepers(ICS.crook).pm = inputStr.varst.PM(ICS.pm);
            propkeepers(ICS.crook).L = inputStr.varst.Lengths(ICS.L);
            propkeepers(ICS.crook).AvY = keepers.AvY;
            propkeepers(ICS.crook).AvZ = keepers.AvZ;
            propkeepers(ICS.crook).AvTheta = keepers.AvTheta;
            propkeepers(ICS.crook).MeanAvY = mean(keepers.AvY);
            propkeepers(ICS.crook).MeanAvZ = mean(keepers.AvZ);
            propkeepers(ICS.crook).MeanAvTheta = mean(keepers.AvTheta);
            propkeepers(ICS.crook).pltx = ICS.pltx;
            


            clear count crook pull