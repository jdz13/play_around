function [] = thesis_fig_color_sorter(figno, values, method)

    figure(figno);
    cnumrun = ["k", "#0072BD",	"#D95319", "#EDB120", "#7E2F8E", "#77AC30", "#4DBEEE", "#A2142F"];
    check = get(gca, 'Children');

   values = fliplr(values);
    
    if strcmp(method,'single')
        for cnt = 1:length(values)

            cnt2 = values(cnt)-2;
            set(check(cnt), 'Color', (cnumrun(cnt2)))

        end

    elseif strcmp(method,'double')
        for cnt = 1:length(values)

            cnt2 = values(cnt)-2;
            set(check(2*cnt-1:2*cnt), 'Color', (cnumrun(cnt2)))

        end
    else 
        error ('Please input ''single'' or ''double'' as the method')
    end 
end 