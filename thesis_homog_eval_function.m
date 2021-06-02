function [outstr] = thesis_homog_eval_function(ist,inmeth, B0_Oe)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    Yin = ist.varst.Yin; % Probe plane points in Y
    Zin = Yin;
    M = 1e6; % Msat of magnet used for drive field [A/m]
    IB = 6e-3; % Inner bore of the drive magnet [m]
    s_rad = ist.varst.s_rad;
    cnt = -1;
    B0 = B0_Oe./1e4; % adjustable parameter. Use to check.
    theta = deg2rad(linspace(15,20,501));
    [particle_loc] = plane_mask(Yin,Zin,s_rad);
    control = sum(sum(particle_loc));
        
    if strcmp(inmeth, 'OD')
          
        dphi = zeros(1, length(ist.varst.PM));
        avphi = zeros(1, length(ist.varst.PM));
        BzX = zeros(1, length(ist.varst.PM));
        BzY = zeros(1, length(ist.varst.PM));

        for tt = 1:length(ist.varst.PM)
            cnt = cnt + 2;
            r = ist.probe_line(tt,find(ist.MxB(tt,:) > B0.*1.05, 1, 'last'));
            [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,ist.varst.PM(tt)./2,M);
            [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths./2,IB./2,M);

            Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
            Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';

            NVC = zeros(2,length(theta)); % Normalised volume comparison

            for pull = 1:length(theta)
                % Use rotation matricies to find the Z component
                Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull));

                %Find out how much of this areas is above or below the threshold
                BZM = (Bxnew >= B0) - (Bxnew <= -B0);
                % Correlate with where the particles actually are in the world

                CM = BZM .* particle_loc;
                % Find a qualitative number for how much is 'on'
                vc = sum(sum(CM));
                % Compare this to how many are in the sample space
                NVC(1,pull) = vc./control;

            end

            MLOC = theta(find(NVC(1,:) <= 0.5 ,1,'first'));

            Bxnew = Xunitx.*cos(MLOC) +Yunitx.*sin(MLOC);
            Bxnewp1 = Xunitx.*cos(MLOC+(deg2rad(1))) +Yunitx.*sin(MLOC+(deg2rad(1)));

            dd(:,:,1) = Bxnew;
            dd(:,:,2) = Bxnewp1;

            BzX(tt) = abs(Bxnew(26,1) - Bxnew(26,51));
            BzY(tt) = abs(Bxnew(1,26) - Bxnew(26,26));
            dphit = diff(dd,1,3);
            avphi(tt) = mean(dphit(26,:));
            dphi(tt) = dphit(26,1)-dphit(26,end);

        end

        hh = figure;
        subplot(1,3,1)
        plot(ist.varst.Lengths.*1e3, BzX.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        subplot(1,3,2)
        plot(ist.varst.Lengths.*1e3, BzY.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        subplot(1,3,3)
        plot(ist.varst.Lengths.*1e3, dphi.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'd\phi/dt'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        
    elseif strcmp(inmeth, 'L')

        BzX = zeros(1, length(ist.varst.Lengths));
        BzY = zeros(1, length(ist.varst.Lengths));
        dphi = zeros(1, length(ist.varst.Lengths));
        avphi = zeros(1, length(ist.varst.Lengths));

        for tt = 1:length(ist.varst.Lengths)
            cnt = cnt + 2;
            r = ist.probe_line(tt,find(ist.MxB(1,:,tt) > B0.*1.05, 1, 'last'));
            [main] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,ist.varst.PM./2,M);
            [IBs] = new3Dbanditunitvector(r,Yin,Zin,ist.varst.Lengths(tt)./2,IB./2,M);

            Xunitx = main(:,:,1,1,1)' - IBs(:,:,1,1,1)';
            Yunitx = main(:,:,1,1,2)' - IBs(:,:,1,1,2)';

            NVC = zeros(2,length(theta)); % Normalised volume comparison

            for pull = 1:length(theta)
                % Use rotation matricies to find the Z component
                Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull));

                %Find out how much of this areas is above or below the threshold
                BZM = (Bxnew >= B0) - (Bxnew <= -B0);
                % Correlate with where the particles actually are in the world

                CM = BZM .* particle_loc;
                % Find a qualitative number for how much is 'on'
                vc = sum(sum(CM));
                % Compare this to how many are in the sample space
                NVC(1,pull) = vc./control;

            end

            MLOC = theta(find(NVC(1,:) <= 0.5 ,1,'first'));

            Bxnew = Xunitx.*cos(MLOC) +Yunitx.*sin(MLOC);
            Bxnewp1 = Xunitx.*cos(MLOC+(deg2rad(1))) +Yunitx.*sin(MLOC+(deg2rad(1)));

            dd(:,:,1) = Bxnew;
            dd(:,:,2) = Bxnewp1;

            BzX(tt) = abs(Bxnew(26,1) - Bxnew(26,51));
            BzY(tt) = abs(Bxnew(1,26) - Bxnew(26,26));
            dphit = diff(dd,1,3);
            avphi(tt) = mean(dphit(26,:));
            dphi(tt) = dphit(26,1)-dphit(26,end);

        end


        hh = figure;
        subplot(1,3,1)
        plot(ist.varst.Lengths.*1e3, BzX.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        subplot(1,3,2)
        plot(ist.varst.Lengths.*1e3, BzY.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        subplot(1,3,3)
        plot(ist.varst.Lengths.*1e3, dphi.*1e3)
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'd\phi/dt'
        % xlim([20,100])
        thesis_fig_gen(hh.Number)
        
    end
    
        outstr.BzX = BzX;
        outstr.BzY = BzY;
        outstr.avphi = avphi;
        outstr.dphi = dphi;
        outstr.ist = ist; 

end

