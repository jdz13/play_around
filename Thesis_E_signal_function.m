function [outstr] = Thesis_E_signal_function(theta, coil_res_xy, method)

    RES = 0.4; % Start field values. 
    pm_cl = 6e-2; % Magnet outer diameters.
    Lengths = 2e-2; % Magnet lengths
    s_rad = 1e-3; % define the sample radius (where the particles will actually be
    Yin = linspace(-1e-3, 1e-3,40); % Probe plane points in Y 
    Zin = Yin(1:20); % Probe plane points in Z 
    % xin = SaveVar29p6.probe_line(11,find(SaveVar29p6.MxB(11,:,1) >= 1.05*RES, 1, 'last'));
    xin = 0.0351200000000000;
    IB = 6e-3;
    M = 1e6;
    a = 0.1; 

    sr = 1e-3; dx = 5e-5;
    x = linspace(-sr,sr,ceil(2*sr/dx)); y = x;
    [Mask] = plane_mask(x, y,sr); N = sum(Mask,'all');
    magDp = [2e-5, 2e-5, 2e-9];
    mu0 = 4*pi*1e-7;

    xline = linspace(-1e-3,1e-3,coil_res_xy);
    yline = xline;
    zline = 1e-5;

    tic

    [particle_loc1] = plane_mask(Yin,Zin,s_rad);
    % Completed for positive half only, so flip and add to array (skip middle)
    particle_loc = [particle_loc1, fliplr(particle_loc1)];
    % create a control variable - total cells within the sample area (all 'on')
    control = sum(sum(particle_loc));

    [XunitX,YunitX] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,pm_cl./2,M);
    % Now we need to take the internal bore and subtract
    % this to get the proper field values.
    [IBx, IBy] = Bandit_Cac_UVs(xin,Yin,Zin,Lengths./2,IB./2,M);
    % Create the real unit vectors, subtractions of the
    % magnet with the internal bore.
    Xunitx = XunitX - IBx; Yunitx = YunitX - IBy;

    NVC = zeros(1,length(theta)); % Normalised volume comparison

    HzAkoun_sum = zeros(length(xline), length(yline), length(theta));

    for pull = 1:length(theta) 
       % Use rotation matricies to find the Z component 
       Bxnew = Xunitx.*cos(theta(pull)) + Yunitx.*sin(theta(pull)); 

       new.Bxnew = Bxnew;

       % Use this data to flip the field about the
       % symmetry axis. Allows for 2x faster code.
       new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2)));
       new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
       new.temp = fliplr(new.Bxnew);
       new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))) = new.temp;

       % feed this back into the old variable 
       Bxnew = new.newBxnew;
       
       if strcmp(method, 'ideal')
           
           %Find out how much of this areas is above or below the threshold
           BZM = (Bxnew >= RES) - (Bxnew <= -RES);
           % Correlate with where the particles actually are in the world

       elseif strcmp(method,'non ideal')
           
           %Find out how much of this areas is above or below the threshold
           BZM = sigmf(Bxnew,[a.*1e4,RES]);
           % Correlate with where the particles actually are in the world
           
       else 
           error ('please correct input method')
       end 
       
       CM = BZM .* particle_loc;
       % Find a qualitative number for how much is 'on'
       vc = sum(sum(CM));
       % Compare this to how many are in the sample space 
       NVC(pull) = vc./control;
       %----------------------------------------------------------------------

        HxAkoun = zeros(size(xline,2), size(yline,2), size(zline,2));
        HyAkoun = HxAkoun; HzAkoun = HxAkoun; 
        tic
        Masktemp = Mask.*BZM;
        n = 0;
        for aa = 1:length(x)
            for bb = 1:length(y)
                if Masktemp(aa,bb) ~= 0
                    n = n+1;            
                    xlinetemp = xline+x(aa);
                    ylinetemp = yline+y(bb);

                    for kk = 1:size(xline,2)
                        for jj = 1:size(yline,2)
                            for pp = 1:size(zline,2)
                                [HxAkoun(kk,jj,pp), HyAkoun(kk,jj,pp), HzAkoun(kk,jj,pp)] = Jannsen(xlinetemp(kk),ylinetemp(jj),zline(pp),magDp);
                            end
                        end
                    end 
                    [~, ~, HzAkoun_sum_nth] = multiply(Masktemp(aa,bb).*M*mu0/4/pi,HxAkoun, HyAkoun, HzAkoun);
                    HzAkoun_sum(:,:,pull) = HzAkoun_sum(:,:,pull) + HzAkoun_sum_nth;
                end 

    %             if n~= 0 && rem(n,1000)==0
    %                 disp(n)
    %                 toc
    %             end 

            end
        end

        disp(pull)
        toc

    end

    toc
    
    
    %%
    
    R_coil = 1e-3;

    phi = zeros(length(R_coil),length(theta));bsum = phi; 
    Bav = phi; B_av = zeros(1,length(theta));

    for kk = 1:length(theta)

        B_av(kk) = mean(HzAkoun_sum(:,:,kk),'all');

        [Mask] = plane_mask(xline, yline,R_coil);
        ncell = sum(Mask, 'all');
        breal = HzAkoun_sum(:,:,kk).*Mask;
        bsum(kk) = sum(breal,'all');
        Bav(kk) = bsum(kk)/ncell;
        dA = pi*(R_coil^2);
        phi(kk) = Bav(kk)*dA;

    end
    
    %%

    outstr.HzAkoun_sum = HzAkoun_sum;
    outstr.NVC = NVC;
    outstr.phi = phi;
    outstr.Bav = Bav;
    outstr.theta = theta;
    outstr.N = N;
    outstr.xline = xline;
    
end
