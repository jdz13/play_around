%% This will test the effect of a - showing what the transition looks like for various a(%) values.

%-------------------------FILL THESE IN------------------------------------
inputStr = SaveVar12p1;
KRV = 1;
StartB = 1;
pm = 1;
L = 1;
startfigno = 11;
%--------------------------------------------------------------------------

     ICS.StartB = StartB;
     ICS.KRV = KRV;

     ICS.StChan = 1; ICS.M = 1e6; ICS.IB = 6e-3; ICS.crook = 1;

     for ll = 1:length(L)
         for pp = 1:length(pm)
                
             ICS.L = L(ll);
                ICS.pm = pm(pp);

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

    %                        %Find out how much of this areas is above or below the threshold
    %                        new.BZM = (new.Bxnew >= ICS.swinit) - (new.Bxnew <= -ICS.swinit);
    %                        % Correlate with where the particles actually are in the world
    % 
    %                        new.CM = new.BZM .* ICS.particle_loc';
    %                        % Find a qualitative number for how much is 'on'
    %                        new.vc = sum(sum(new.CM));
    %                        % Compare this to how many are in the sample space 
    %                        new.NVC(1,pull) = new.vc./ICS.control;

                           ICS.c = ICS.swinit; 
                           ICS.a0 = 200*pi/0/ICS.c;
                           ICS.a5 = 200*pi/2/ICS.c;
                           ICS.a10 = 200*pi/5/ICS.c;

                           new.BZM0 = 1./(1 + exp(-(ICS.a0).*(new.Bxnew - ICS.c)));
                           new.CM0 = new.BZM0 .* ICS.particle_loc';
                           % Find a qualitative number for how much is 'on'
                           new.vc0 = sum(sum(new.CM0));
                           % Compare this to how many are in the sample space 
                           new.NVC0(1,pull) = new.vc0./ICS.control;
                           keepers.BZM0(:,:,pull) = new.BZM0;
                           keepers.CM0(:,:,pull) = new.CM0;
                           
                           
                           new.BZM5 = 1./(1 + exp(-(ICS.a5).*(new.Bxnew - ICS.c)));
                           new.CM5 = new.BZM5 .* ICS.particle_loc';
                           % Find a qualitative number for how much is 'on'
                           new.vc5 = sum(sum(new.CM5));
                           % Compare this to how many are in the sample space 
                           new.NVC5(1,pull) = new.vc5./ICS.control;
                           keepers.BZM5(:,:,pull) = new.BZM5;
                           keepers.CM5(:,:,pull) = new.CM5;
                           
                           
                           new.BZM10 = 1./(1 + exp(-(ICS.a10).*(new.Bxnew - ICS.c)));
                           new.CM10 = new.BZM10 .* ICS.particle_loc';
                           % Find a qualitative number for how much is 'on'
                           new.vc10 = sum(sum(new.CM10));
                           % Compare this to how many are in the sample space 
                           new.NVC10(1,pull) = new.vc10./ICS.control;
                           keepers.BZM10(:,:,pull) = new.BZM10;
                           keepers.CM10(:,:,pull) = new.CM10;
                           
                           
                           new.BZMold = (new.Bxnew >= ICS.c) - (new.Bxnew <= -ICS.c);
                           new.CMold = new.BZMold .* ICS.particle_loc';
                           % Find a qualitative number for how much is 'on'
                           new.vcold = sum(sum(new.CMold));
                           % Compare this to how many are in the sample space 
                           new.NVCold(1,pull) = new.vcold./ICS.control;
                           
                           

                           keepers.Bx(:,:,pull) = new.Bxnew;
                           
                end 
                           keepers.NVC0 = new.NVC0;
                           keepers.NVC5 = new.NVC5;
                           keepers.NVC10 = new.NVC10;
                           keepers.NVCold = new.NVCold;
                           
                % [FWHMX(1),MLOC(1),indout] = FWHMNVC(new.NVC(1,:),inputStr.varst.theta,inputStr.varst.CON);


                ICS.pltx = rad2deg(inputStr.varst.theta(ICS.pind));
             
                keepers(ICS.crook).pltx = ICS.pltx;

                clear count crook pull

         end 
     end 
     

figure(startfigno); plot(keepers.pltx, keepers.NVC0, keepers.pltx, keepers.NVC5, keepers.pltx, keepers.NVC10, keepers.pltx, keepers.NVCold) ;
legend ('Generated sigmoid - 0%', 'Generated sigmoid - 5%', 'Generated sigmoid - 10%', 'Original method (top hat)')
xlabel 'Angle [deg]'; ylabel 'Normalised Area switched';
title 'Testing the effect of the a variable'


keepers.NVCdifference = keepers.NVC0 - keepers.NVCold;
figure(startfigno+1); 
plot(keepers.pltx, keepers.NVCdifference)
xlabel 'Angle [deg]'
ylabel 'Difference between runs'
legend 'Difference between old code and 0% sigmoid'
title 'Difference between old code and 0% sigmoid'

clear inputStr KRV StartB pm L startfigno ll pp
