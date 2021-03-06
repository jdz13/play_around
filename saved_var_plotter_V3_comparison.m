function [] = saved_var_plotter_V3_comparison (ist,figno,MxB)
% ist is the input structure, designed from the new function
% should only now need that input and what figure you would like and it
% will sort the rest. 

%thrsh = MxB(3,size(MxB,2)); %Why is this a 3? I should change this. 
% If we want the smallest value from any magnet, we could use min(MxB(MxB > 0),[],'all') 
% Else if we would like the smallest field from the biggest magnet , we could use max(MxB(:,size(MxB,2),:),[],'all')

thrsh = max(MxB(:,size(MxB,2),:),[],'all');

plotter = zeros(length(ist.varst.KRV), length(ist.varst.PM)-1, length(ist.varst.RES));
str = inputname(1);

for i = 1:length(ist.varst.KRV)
    for j = 1:length(ist.varst.PM)
        for k = 1:length(ist.varst.RES)
               plotter(i,j,k) = nnz(ist.SWres(i,:,j, k)>thrsh);
        end 
    end 
end


if length(ist.varst.RES) == 1
    nox = 1;
    noy = 1;
else
    nox = 2;
    if rem(length(ist.varst.RES),2) ==1
        noy = length(ist.varst.RES)+1/2;
    else 
        noy = length(ist.varst.RES)/2;
    end
end 

figure(figno); clf;
    for jj = 1:length(ist.varst.RES)
        subplot(nox,noy,jj); imagesc(ist.varst.PM, ist.varst.KRV,plotter(:,:,jj));
        xlabel 'PM size [cm]'; ylabel 'KRV'; title (['Start field = ', num2str(ist.varst.RES(jj)),'T'])
        caxis([min(plotter,[],'all'),max(plotter,[],'all')]); colorbar
        ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(ist.varst.KRV)+1);
        trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
        yticks(trial);    yticklabels((fliplr(ist.varst.KRV)));
        
        if jj == ceil(noy/2)
            title (compose("Data for " + str + "\nKRV  = [" + num2str(ist.varst.KRV) + "], PM sizes = [" + num2str(ist.varst.PM) + "], Con = " + num2str(ist.varst.CON) + "\n" + ist.comments + "\n \n Start field = " + num2str(ist.varst.RES(jj)) + "T"))
        end 
    end
end