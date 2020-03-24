function [MxB,B_a, probe_line] = CompDipoleMxB(figno, M,OD, L,D_prac,N_probe)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[MxB, probe_line] = MxBProbeMulti(M,OD, L,D_prac,N_probe);

 mu0  = 4 * pi * 1e-7;
 
 r = probe_line;

    B_a = zeros(length(OD),size(r,2),length(L));
    
     for m = 1:length(OD)
        for o = 1:length(L)
            for n = 1:size(r,1)
            
                V = pi .* (OD(m).^2) .* L(o);

                mo = M.*V; 

                B_a(m,:,o) = 2 .* mu0 .* mo ./ 4 ./ pi ./(r(o,:).^3);

            end 
        end 
     end 

     % Finding discrepancy
     
     absdiff = MxB - B_a;
     
     pdiff = absdiff./MxB.*100;
          
     %Plotting these up 
     
     figure(figno); clf;
     
     n = 1;
     
     for ODn = 1:length(OD)
         for Ln = 1:length(L)
             
             subplot(2,2,[1,2])
             plot (probe_line(ODn,:), MxB(ODn,:,Ln), '-o', probe_line(ODn,:), B_a(ODn,:,Ln), '-x')
             xlabel 'Distance from the magnet'
             ylabel 'Absolute difference [T]'
             title 'Absolute difference'

             subplot(2,2,3)
             plot (probe_line(ODn,:), absdiff(ODn,:,Ln))
             xlabel 'Distance from the magnet'
             ylabel 'Absolute difference [T]'
             title 'Absolute difference'


             subplot(2,2,4)
             plot (probe_line(ODn,:), pdiff(ODn,:,Ln))
             xlabel 'Distance from the magnet'
             ylabel 'Percentage difference [%]'
             title 'Percentage difference'

            n = n+1;

         end 
     end
     
     
end

