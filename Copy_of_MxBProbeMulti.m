function [MxB, probe_line] = Copy_of_MxBProbeMulti(M,OD, L,D_prac,N_probe)
% MxBProbe - Finding the value on axis for a high resolution line variable.
% Will allow for selection of appropriate height to probe at.
%   
% OD - Outer diameter of the magnet, to define the surface from
% D_prac - Working distance, to define max distance from magnet surface
% N_probe - Number of probe points

mu0 = 4*pi*1e-7;

probe_line = zeros(length(OD),N_probe);



    for p = 1:length(OD)
        probe_line(p,:) = linspace(OD(p)/2, D_prac+(OD(p)/2), N_probe);
    end

MxB = zeros(length(OD),size(probe_line,2),length(L));

    for m = 1:length(OD)
        for o = 1:length(L)
            for n = 1:size(probe_line(m,:),2)

           [MxB(m,n,o)] = Hrho(M, probe_line(m,n), 0, 0, L(o)/2, OD(m)/2)*mu0;
           
            end
        end 
    end 

end