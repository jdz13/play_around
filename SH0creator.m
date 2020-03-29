function [SH0test] = SH0creator(inputStr)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

SH0test = zeros(size(inputStr.SWres));

for gg = 1:size(inputStr.SWres,4)
    SH0test(:,1,:,gg) = inputStr.varst.RES(gg).*1.05;
end

for k = 1:size(inputStr.SWres,1)
    for l = 2:size(inputStr.SWres,2)
        for m = 1:size(inputStr.SWres,3)
            for n = 1:size(inputStr.SWres,4)
                
                var = (inputStr.SWres(k,l,m,n) + inputStr.SWres(k,l-1,m,n))/2;
                
                if var == 0
                    
                    SH0test (k,l-2:l,m,n) = 0;
                else
                    
                    SH0test (k,l,m,n) = var;
                end 
                
                
            end 
        end
    end 
end

clear k l m n inputStr gg


end

