function [] = thesis_fig_gen(figno)
%%thesis figure generation 

    for cnt = 1:length(figno)
        figure(figno(cnt))
        set(gca,'fontsize', 11)
        set(gcf, 'Position',  [100, 100, 540, 400]) 
        h = gca; 
        if isempty(h.Legend) == 1
        else
            legend('boxoff')
        end 
    end
end 
