function [] = PltDistCh(inputStr, figno, KRVn, PMn)
% Plotting function for looking at the profiles for optimal channels given
% different start fields.

    figure(figno); clf;

    ply = zeros(size(inputStr.SWres));
    
    for o = 1:size(inputStr.SWres,1)
        for p = 1:size(inputStr.SWres,2)
            for q = 1:size(inputStr.SWres,3)
                for n = 1:size(inputStr.SWres,4)
                   
                    f = inputStr.SWres(o,p,q,n);
                    ind = find (inputStr.MxB(q,:,q) >= f, 1, 'last');
                    
                    ply(o,p,q,n) = inputStr.probe_line(q,ind);
                    
                end 
            end 
        end 
    end 

    for RESn = 1:size(inputStr.SWres,4)

        plt1 = ply(KRVn,:,PMn,RESn); plt1(plt1 == inputStr.probe_line(PMn,size(inputStr.probe_line,2))) = [];
        plot(plt1,'x-'); hold on 
        title 'Viewing the channel profile'
        xlabel 'Channel number'
        ylabel 'Distance from the magnet surface [m]'

    end

    legendCell = cellstr(num2str(inputStr.varst.RES', 'Starting at a field of %-gT')); 
    legend(legendCell, 'Location', 'Southeast')

end

