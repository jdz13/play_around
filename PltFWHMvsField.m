function [] = PltFWHMvsField(inputStr, figno, KRVn, PMn)
% Plotting function for looking at the profiles for optimal channels given
% different start fields.

    figure(figno); clf;

    for RESn = 1:size(inputStr.FWHMres,4)

        plt1 = rad2deg(inputStr.FWHMres(KRVn,:,PMn,RESn)); plt1(plt1 == 0) = [];
        plt2 = inputStr.SWres(KRVn,:,PMn,RESn); plt2(plt2 == 0) = []; plt2(1) = [];
        plot(plt2, plt1,'+:'); hold on 
        title 'Viewing the channel profile'
        xlabel 'Field value [T]'
        ylabel 'FWHM [deg]'

    end

    legendCell = cellstr(num2str(inputStr.varst.RES', 'Starting at a field of %-gT')); 
    legend(legendCell, 'Location', 'Southeast')

end