function [] = ifHomogWrong_plotter(inputStr,figno)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

 inputStr.plt.AvY = zeros(size(inputStr.varst.PM,2), size(inputStr.varst.Lengths,2));
    inputStr.plt.AvZ = inputStr.plt.AvY; inputStr.plt.AvT = inputStr.plt.AvY; inputStr.plt.pltpm = inputStr.plt.AvY; inputStr.plt.pltL = inputStr.plt.AvY;

    for cck = 1:size(inputStr.varst.PM,2)*size(inputStr.varst.Lengths,2)

        if rem(cck,size(inputStr.varst.Lengths,2)) == 0 

            inputStr.plt.AvY(ceil(cck/size(inputStr.varst.Lengths,2)),size(inputStr.varst.Lengths,2)) = inputStr.propkeepers(cck).MeanAvY;
            inputStr.plt.AvZ(ceil(cck/size(inputStr.varst.Lengths,2)),size(inputStr.varst.Lengths,2)) = inputStr.propkeepers(cck).MeanAvZ;
            inputStr.plt.AvT(ceil(cck/size(inputStr.varst.Lengths,2)),size(inputStr.varst.Lengths,2)) = inputStr.propkeepers(cck).MeanAvTheta;
            inputStr.plt.pltpm(ceil(cck/size(inputStr.varst.Lengths,2)),size(inputStr.varst.Lengths,2)) = inputStr.propkeepers(cck).pm;
            inputStr.plt.pltL(ceil(cck/size(inputStr.varst.Lengths,2)),size(inputStr.varst.Lengths,2)) = inputStr.propkeepers(cck).L;



        else

            inputStr.plt.AvY(ceil(cck/size(inputStr.varst.Lengths,2)),rem(cck,size(inputStr.varst.Lengths,2))) = inputStr.propkeepers(cck).MeanAvY;
            inputStr.plt.AvZ(ceil(cck/size(inputStr.varst.Lengths,2)),rem(cck,size(inputStr.varst.Lengths,2))) = inputStr.propkeepers(cck).MeanAvZ;
            inputStr.plt.AvT(ceil(cck/size(inputStr.varst.Lengths,2)),rem(cck,size(inputStr.varst.Lengths,2))) = inputStr.propkeepers(cck).MeanAvTheta;
            inputStr.plt.pltpm(ceil(cck/size(inputStr.varst.Lengths,2)),rem(cck,size(inputStr.varst.Lengths,2))) = inputStr.propkeepers(cck).pm;
            inputStr.plt.pltL(ceil(cck/size(inputStr.varst.Lengths,2)),rem(cck,size(inputStr.varst.Lengths,2))) = inputStr.propkeepers(cck).L;
        end
    end

    inputStr.plt.sq = (inputStr.plt.pltpm.^2 + inputStr.plt.pltL.^2).^0.5;

    figure(figno); clf; 
    subplot(2,2,1)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(inputStr.plt.AvY'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Y'; colorbar

    ax = gca; trialy = linspace(ax.YLim(1),ax.YLim(2),length(inputStr.varst.Lengths)+1);
    trialy = trialy - (trialy(2)-trialy(1))/2;    trialy(1) = [];
    yticks(trialy);    yticklabels((fliplr(inputStr.varst.Lengths)));

    trialx = linspace(ax.XLim(1),ax.XLim(2),length(inputStr.varst.PM)+1);
    trialx = trialx - (trialx(2)-trialx(1))/2;    trialx(1) = [];
    xticks(trialx);    xticklabels(((inputStr.varst.PM)));

    subplot(2,2,2)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(inputStr.plt.AvZ'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Z'; colorbar
    xticks(trialx);    xticklabels(((inputStr.varst.PM)));
    yticks(trialy);    yticklabels((fliplr(inputStr.varst.Lengths)));

    subplot(2,2,3)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(inputStr.plt.AvT'));
    xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Theta'; colorbar
    xticks(trialx);    xticklabels(((inputStr.varst.PM)));
    yticks(trialy);    yticklabels((fliplr(inputStr.varst.Lengths)));
    
    subplot(2,2,4)
    imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(inputStr.plt.sq'));
    xlabel 'PM'; ylabel 'Lengths'; title 'polarity checking (pm^2 + L^2)^0^.^5'; colorbar
    xticks(trialx);    xticklabels(((inputStr.varst.PM)));
    yticks(trialy);    yticklabels((fliplr(inputStr.varst.Lengths)));
    
end

