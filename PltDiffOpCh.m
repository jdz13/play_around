function [] = PltDiffOpCh(inputStr, figno, KRVn, PMn)
% Plotting function for looking at the profiles for optimal channels given
% different start fields.

    figure(figno); clf;

    for RESn = 1:size(inputStr.SWres,4)

        plt0 = (inputStr.SWres(KRVn,:,PMn,RESn)); plt0(plt0 == 0) = []; 
        plt1 = diff(plt0); %plt1(size(plt1,2)) = [];
        plt2 = inputStr.SWres(KRVn,:,PMn,RESn); plt2(plt2 == 0) = []; plt2(size(plt2,2)) = [];
        plot(plt2, plt1*1e3,'x'); hold on 
        title 'Viewing the channel profile'
        xlabel 'Field [T]'
        ylabel 'Difference in consecutive channel values [mT]'

    end

    legendCell = cellstr(num2str(inputStr.varst.RES', 'Starting at a field of %-gT')); 
    legend(legendCell, 'Location', 'Northeast')

end

