% looking at Dot's field fall off given different L and pm_cl values

    figno = 9;
    pm_cl = [2,6,10].*1e-2;
    L = [2,6,10].*1e-2;

    D_prac = 10e-2; N_probe = 101; M = 1e6;

    [MxB, probe_line] = MxBProbeMulti(M,pm_cl,L,D_prac,N_probe);


    col={'x','o','d','*','^','s','x','+','p','.'};
    count = 1;


    a = cellstr(num2str(pm_cl'.*100, 'OD = %-gcm, '));
    b = cellstr(num2str(L'.*100, 'L = %-gcm '));

    legendCell = cell(1,(size(pm_cl,2)*size(L,2)));
    
    figure(figno); clf;
        for jj = 1:size(MxB,1)
            for kk = 1:size(MxB,3)


                semilogy((probe_line(jj,:) - pm_cl(jj)/2).*100, MxB(jj,:,kk).*1e4, col{jj})
                if jj == 1 && kk == 1, hold on, end
                xlabel 'Distance from magnet surface [cm]'
                ylabel 'Maximum field on axis [Oe]'

                legendCell(count) = append(a(jj),b(kk)); count = count+1;

            end 
        end 

   legend(legendCell, 'Location', 'Southwest')
   
   title 'Maximum field profiles on axis for different aspect ratio magnets'
