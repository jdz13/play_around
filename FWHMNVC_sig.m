function [HWHMX,MLOC,indout] = FWHMNVC_sig(input,theta,con)
%FWHM Summary of this function goes here
%   Detailed explanation goes here
    temp.testline = abs(input);
   %%     
    temp.N1 = temp.testline(1);% This gives the maximum N value - this physically has to be the case. 
    
    if temp.testline(end) >= eps
        indout = [0,0];
        MLOC = 0;
        HWHMX = 0;
        return
    end 
    
    temp.indthet1 = [0,0]; % Initialise the variable
      %----------------------------------------------------------------------
    % find the first incidence of non maximum
        temp.indthet1(1) = find(temp.testline <= 0.99 ,1,'first'); 
        % find last after final peak (simpler)
        temp.indthet1(2) =  find(temp.testline <= 1e-2 ,1,'first');
        
        temp.ind_half = find(temp.testline <= 0.5 ,1,'first');
    %------------------------------------------------------    
   
    if temp.indthet1(1) == 1 && temp.indthet1(2) == size(input,2)
       temp.tlfwhm = temp.testline(temp.indthet1(1):temp.indthet1(2));
    elseif temp.indthet1(1) == 1
        temp.tlfwhm = temp.testline(temp.indthet1(1):temp.indthet1(2)+1);
    elseif temp.indthet1(2) == size(input,2)
        temp.tlfwhm = temp.testline(temp.indthet1(1)+1:temp.indthet1(2));
      
    else
        temp.tlfwhm = temp.testline(temp.indthet1(1)-1:temp.indthet1(2)+1);
    end
    
    if all(temp.tlfwhm == 0)
        HWHMX = 0;
    else
        temp.fractionx = temp.N1 * con; % 10-90% tests
        temp.index1 = find(temp.tlfwhm <= temp.fractionx, 1, 'first');
        % Find where the data last rises above half the max.
        temp.index2 = find(temp.tlfwhm <= (1 - temp.fractionx), 1, 'first');
        temp.fwhm = temp.index2-temp.index1 + 1;% FWHM in indexes.
        % OR, if you have an x vector
        HWHMX =  theta(temp.fwhm) + theta(2) - theta(1);
    end
        
    indout = temp.indthet1;

    MLOC = theta(temp.ind_half);
end

