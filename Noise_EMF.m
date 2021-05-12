function [outputstr] = Noise_EMF(dispx, dispy, dispz)

    tic

    M = 1e6; % Msat of the drive magnet, in [A/m]
    xline = linspace(-1e-3,1e-3,25); % Probe line in X for drive magnet field [m]
    yline = xline;% Probe line in Y for drive magnet field [m]
    Lengths = 2e-2; % Drive magnet length, [m]
    pm_cl = 6e-2; % Drive magnet OD, [m]
    IB = 6e-3; % Drive magnet internal bore OD [m]
    s_rad = 1e-3; % Circular sample area radius [m]
    d = 1e-2; % Magnet surface to sample separation [m]
    
    [Mask] = plane_mask(xline, yline, s_rad); % Mask to only include circular area
    sBc = sum(Mask,'all');
    zline = d+(pm_cl/2); % Z location to probe, OD/2 + d

    count = 0; % Count variable - to know where we are in loop

    % Initialise variable used in the loop. 
    res_disp = zeros(length(dispx),length(dispy),length(dispz));

    % carry out looping over all displacement values
    for xx = 1:length(dispx)
        xlinet = xline+dispx(xx);
        for yy = 1:length(dispy)
            ylinet = yline+dispy(yy);
            for zz = 1:length(dispz)
                zlinet = zline+dispz(zz);

                % Use 3D-B Caciagli model to obtain the field at all points
                % in the sample plane. 
                [BcartOD] = new3Dbanditunitvector(zlinet,ylinet,xlinet,Lengths/2,pm_cl/2,M);
                [BcartIB] = new3Dbanditunitvector(zlinet,ylinet,xlinet,Lengths/2,IB/2,M);
                Bcart = BcartOD - BcartIB; % superpose objects
                BcartM = Bcart(:,:,1,1,1).*Mask; % correlate to the mask
                % Extract the useful information 
                res_disp(xx,yy,zz)  = sum(BcartM,'all')/sBc;
                
                clear BcartOD BcartIB Bcart
                count = count+1; % use count variable and show when interesting
                if rem(count,10) == 0 
                    disp(count)
                end 
            end 
        end 
    end

    [BcartOD] = new3Dbanditunitvector(zline,yline,xline,Lengths/2,pm_cl/2,M);
    [BcartIB] = new3Dbanditunitvector(zline,yline,xline,Lengths/2,IB/2,M);
    Bcart = BcartOD - BcartIB; % superpose objects
    BcartM = Bcart(:,:,1,1,1).*Mask; % correlate to the mask
    % Extract the useful information 
    initial = sum(BcartM,'all')/sBc;
    
    delB0 = res_disp-initial;
    
    f = 20; % [Hz]
    Rcoil = 1e-3;
    A = pi.*Rcoil^2;
    E = delB0.*f.*A;
    
    outputstr.raw_field = res_disp;
    outputstr.delB0 = delB0;
    outputstr.EMF = E;
    outputstr.dispx = dispx;
    outputstr.dispy = dispy;
    outputstr.dispz = dispz;
     
    
    
end 