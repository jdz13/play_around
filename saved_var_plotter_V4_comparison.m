function [] = saved_var_plotter_V4_comparison (ist,figno,MxB)
% ist is the input structure, designed from the new function
% should only now need that input and what figure you would like and it
% will sort the rest. 

thrsh = MxB(3,size(MxB,2)); %Why is this a 3? I should change this. 
% If we want the smallest value from any magnet, we could use min(MxB(MxB > 0),[],'all') 
% Else if we would like the smallest field from the biggest magnet , we could use max(MxB(:,size(MxB,2),:),[],'all')

plotter = zeros(length(ist.varst.KRV), length(ist.varst.PM), length(ist.varst.RES),length(ist.varst.Lengths));
str = inputname(1);

for i = 1:length(ist.varst.KRV)
    for j = 1:length(ist.varst.PM)
        for k = 1:length(ist.varst.RES)
            for l = 1:length(ist.varst.Lengths)
                plotter(i,j,k,l) = nnz(ist.SWres(i,:,j, k, l)>thrsh);
            end 
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

KRVno = 1;

figure(figno); clf;
    for jj = 1:length(ist.varst.RES)
        subplot(nox,noy,jj); imagesc(ist.varst.PM.*100, ist.varst.Lengths.*100, flipud(squeeze(plotter(KRVno,:,jj,:))'));
        xlabel 'PM size [cm]'; ylabel 'Lengths [cm]'; title (['Start field = ', num2str(ist.varst.RES(jj)),'T'])
        caxis([min(plotter,[],'all'),max(plotter,[],'all')]); colorbar
        
        ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(ist.varst.Lengths)+1);
        trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
        yticks(trial);    yticklabels((fliplr(ist.varst.Lengths)));
        
        trial = linspace(ax.XLim(1),ax.XLim(2),length(ist.varst.PM)+1);
        trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
        xticks(trial);    xticklabels(((ist.varst.PM)));
        
        
        if jj == ceil(noy/2)
            title (compose("Data for " + str + "\nKRV  = [" + num2str(ist.varst.KRV) + "], Con = " + num2str(ist.varst.CON) + "\n" + ist.comments + "\n \n Start field = " + num2str(ist.varst.RES(jj)) + "[T]"))
        end 
    end
end