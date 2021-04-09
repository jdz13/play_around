function [outputstr] = Noise_EMF(dispx, dispy, dispz)

    tic

    M = 1e6; 
    xline = linspace(-2.5e-3,2.5e-3,26);
    yline = xline;
    Lengths = 2e-2;
    pm_cl = 6e-2;
    IB = 6e-3;

    zline = 10e-3+(pm_cl/2)+1e-6;

    count = 0;

    res_disp = zeros(length(dispx),length(dispy),length(dispz));

    for xx = 1:length(dispx)
        xlinet = xline+dispx(xx);
        for yy = 1:length(dispy)
            ylinet = yline+dispy(yy);
            for zz = 1:length(dispz)
                zlinet = zline+dispz(zz);

                [BcartOD] = new3Dbanditunitvector(zlinet,ylinet,xlinet,Lengths/2,pm_cl/2,M);
                [BcartIB] = new3Dbanditunitvector(zlinet,ylinet,xlinet,Lengths/2,IB/2,M);
                Bcart = BcartOD - BcartIB;
                res_disp(xx,yy,zz)  = mean(Bcart(:,:,1,1,1),'all');
                clear BcartOD BcartIB Bcart
                count = count+1;
                if rem(count,10) == 0 
                    disp(count)
                end 
            end 
        end 
    end

    delB0 = res_disp-res_disp(1,1);
    
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