function [newnormy2] = MOKEwagrad(inputx, inputy, pc, thrs, inmeth)

    [TF,~,~] = ischange(inputy,'linear','Threshold',thrs);
    j = find(TF == 1);
    
    pol2 = (inputx(round(size(inputx,1)/2)) - inputx(1))/abs(inputx(round(size(inputx,1)/2)) - inputx(1));
    
    if strcmp(inmeth, 'minor')
            
        if pol2 == 1
            P_val = [inputx(1) (1+pc)*inputx(j(1)); (1-pc)*inputx(j(1)), inputx(round(0.5*size(inputx,1))); ...
            inputx(round(0.5*size(inputx,1)))+1, (1-pc)*inputx(j(2)); (1+pc)*inputx(j(2)), inputx(size(inputx,1))];

        elseif pol2 == -1 
            P_val = [inputx(1) (1-pc)*inputx(j(1)); (1+pc)*inputx(j(1)), inputx(round(0.5*size(inputx,1))); ...
            inputx(round(0.5*size(inputx,1)))+1, (1+pc)*inputx(j(2)); (1-pc)*inputx(j(2)), inputx(size(inputx,1))];
        end
        
    elseif strcmp(inmeth, 'major')

            P_val = [inputx(1) (1+pc)*inputx(j(1)); (1-pc)*inputx(j(1)), (1-pc)*inputx(j(2)); ...
           (1+pc)*inputx(j(2)),inputx(round(0.5*size(inputx,1)));...
           inputx(round(0.5*size(inputx,1)))+1, (1+pc)*inputx(j(3));...
            (1-pc)*inputx(j(3)), (1-pc)*inputx(j(4)); (1+pc)*inputx(j(4)), inputx(size(inputx,1))];
  
    elseif strcmp(inmeth, 'single')
        
        if pol2 == 1
            P_val = [inputx(1) (1+pc)*inputx(j(1)); (1-pc)*inputx(j(1)), inputx(size(inputx,1))];

        elseif pol2 == -1 
            P_val = [inputx(1) (1-pc)*inputx(j(1)); (1+pc)*inputx(j(1)), inputx(size(inputx,1))];
        end
        
    else 
        error ('please correct your input method')
        
    end
    
    
    t = 1;
    
    P_ind = zeros(size(P_val,1),size(P_val,2));

    for pp = 1:size(P_val,1)
        for gg = 1:size(P_val,2)

            pol = (P_val(pp,2) - P_val(pp,1))/abs((P_val(pp,2) - P_val(pp,1)));

            if pol == -1
                Pr = find(inputx(t:end) <= P_val(pp,gg),1,'first');
                P_ind(pp,gg) = t + Pr - 1;
            elseif pol == 1
                Pr = find(inputx(t:end) >= P_val(pp,gg),1,'first');
                P_ind(pp,gg) = t + Pr - 1;
            end

            t = P_ind(pp,gg);

        end 

        
    end 


    cumsize = 0;
    cumweight = 0;

    for n = 1:size(P_ind,1)
        Sec(n).section = inputy(P_ind(n,1):P_ind(n,2));
        Sec(n).average = mean(inputy(P_ind(n,1):P_ind(n,2)));
        Sec(n).fit = polyfit(inputx(P_ind(n,1):P_ind(n,2)),inputy(P_ind(n,1):P_ind(n,2)),1);
        Sec(n).size = size(inputy(P_ind(n,1):P_ind(n,2)),1);
        Sec(n).weight = Sec(n).size*Sec(n).fit(1);
        cumsize = cumsize + size(inputy(P_ind(n,1):P_ind(n,2)),1); 
        cumweight = cumweight + Sec(n).weight;
    end

    waGrad = cumweight/cumsize;

    newydata = inputy - (waGrad*inputx);
%%
        % find the scalar factor that will produce a noise average to noise
        % average range of 1. 
    if strcmp(inmeth, 'minor')
        
        avflat1 = mean([Sec(1).average, Sec(4).average]);
        avflat2 = mean([Sec(2).average, Sec(3).average]);
                
    elseif strcmp(inmeth, 'major')
        
        avflat1 = mean([Sec(1).average, Sec(6).average]);
        avflat2 = mean([Sec(3).average, Sec(4).average]);
           
    elseif strcmp(inmeth, 'single')
        
        avflat1 = Sec(1).average;
        avflat2 = Sec(2).average;
           
    end
    
        sfactor = abs(1/(diff([avflat1,avflat2])));
        
        % Shift the data to centre noisebases around [0,1]
        newnormy = rescale(newydata); % this is the cheating that means we don't centre around the noisebase
        
        newnormy2 = (newydata .* sfactor) - (min([avflat1,avflat2]).* sfactor);
        
end 