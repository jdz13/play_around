function [] = fourcorners (inputStr, KRV, StartB, pm, L, startfigno)
%% code to output the profiles at extremities. 
% Produces graphs like those found in Dot Meetings (May 07th). 

%%
     ICS.StartB = StartB;
     ICS.KRV = KRV;

     ICS.StChan = 1; ICS.M = 1e6; ICS.IB = 6e-3; ICS.crook = 1;

     figno = startfigno;

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


                ICS.CLIT_TICKLER = find (keepers.NVC >= 0.5, 1, 'last');
                ICS.kweef = find(inputStr.MxB(ICS.pm,:,ICS.L) == inputStr.Bset(1,1,ICS.pm,1,ICS.L));

                h = figure(figno); clf; subplot(2,2,1); set(h,'WindowStyle','docked')
                plot(rad2deg(inputStr.varst.theta(ICS.pind)), keepers.NVC)
                xlabel 'Angle [degrees]'; ylabel 'NVC'; title 'Normalsed area in ''On''/''Off'' state'
                hold on; plot(rad2deg(inputStr.varst.theta(ICS.pind(ICS.CLIT_TICKLER))), keepers.NVC(ICS.CLIT_TICKLER), 'ko','MarkerSize',10) 

                subplot(2,2,4)
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.CM(:,:,ICS.CLIT_TICKLER))
                colorbar; caxis([-1,1]);
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Area above/below switching field'

                subplot(2,2,2)
                semilogy((inputStr.probe_line(ICS.pm,:) - inputStr.varst.PM(ICS.pm)/2)*100, inputStr.MxB(ICS.pm,:,ICS.L)); colorbar
                hold on; semilogy((inputStr.probe_line(ICS.pm,ICS.kweef) - inputStr.varst.PM(ICS.pm)/2)*100, inputStr.MxB(ICS.pm,ICS.kweef,ICS.L), 'ko', 'MarkerSize', 10)
                xlabel 'Distance from magnet surface [cm]'; ylabel 'Maximum field above sample [T]'; 
                title (compose("Data for OD = " + num2str(inputStr.varst.PM(ICS.pm)*100) + "[cm] and L = " + num2str(inputStr.varst.Lengths(ICS.L)*100) + "[cm]\n\n Max field [T]"))

                subplot(2,2,3)
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,ICS.CLIT_TICKLER))
                colorbar
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Field profile at sample [T]'



                l = figure(figno+1); clf; set(l,'WindowStyle','docked'); subplot(2,2,1);
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,ICS.CLIT_TICKLER))
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'B_x [T]'; colorbar

                subplot(2,2,2);
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradY(:,:,ICS.CLIT_TICKLER)./(1e-3/25))
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaY [T/m]'; colorbar

                subplot(2,2,3);
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradZ(:,:,ICS.CLIT_TICKLER)./(1e-3/25))
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaZ [T/m]'; colorbar

                subplot(2,2,4);
                imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradTheta(:,:,ICS.CLIT_TICKLER))
                xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\delta\theta'; colorbar

                figno = figno+2;

                clear h l

         end 
     end

     
    a = cellstr(num2str(inputStr.varst.PM'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(inputStr.varst.Lengths'.*100, 'L = %-gcm '));
    count = 1;

    legendCell1 = cell(1,4);
       
    figure(figno); clf;
    subplot(1,2,1)
    for jj = [1,11]
        for kk = [1,11]
            plt = inputStr.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
            plt(plt==0) = [];
            semilogy(plt,'x--')
            hold on
            title (compose("Four corners, Optimum channels" ))
            legendCell1(count) = append(a(kk),b(jj)); count = count+1;
            xlabel 'Channel number'; ylabel 'Field value for a particular channel [T]'
        end
    end 
    legend (legendCell1)



    subplot(1,2,2)
    for jj = [1,11]
        for kk = [1,11]
            plt = inputStr.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
            plt(plt==0) = []; plt = diff(plt);
            semilogy(plt,'x--')
            hold on
            title (compose("Four corners, difference between channels  " ))
            xlabel 'Channel number'; ylabel 'Field difference between adjacent channels [T]'
        end
    end    

    legend (legendCell1, 'Location', 'Southeast')
     
     
     
end
