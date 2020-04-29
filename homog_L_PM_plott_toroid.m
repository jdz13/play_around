function [propkeepers,plt] = homog_L_PM_plott_toroid(inputStr,figno)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

    M = 1e6; IB = 6e-3;
    cnt.StartB = 1; cnt.StChan = 1; cnt.KRV = 1;

    [particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
    control = sum(sum(particle_loc));
    
    crook = 1;
    
    for pm = 1:size(inputStr.varst.PM,2)
        for L = 1:size(inputStr.varst.Lengths,2)

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

        end
    end 
    
    
    
    
   plt.AvY = zeros(size(inputStr.varst.Lengths,2), size(inputStr.varst.PM,2));
    plt.AvZ = plt.AvY; plt.AvT = plt.AvY; plt.pltpm = plt.AvY; plt.pltL = plt.AvY;

    for cck = 1:size(inputStr.varst.Lengths,2)*size(inputStr.varst.PM,2)

        if rem(cck,size(inputStr.varst.PM,2)) == 0 

            plt.AvY(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvY;
            plt.AvZ(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvZ;
            plt.AvT(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvTheta;
            plt.pltpm(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).pm;
            plt.pltL(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).L;



        else

            plt.AvY(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvY;
            plt.AvZ(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvZ;
            plt.AvT(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvTheta;
            plt.pltpm(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).pm;
            plt.pltL(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).L;
        end
    end

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

end

