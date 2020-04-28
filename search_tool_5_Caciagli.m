function [SaveVar] = search_tool_5_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con)

tic

%% ------------------------------------------------------------------------

clear SWres SH0 swinit SWnext count count2 NVC DNVC FWHMX MLOC SWnextpos

% We need to have defined the maxima's for each part

D_prac = 10e-2; N_probe = 10001; M = 1e6;

[MxB, probe_line] = MxBProbeMulti(M,pm_cl, Lengths,D_prac,N_probe);

ntestmax = 100;

SWres = zeros(size(KRV,2),ntestmax,length(pm_cl),length(RES),length(Lengths)); 
SHo = SWres; FWHMres = SWres; ind1res = SWres; ind2res = SWres; Bset = SWres; MLOCa = SWres;

[particle_loc1] = plane_mask(Yin,Zin,s_rad);
particle_loc = [particle_loc1, fliplr(particle_loc1(:, 1:(size(particle_loc1,2)-1)))];
control = sum(sum(particle_loc));

for gg = 1:length(RES)
    SWres(:,1,:,gg) = RES(gg);
end

for Lcount = 1:length(Lengths)
    
    L = Lengths(Lcount);
    
    for rescount = 1:length(RES)

        res = RES(rescount);

        for pmcount = 1:length(pm_cl)
            
            PM = pm_cl(pmcount);

            for  count2 = 1:size(KRV,2)

                % Define the initial conditions
                SH0 = 1.05*res;
                swinit = res; % What's the max channel value?
                count = 1;
                tmps = [0,1];

                while abs(tmps(1) - tmps(2)) > 1e-4 && SH0 > MxB(pmcount,size(MxB,2),Lcount) && tmps(2) ~= 0  
                    % 
                    % Do I need to change this to a physical value for all?
                    % Confrim with Dot. SH0 > MxB(pm,length(MxB(pm,:)))
                    %

                    % Find where that sits in space (Pz)
                    pzcut =  find(MxB(pmcount,:,Lcount) >= SH0, 1, 'last');

                    clear variable % fill this with whatever needs refreshing through each run. 

                    % Initialise the variables you're going to want 
                    NVC = zeros(2,length(theta)); % Normalised volume comparison
                    FWHMX = [0,0]; MLOC = [0,0]; % Full width half max and Maxima location

                    %% ------------------------------------------------------------------------
                    % Look for information about this initial condition

                    [XunitX,YunitX] = Bandit_Cac_UVs(probe_line(pmcount,pzcut),...
                        Yin,Zin,L./2,PM./2,M);
                    
                    % Now we need to take the internal bore and subtract
                    % this to get the proper field values.
                    
                    [IBx, IBy] = Bandit_Cac_UVs(probe_line(pmcount,pzcut),...
                        Yin,Zin,L./2,IB./2,M);
                    
                    Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;
                                              
                    for pull = 1:length(theta) 
                       % Use rotation matricies to find the Z component 
                       Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 
                       
                       new.Bxnew = Bxnew;
                       
                       new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2))-1);
                       new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
                       new.temp = fliplr(new.Bxnew); new.temp(:,1) = [];
                       new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))-1) = new.temp;
                       
                       Bxnew = new.newBxnew;
                       
                       %Find out how much of this areas is above or below the threshold
                       BZM = (Bxnew >= swinit) - (Bxnew <= -swinit);
                       % Correlate with where the particles actually are in the world
                                              
                       CM = BZM .* particle_loc;
                       % Find a qualitative number for how much is 'on'
                       vc = sum(sum(CM));
                       % Compare this to how many are in the sample space 
                       NVC(1,pull) = vc./control;

                    end

                    [FWHMX(1),MLOC(1),indout] = FWHMNVC(NVC(1,:),theta,con);
                    
                    SWnextpos = MLOC(1)+(KRV(count2)*FWHMX(1));  

                    SWnext = swinit*cos(SWnextpos);

                    SWres(count2,count+1,pmcount,rescount,Lcount) = SWnext;
                    FWHMres(count2,count,pmcount,rescount,Lcount) = FWHMX(1); % if +1 not needed then can use FWHMres(:,1,:,:) = [];
                    ind1res(count2,count,pmcount,rescount,Lcount)= indout(1);
                    ind2res(count2,count,pmcount,rescount,Lcount) = indout(2);
                    Bset(count2,count,pmcount,rescount,Lcount) = MxB(pmcount,pzcut,Lcount);
                    SHo(count2,count,pmcount,rescount,Lcount) = SH0;
                    MLOCa(count2,count,pmcount,rescount,Lcount) = MLOC(1);
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
varst.Lengths = Lengths;

SaveVar.SWres = SWres;
SaveVar.FWHMres = FWHMres;
SaveVar.ind1res = ind1res;
SaveVar.ind2res = ind2res;
SaveVar.Bset = Bset;
SaveVar.SH0 = SHo;
SaveVar.MxB = MxB;
SaveVar.probe_line = probe_line;
SaveVar.varst = varst;
SaveVar.NVC = NVC;
SaveVar.MLOC = MLOCa;
SaveVar.swinit = swinit;

end 