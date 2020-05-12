
clear gtest

gtest.pc = 5; gtest.c = 0.4; gtest.Xin = 0:0.001:0.5;

gtest.a = 200*pi/gtest.pc/gtest.c;

gtest.Sigmoidy = 1./(1 + exp(-(gtest.a).*(gtest.Xin - gtest.c)));

figure(56)
plot(gtest.Xin, gtest.Sigmoidy)

xlabel 'B [T]'
ylabel (compose("Consequent \\mu\nEquivalent to M/Msat"))

title(compose("Sigmoidal function\nc = " + num2str(gtest.c) + "[T] \\pm " + num2str(gtest.pc) + "%"+ ", a = " + num2str(gtest.a) ))


%%


     % Finding discrepancy
     
     absdiff = abs(abs(MxB) - abs(squeeze(B_a(c, d, m,:,o))'));
     
     pdiff = abs(absdiff./MxB.*100);
          
     %Plotting these up 
     
     figure(fignos(1)); clf;
     
     n = 1;
     
     for ODn = 1:length(OD)
         for Ln = 1:length(L)
             
             subplot(2,2,[1,2])
             semilogy (probe_line(ODn,:), MxB(ODn,:,Ln), '--', probe_line(ODn,:), squeeze(B_a(c,d,ODn,:,Ln)), '--')
             xlabel 'Distance from the magnet'
             ylabel 'Field [T]'
             title 'Fields obtained by each method [T]'
             legend ('Calculated using Caciagli','Calculated from Dipole eq')
             % remember to put this in as a recursive section - make a
             % note. For if L and OD aren't single values.

             subplot(2,2,3)
             semilogy (probe_line(ODn,2:size(MxB,2)), absdiff(ODn,2:size(MxB,2),Ln))
             xlabel 'Distance from the magnet'
             ylabel 'Absolute difference [T]'
             title 'Absolute difference'


             subplot(2,2,4)
             semilogy (probe_line(ODn,2:size(MxB,2)), pdiff(ODn,2:size(MxB,2),Ln))
             xlabel 'Distance from the magnet'
             ylabel 'Percentage difference [%]'
             title 'Percentage difference'

            n = n+1;

         end 
     end
     
     mxv = max((absdiff(ODn,:,Ln)));    
     mnv = min((absdiff(ODn,:,Ln)));
     
     if le(abs(mxv), abs(mnv))
         val = mnv;
     else 
         val = mxv;
     end
     
     data = (pdiff(ODn,:,Ln));
     mxv1 = max(data(~isinf(data)));    
     mnv1 = min(data(~isinf(data)));
     
     if le(abs(mxv1), abs(mnv1))
         val2 = mnv1;
     else 
         val2 = mxv1;
     end 
     
     subplot(2,2,3)
     cc = 10^mean(log10(abs(ylim)))*(mean(ylim)/abs(mean(ylim)));
     text (0.3*max(probe_line), cc,compose("\n\n\nMagnet OD = " + ... 
         num2str(OD*100) + "[cm] \nMagnet length = " + num2str(L) + "[m]"))
     
     % at what point does it improve past threshold percentage (%) ? 
    
     finder1 =  find(abs(pdiff(ODn,:,Ln)) >= ThreshPercent, 1, 'last');
     
     subplot(2,2,4)
     cc = 10^mean(log10(abs(ylim)))*(mean(ylim)/abs(mean(ylim)));
     %legend (['Value is below ', num2str(Thresh) , '% at ', num2str(probe_line(ODn,finder1)), 'm'])
     text (0.4*max(probe_line), cc, compose("\n\n\nValue is below " ...
         + num2str(ThreshPercent) + "% \nat " + num2str(probe_line(ODn,finder1)) + "[m]"))
     
     
%%

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
                       ICS.a = 200*pi/inputStr.varst.sigmoidpc/ICS.c;

                       new.BZM = 1./(1 + exp(-(ICS.a).*(new.Bxnew - ICS.c)));
                                             
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
            
%%

 plt.sq = (plt.pltpm.^2 + plt.pltL.^2).^0.5;

    figure(figno); clf; 
    subplot(4,4,1)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt.AvY'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Y'; colorbar

    ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(inputStr.varst.Lengths)+1);
    trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
    yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

    trial = linspace(ax.XLim(1),ax.XLim(2),length(inputStr.varst.PM)+1);
    trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
    xticks(trial);    xticklabels(((inputStr.varst.PM)));

    subplot(4,4,2)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt.AvZ'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Z'; colorbar
    xticks(trial);    xticklabels(((inputStr.varst.PM)));
    yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

    subplot(4,4,3)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt.AvT'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Theta'; colorbar
    xticks(trial);    xticklabels(((inputStr.varst.PM)));
    yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));
    
    subplot(4,4,4)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt.sq'));
    xlabel 'PM'; ylabel 'Lengths'; title 'polarity checking (pm^2 + L^2)^0^.^5'; colorbar
    xticks(trial);    xticklabels(((inputStr.varst.PM)));
    yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));
