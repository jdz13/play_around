function [] = PltDeltaDiff(inputStr, figno, KRVn, RESn, PMn)
% Plotting the difference between set values and actual values as both an
% absolute value and percentage difference.

    Dset = inputStr.SH0 - inputStr.Bset;
    Dpset = Dset./inputStr.SH0.*100;

    plt1 = Dset(KRVn,:,PMn,RESn); plt1(plt1 == 0) = [];

    figure(figno); clf;
    subplot(1,2,1)
    plot(plt1)
    title 'Difference between set and actual field values'
    xlabel 'Channel number'
    ylabel 'Absolute difference'

    subplot(1,2,2)
    plot(Dpset(KRVn,:,PMn,RESn))
    title 'Percentage difference'
    xlabel 'Channel number'
    ylabel 'Percentage difference'

end

