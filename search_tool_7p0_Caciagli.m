function [SaveVar] = search_tool_7p0_Caciagli(KRV,RES,pm_cl,Lengths,theta,Yin,Zin,s_rad,con, sigmoid_pc)

tic

%% ------------------------------------------------------------------------

clear SWres SH0 swinit SWnext count count2 NVC DNVC FWHMX MLOC SWnextpos

% We need to have defined the maxima's for each part

D_prac = 10e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 10001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
sigmoid.pc = sigmoid_pc; % percentage used to define sigmoid, taken from inputs

% Find the maximum field (theta = 0) at each z probe point, for each set of
% magnet parameters (L,OD)
[MxB, probe_line] = MxBProbeMulti_V2(M,pm_cl, Lengths,D_prac,N_probe, IB); 

% Initialisation parameter, to set a large number for max channels (to
% fill)
ntestmax = 100;

% Initialise all of the working variables. Will have sizes defined by input
% sizes (as they simply cache previous results)
SWres = zeros(size(KRV,2),ntestmax,length(pm_cl),length(RES),length(Lengths), length(sigmoid_pc)); 
SHo = SWres; FWHMres = SWres; ind1res = SWres; ind2res = SWres; Bset = SWres; MLOCa = SWres;

% Figure out where the sample sits within the probe plane, to convolute
% with the moment. 
[particle_loc1] = plane_mask(Yin,Zin,s_rad);
% Completed for positive half only, so flip and add to array (skip middle)
particle_loc = [particle_loc1, fliplr(particle_loc1(:, 1:(size(particle_loc1,2)-1)))];
% create a control variable - total cells within the sample area (all 'on')
control = sum(sum(particle_loc));


% Make sure the first switching field used is the initialiser value (for
% all)
for gg = 1:length(RES)
    SWres(:,1,:,gg,:,:) = RES(gg);
end


% Now looking for the main logic. Will be looping over all values, so multi
% level loop here (make sure you're being careful in indexing). 
for pccount = 1:length(sigmoid_pc)
   
    sigthr = sigmoid.pc(pccount);
    
    for Lcount = 1:length(Lengths)

        L = Lengths(Lcount);

        for rescount = 1:length(RES)

            res = RES(rescount);

            for pmcount = 1:length(pm_cl)

                PM = pm_cl(pmcount);

                for  count2 = 1:size(KRV,2)

                    % Define the initial conditions
                    SH0 = 1.05*res; % start slightly higher than the switch value. This will be what is looked for as the first 'max' field value at theta = 0.
                    swinit = res; % What's the max channel value?
                    count = 1; % counter variable to index with
                    tmps = [0,1]; % reassign temporary variable each iteration of the loop 

                    while abs(tmps(1) - tmps(2)) > 1e-4 && SH0 > MxB(pmcount,size(MxB,2),Lcount) && tmps(2) ~= 0  
                        % 
                        % Do I need to change this to a physical value for all?
                        % Confrim with Dot. SH0 > MxB(pm,length(MxB(pm,:)))
                        %

                        % Find where that sits in space (Pz) - the z input
                        % line
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
                        
                        % Create the real unit vectors, subtractions of the
                        % magnet with the internal bore.
                        Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;

                        for pull = 1:length(theta) 
                           % Use rotation matricies to find the Z component 
                           Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 

                           new.Bxnew = Bxnew;
                           
                           % Use this data to flip the field about the
                           % symmetry axis. Allows for 2x faster code.
                           new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2))-1);
                           new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
                           new.temp = fliplr(new.Bxnew); new.temp(:,1) = [];
                           new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))-1) = new.temp;

                           % feed this back into the old variable 
                           Bxnew = new.newBxnew;

                           sigmoid.c = swinit; 
                           sigmoid.a = 200*pi/sigthr/sigmoid.c;

                           % convolute the sigmoidal function with the
                           % field profile to give degrees of 
                           BZM = 1./(1 + exp(-(sigmoid.a).*(Bxnew - sigmoid.c)));

                           CM = BZM .* particle_loc;
                           % Find a qualitative number for how much is 'on'
                           vc = sum(sum(CM));
                           % Compare this to how many are in the sample space 
                           NVC(1,pull) = vc./control;

                        end

                        [FWHMX(1),MLOC(1),indout] = FWHMNVC(NVC(1,:),theta,con);

                        SWnextpos = MLOC(1)+(KRV(count2)*FWHMX(1));  

                        SWnext = swinit*cos(SWnextpos);

                        SWres(count2,count+1,pmcount,rescount,Lcount,pccount) = SWnext;
                        FWHMres(count2,count,pmcount,rescount,Lcount,pccount) = FWHMX(1); % if +1 not needed then can use FWHMres(:,1,:,:) = [];
                        ind1res(count2,count,pmcount,rescount,Lcount,pccount)= indout(1);
                        ind2res(count2,count,pmcount,rescount,Lcount,pccount) = indout(2);
                        Bset(count2,count,pmcount,rescount,Lcount,pccount) = MxB(pmcount,pzcut,Lcount);
                        SHo(count2,count,pmcount,rescount,Lcount,pccount) = SH0;
                        MLOCa(count2,count,pmcount,rescount,Lcount,pccount) = MLOC(1);
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
end 

% Save all of the inputs to one variable structure
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
varst.sigmoidpc = sigmoid_pc;


% Save all of the outputs to one results structure 
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