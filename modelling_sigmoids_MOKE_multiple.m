function [fitresult1st,fitresult2nd] = modelling_sigmoids_MOKE_multiple(instrx,instry)
%% Will take a minor loop data set and give two sigmoid fits that show the parameters of their transitions
   
    %first we need to define the halves of the data where switches will
    %occur.
    first_halfx = (instrx(1:round(size(instrx,1)/2))); 
    second_halfx = (instrx(round(size(instrx,1)/2)+1:end));

    first_halfy = rescale(instry(1:round(size(instry,1)/2))); 
    second_halfy = rescale(instry(round(size(instry,1)/2)+1:end));


    % Set up fittype and options. Define the eq. for a sigmoid here.
    ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';

%--------------------------------------------------------------------------
    % Now work on extracting the fit parameters for the first half
        % find rough parameters for the fit 
        % start with a. Easiest to find the midway point (where == 0.5 on
        % normalised curve)
        if isempty(find(first_halfy == min(abs(first_halfy - 0.5))+0.5,1))
            cstartin1 = find(abs(first_halfy - (-min(abs(first_halfy - 0.5))+0.5)) <2e-10);  
        else
            cstartin1 = find(abs(first_halfy - (min(abs(first_halfy - 0.5))+0.5)) <2e-10);
        end 
            cstart = first_halfx(cstartin1);   

    [xData, yData] = prepareCurveData(first_halfx, first_halfy);

    % inverse of property found through Origin. Seems to work well. 
    astart = 20/(max(first_halfx) - min(first_halfx));
    % apply these properties
    opts.StartPoint = [astart, cstart];

    % Fit model to data.
    [fitresult1st, ~] = fit( xData, yData, ft, opts );

%--------------------------------------------------------------------------
    % repeat the above process for the second half
        if isempty(find(second_halfy == min(abs(second_halfy - 0.5))+0.5,1))
            cstartin1 = find(abs(second_halfy - (-min(abs(second_halfy - 0.5))+0.5)) <2e-10);    
        else
            cstartin1 = find(abs(second_halfy - (min(abs(second_halfy - 0.5))+0.5)) <2e-10);
        end 
            cstart = second_halfx(cstartin1);   

    [xData, yData] = prepareCurveData(second_halfx, second_halfy);

    % inverse of property found through Origin. Seems to work well. 
    astart = 20/(max(second_halfx) - min(second_halfx));
    % apply these properties
    opts.StartPoint = [astart, cstart];
    % Fit model to data.
    
    [fitresult2nd, ~] = fit( xData, yData, ft, opts );
%--------------------------------------------------------------------------
end 
