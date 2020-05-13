%% Plots the optimal channels for the four corners of a given run and compares with another run. 
%% should run just fine as a standalone. Just remember to change c titles

   
%-------------------------FILL THESE IN------------------------------------
inputStr1 = SaveVar11p1;
inputStr2 = SaveVar12p3;
ICS.KRV = 1; ICS.StartB = 1;
c = {'SaveVar11p1 -', 'SaveVar12p3'};  % remember to change this here 
%--------------------------------------------------------------------------
 
    a = cellstr(num2str(inputStr1.varst.PM'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(inputStr1.varst.Lengths'.*100, 'L = %-gcm '));
       
    count = 1;

    legendCell1 = cell(1,8);
       
    figure(132); clf;
    subplot(1,2,1)
    for rs = 1:length(c)
        for jj = [1,11]
            for kk = [1,11]
                if rs == 1
                    plt = inputStr1.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
                    plt(plt==0) = []; semilogy(plt,'x--'); hold on
                elseif rs == 2
                    plt = inputStr2.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
                    plt(plt==0) = []; semilogy(plt,'o--'); hold on
                end 
                legendCell1(count) = append(c(rs),a(kk),b(jj)); count = count+1;
                
            end 
        end
    end 
    xlabel 'Channel number'; ylabel 'Field value for a particular channel [T]'
    title (compose("Four corners, Optimum channels" )); legend (legendCell1)



    subplot(1,2,2)
    for rs = 1:length(c)
        for jj = [1,11]
            for kk = [1,11]
                if rs == 1
                        plt = inputStr1.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
                        plt(plt==0) = []; plt = diff(plt); semilogy(plt,'x--'); hold on
                elseif rs == 2
                        plt = inputStr2.SWres(ICS.KRV,:, kk, ICS.StartB, jj);
                        plt(plt==0) = []; plt = diff(plt); semilogy(plt,'o--'); hold on
                end 
            end
        end    
    end 
    title (compose("Four corners, difference between channels " ))
    xlabel 'Channel number'; ylabel 'Field difference between adjacent channels [T]'
    legend (legendCell1, 'Location', 'Southeast')
          
    clear legendCell1 a b c rs jj kk inputStr1 inputStr2 ICS plt