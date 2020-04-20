function [] = PltStartSw(inputStr, figno, KRVn, PMn)

plt = zeros(size(inputStr.ind1res));

for o = 1:size(inputStr.ind1res,1)
    for p = 2:size(inputStr.ind1res,2)
        for q = 1:size(inputStr.ind1res,3)
            for r = 1:size(inputStr.ind1res,4)
                
                if inputStr.ind1res(o,p,q,r) == 0
                    
                    continue
                else
                    plt(o,p-1,q,r) = inputStr.varst.theta(1,inputStr.ind1res(o,p,q,r));
  
                end
              
            end 

%remember to rad2deg this
        end 
    end 
end
dplt = rad2deg(plt);

figure(figno); clf;

for RESn = 1:size(inputStr.varst.RES,2)
    
    plt1 = dplt(KRVn,:,PMn,RESn); plt1(plt1==0) = [];
    plt2 = inputStr.SWres(KRVn,:,PMn,RESn); plt2(plt2 == 0) = []; plt2(size(plt2,2)) = [];
    plot(plt2, plt1,'x-'); hold on 
    title 'Viewing the start angle'
    xlabel 'Field value [T]'
    ylabel 'Start position of beginning to reach threshold value [deg]'

end


legendCell = cellstr(num2str(inputStr.varst.RES', 'Starting at a field of %-gT')); 
legend(legendCell, 'Location', 'Southeast')

clear inputStr o p q r

end 
