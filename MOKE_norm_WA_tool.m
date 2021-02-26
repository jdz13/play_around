function [newnormy, waGrad, sfactor] = MOKE_norm_WA_tool(ist,ist2,fitresult)
% Properly sorts out the new data. Removes background slope by subtracting
% a weighted average of both parts of the switch. Then renormalises to the
% average within the noise for [0,1]. 

% variable fac can be used to change the start/end weighting for the
% averaging. 2 is default and works well. 
    
    % Work out the percentages for the fit, rather than using a.
    pcs = 200*pi./fitresult.a./fitresult.c;
    
    % give a fac value, one that multiplies the percentage to define
    % start/end points to look over each section. Needs to be more than one
    % to guarentee not including the tails of the slopes. 2 is accurate.
    fac = 2;

    % find where the indicies are that correspond to fac*% away. 
    ind(2) = find(ist2 <= ((1-(fac*pcs)/100) * fitresult.c), 1, 'first');
    ind(1) = find(ist2 <= ((1+(fac*pcs)/100) * fitresult.c), 1, 'first');
    
    % sectionalise the data
    sec1 = ist(1:ind(1));
    sec2 = ist(ind(2):end);
    
    % And find equivalent field section, so we can fit this data.
    B1 = ist2(1:ind(1));
    B2 = ist2(ind(2):end);
    
    % Fitting. Polynomial (order 1 - straight line). 
    fit1 = polyfit(B1,sec1,1);
    fit2 = polyfit(B2,sec2,1);

    % determine the weighted average gradient, to be taken off the whole
    % data set (y). 
    waGrad = ((fit1(1)*(length(sec1)))+(fit2(1)*(length(sec2))))/((length(sec1) + length(sec2)));

    % find the new data when the weighted average gradient is removed.
    newydata = ist - (waGrad*ist2);

    % find the mean for each section, now it is flattened out
    avd(1) = mean(newydata(1:ind(1)));
    avd(2) = mean(newydata(ind(2):end)); 
    
    % find the scalar factor that will produce a noise average to noise
    % average range of 1. 
    sfactor = 1/(abs(diff(avd)));
    
    % Shift the data to centre noisebases around [0,1]
    newnormy = (newydata.*sfactor) - (sfactor.*min(avd));
    
end

