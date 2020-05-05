function [] = PltOpCh_pm_l(inputStr, figno, KRVn, PMn, RESn, Ln)
% Plotting function for looking at the profiles for optimal channels given
% different start fields.
        
    count = 1;

    a = cellstr(num2str(inputStr.varst.PM(PMn)'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(inputStr.varst.Lengths(Ln)'.*100, 'L = %-gcm '));

    legendCell = cell(1,(size(PMn,2)*size(Ln,2)));
   
    figure(figno); clf;
    for pm = 1:length(PMn)
        for l = 1:length(Ln)

                plt1 = inputStr.SWres(KRVn,:,PMn(pm),RESn, Ln(l)); plt1(plt1 == 0) = [];
                semilogy(plt1,'x'); hold on 
                title 'Viewing the channel profile'
                xlabel 'Channel number'
                ylabel 'Field Value [T]'
                
                legendCell(count) = append(a(pm),b(l)); count = count+1;

        end 
    end  
            
    legend(legendCell, 'Location', 'Northeast')
    
end

