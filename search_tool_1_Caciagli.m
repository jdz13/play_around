function [SaveVar] = search_tool_1_Caciagli(KRV,RES,pm_cl,theta,Yin,Zin,s_rad,con)

tic

%% ------------------------------------------------------------------------

clear SWres SH0 swinit SWnext count count2 NVC DNVC FWHMX MLOC SWnextpos

% We need to have defined the maxima's for each part

D_prac = 10e-2; N_probe = 10001; M = 1e6;

[MxB, probe_line] = MxBProbeMulti(M,pm_cl, pm_cl,D_prac,N_probe);

ntestmax = 100;

SWres = zeros(size(KRV,2),ntestmax,length(pm_cl),length(RES)); SHo = SWres;
FWHMres = SWres; ind1res = SWres; ind2res = SWres; Bset = SWres;

for gg = 1:length(RES)
    SWres(:,1,:,gg) = RES(gg);
end

for rescount = 1:length(RES)

    res = RES(rescount);

    for pmcount = 1:length(pm_cl)

        for  count2 = 1:size(KRV,2)

            % Define the initial conditions
            SH0 = 1.05*res;
            swinit = res; % What's the max channel value?
            count = 1;
            tmps = [0,1];

            while abs(tmps(1) - tmps(2)) > 1e-4 && SH0 > MxB(pmcount,length(MxB(pmcount,:))) && tmps(2) ~= 0 
                % 
                % Do I need to change this to a physical value for all?
                % Confrim with Dot. SH0 > MxB(pm,length(MxB(pm,:)))
                %

                % Find where that sits in space (Pz)
               pzcut =  find(MxB(pmcount,:,pmcount) >= SH0, 1, 'last');
               
                clear variable % fill this with whatever needs refreshing through each run. 

                % Initialise the variables you're going to want 
                NVC = zeros(2,length(theta)); % Normalised volume comparison
                FWHMX = [0,0]; MLOC = [0,0]; % Full width half max and Maxima location

                %% ------------------------------------------------------------------------
                % Look for information about this initial condition
                
                [Xunitx,Yunitx] = Bandit_Cac_UVs(probe_line(pmcount,pzcut),...
                    Yin,Zin,pm_cl(pmcount)./2,pm_cl(pmcount)./2,1e6);


                    for pull = 1:length(theta) 
                       % Use rotation matricies to find the Z component 
                       Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 
                       %Find out how much of this areas is above or below the threshold
                       BZM = (Bxnew >= swinit) - (Bxnew <= -swinit);
                       % Correlate with where the particles actually are in the world
                       
                       [particle_loc] = plane_mask(Yin,Zin,s_rad);
                       control = sum(sum(particle_loc));
                       
                       CM = BZM .* particle_loc;
                       % Find a qualitative number for how much is 'on'
                       vc = sum(sum(CM));
                       % Compare this to how many are in the sample space 
                       NVC(1,pull) = vc./control;

                    end

                [FWHMX(1),MLOC(1),indout] = FWHMNVC(NVC(1,:),theta,con);
                %RKout = zeros(1,100); 

                SWnextpos = MLOC(1)+(KRV(count2)*FWHMX(1));  

                SWnext = swinit*cos(SWnextpos);

                SWres(count2,count+1,pmcount,rescount) = SWnext;
                FWHMres(count2,count+1,pmcount,rescount) = FWHMX(1); % if +1 not needed then can use FWHMres(:,1,:,:) = [];
                ind1res(count2,count+1,pmcount,rescount)= indout(1);
                ind2res(count2,count+1,pmcount,rescount) = indout(2);
                Bset(count2,count,pmcount,rescount) = MxB(pmcount,pzcut,pmcount);
                SHo(count2,count,pmcount,rescount) = SH0;
                % manipulate the results to run the next leg

                tmps(1) = swinit; 

                    if SWnextpos >= pi/2
                         tmps(2) = 0;
                    else
                        tmps(2) = SWnext;
                    end

                SH0 = (tmps(1)+tmps(2))/2;
                swinit = tmps(2); 

                count = count +1;

                disp (['count = ', num2str(count),', range = ', num2str(tmps)])

            end
        end
    end
end 

varst.KRV = KRV;
varst.PM = pm_cl;
varst.RES = RES;
varst.CON = con;
varst.theta = theta;
varst.MxB = MxB;
varst.timer = toc;
varst.Yin = Yin;
varst.Zin = Zin;
varst.s_rad = s_rad;

SaveVar.SWres = SWres;
SaveVar.FWHMres = FWHMres;
SaveVar.ind1res = ind1res;
SaveVar.ind2res = ind2res;
SaveVar.Bset = Bset;
SaveVar.SHo = SHo;
SaveVar.probe_line = probe_line;
SaveVar.varst = varst;

end 