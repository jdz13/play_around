function [] = PltFWHMCh(inputStr, figno, KRVn, PMn)
% Plotting function for looking at the profiles for optimal channels given
% different start fields.

    figure(figno); clf;

    for RESn = 1:size(inputStr.FWHMres,4)

        plt1 = inputStr.FWHMres(KRVn,:,PMn,RESn); plt1(plt1 == 0) = [];
        plot(rad2deg(plt1),'x-'); hold on 
        title 'Viewing the channel profile'
        xlabel 'Channel number'
        ylabel 'FWHM [deg]'

    end

    legendCell = cellstr(num2str(inputStr.varst.RES', 'Starting at a field of %-gT')); 
    legend(legendCell, 'Location', 'Northeast')

end

