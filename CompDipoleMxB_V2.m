function [MxB,B_a, probe_line, output_structure] = CompDipoleMxB_V2(figno, M,OD, L,D_prac,N_probe, delta,ThreshPercent)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


[MxB, probe_line] = MxBProbeMulti(1e6,OD, L,D_prac,N_probe);

 mu0  = 4 * pi * 1e-7;
 
 r = probe_line;
 

    B_a = zeros(length(M),length(delta),length(OD),size(r,2),length(L));
    B_absdiff = zeros(length(M),length(delta),length(OD),length(L));
    B_pdiff = B_absdiff;
    B_maxpdiff = B_absdiff;
    B_belowP = B_absdiff;
    
for c = 1:length(M)
    
    for d = 1:length(delta)
        
        r = probe_line + delta(d);
        
        for m = 1:length(OD)
        
            for o = 1:length(L)
            
            V = pi .* ((OD(m)./2).^2) .* L(o);

            mo = M(c).*V; 

            B_a(c, d, m,:,o) = 2 .* mu0 .* mo ./ 4 ./ pi ./(r(o,:).^3);
            
            floater = abs(MxB) - abs(squeeze(B_a(c, d, m,:,o))');
            floater(1) = [];
            
            B_absdiff(c,d,m,o) = mean(abs(floater));
            
            B_pdiff(c,d,m,o) = mean(abs(floater./MxB(2:end).*100));
            
            B_maxpdiff(c,d,m,o) = max(abs(floater./MxB(2:end).*100), [], 'all');
            
            finder1 =  find(abs(abs(floater./MxB(2:end).*100)) >= ThreshPercent, 1, 'last')+1;

                if finder1 == length(probe_line)
                    B_belowP(c,d,m,o) = NaN;
                else
                    B_belowP(c,d,m,o) = r(finder1);
                end 
            
           end 
        end        
     end     
end

    output_structure.B_absdiff = B_absdiff;
    output_structure.B_pdiff = B_pdiff;
    output_structure.B_maxpdiff = B_maxpdiff;
    output_structure.B_belowP = B_belowP;
    output_structure.varst.M = M;
    output_structure.varst.OD = OD;
    output_structure.varst.L = L;
    output_structure.varst.D_prac = D_prac;
    output_structure.varst.N_probe = N_probe;
    output_structure.varst.delta = delta;
    output_structure.varst.ThreshPercent = ThreshPercent;
   
    
     figure(figno); clf;
     pcolor(output_structure.varst.delta, output_structure.varst.M, output_structure.B_belowP); colorbar; 
     xlabel 'Artificial dipole shift [mm]'; ylabel 'Artificial M value';
     
     [xy(1),xy(2)] = find(output_structure.B_belowP == min(output_structure.B_belowP, [] , 'all'));
     title (compose("Distance to reach consistent values under " +  num2str(output_structure.varst.ThreshPercent) + "% difference " ...
         + "\n \nMinimum found at M = " + num2str(M(xy(1))) + "[A/m] and Delta = " + num2str(delta(xy(2))*1e3) + "[mm]" ))
          
     figno = figno+1;
     figure(figno); clf;
     
     Mnew = M(xy(1));
     deltanew = delta(xy(2));
     r = probe_line + deltanew;
     V = pi .* ((OD./2).^2) .* L;
     mo = Mnew.*V; 
     B_a= 2 .* mu0 .* mo ./ 4 ./ pi ./(r.^3);
     floater = abs(abs(MxB) - abs(B_a));
     floater(1) = [];
     floater2 = abs(floater./MxB(2:end).*100);
     
     subplot(2,2,[1,2])
     loglog (probe_line(2:end), MxB(2:end), '--', probe_line(2:end), B_a(2:end), '--')
     xlabel 'Distance from the magnet'
     ylabel 'Field [T]'
     title 'Fields obtained by each method [T]'
     legend ('Calculated using Caciagli','Calculated from Dipole eq')
     
     subplot(2,2,3)
     loglog (probe_line(2:end), floater)
     xlabel 'Distance from the magnet'
     ylabel 'Absolute difference [T]'
     title 'Absolute difference'
     bb = 10^mean(log10(abs(xlim)))*(mean(xlim)/abs(mean(xlim)));
     cc = 10^mean(log10(abs(ylim)))*(mean(ylim)/abs(mean(ylim)));
     text (bb, cc,compose("\n\n\nMagnet OD = " + ... 
         num2str(OD*200) + "[cm] \nMagnet length = " + num2str(L*200) + "[cm]"))

     subplot(2,2,4)
     loglog (probe_line(2:end), floater2)
     xlabel 'Distance from the magnet'
     ylabel 'Percentage difference [%]'
     title 'Percentage difference'
     
     finder1 =  find(abs(floater2) >= ThreshPercent, 1, 'last');
       
     bb = 10^mean(log10(abs(xlim)))*(mean(xlim)/abs(mean(xlim)));
     cc = 10^mean(log10(abs(ylim)))*(mean(ylim)/abs(mean(ylim)));
     text (bb, cc, compose("\n\n\nValue is below " ...
         + num2str(ThreshPercent) + "% \nat D = " + num2str(probe_line(finder1)*1000) + "[mm]"...
         + "\nB_D = " + num2str(MxB(finder1)) + "[T]"))
     
     
     
     figno = figno + 1;
     figure(figno); clf;
     imagesc(output_structure.varst.delta, output_structure.varst.M, output_structure.B_absdiff); colorbar; 
     xlabel 'Artificial dipole shift [mm]'; ylabel 'Artificial M value';
     title (compose("Minimum found at M = " + num2str(M(xy(1))) + ...
         "[A/m] and Delta = " + num2str(delta(xy(2))*1e3) + "[mm] \n\nMean Absolute difference [T]"))
          
     
     figno = figno + 1;
     figure(figno); clf;
     imagesc(output_structure.varst.delta, output_structure.varst.M, output_structure.B_pdiff); colorbar; 
     xlabel 'Artificial dipole shift [mm]'; ylabel 'Artificial M value';
     
     [xy(1),xy(2)] = find(output_structure.B_pdiff == min(output_structure.B_pdiff, [] , 'all'));
     title (compose("Minimum found at M = " + num2str(M(xy(1))) + ...
         "[A/m] and Delta = " + num2str(delta(xy(2))*1e3) + "[mm] \n\nMean percentage difference [%]"))
          
     
     
     figno = figno + 1;
     figure(figno); clf;
     imagesc(output_structure.varst.delta, output_structure.varst.M, output_structure.B_maxpdiff); colorbar; 
     xlabel 'Artificial dipole shift [mm]'; ylabel 'Artificial M value';
     
     [xy(1),xy(2)] = find(output_structure.B_maxpdiff == min(output_structure.B_maxpdiff, [] , 'all'));
     title (compose("Minimum found at M = " + num2str(M(xy(1))) + ...
         "[A/m] and Delta = " + num2str(delta(xy(2))*1e3) + "[mm] \n\nMaximum percentage difference [%]"))
          
     
end

