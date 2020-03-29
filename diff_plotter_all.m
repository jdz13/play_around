function [] = diff_plotter_all(ist1,ist2, figno)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here

    if size(ist1.SWres) ~= size(ist2.SWres)
        disp 'The two inputs are different sizes, this isn''t possible'
    else 

        thrsh = ist1.MxB(3,size(ist1.MxB,2));
        plotter1 = zeros(length(ist1.varst.KRV), length(ist1.varst.PM)-1, length(ist1.varst.RES));
        plotter2 = plotter1;

        str1 = inputname(1);
        str2 = inputname(2);

        for i = 1:length(ist1.varst.KRV)
            for j = 1:length(ist1.varst.PM)
                for k = 1:length(ist1.varst.RES)
                       plotter1(i,j,k) = nnz(ist1.SWres(i,:,j, k)>thrsh);
                       plotter2(i,j,k) = nnz(ist2.SWres(i,:,j, k)>thrsh);
                end 
            end 
        end

        dplotter = plotter1 - plotter2;

        nox = 2;
        if rem(length(ist1.varst.RES),2) ==1
            noy = length(ist1.varst.RES)+1/2;
        else 
            noy = length(ist1.varst.RES)/2;
        end

        figure(figno); clf;
            for jj = 1:length(ist1.varst.RES)
                subplot(nox,noy,jj); imagesc(ist1.varst.PM, ist1.varst.KRV,dplotter(:,:,jj));
                xlabel 'PM size [cm]'; ylabel 'KRV'; title (['Start field = ', num2str(ist1.varst.RES(jj)),'T'])
                caxis([min(dplotter,[],'all'),max(dplotter,[],'all')]); colorbar
                ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(ist1.varst.KRV)+1);
                trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
                yticks(trial);    yticklabels((fliplr(ist1.varst.KRV)));

                if jj == ceil(noy/2)
                    title (compose("Data for " + str1 + " minus " + str2 + "\nKRV  = [" + num2str(ist1.varst.KRV) + "], PM sizes = [" + num2str(ist1.varst.PM(1:3)) + "], Con = " + num2str(ist1.varst.CON) + "\n \n Start field = " + num2str(ist1.varst.RES(jj)) + "T"))
                end 
            end
    end 
    
end

