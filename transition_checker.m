ist = min_bigstr; 
inmeth = 'minor';
figstart = 115;


for yy = 1:size(ist,2)
    figure(figstart); clf;
    plot(ist(yy).datax, rescale(ist(yy).datay), 'k-');
    hold on
    if strcmp(inmeth, 'major')
        plot(ist(yy).fitresult1st, 'g:')
        plot(ist(yy).fitresult2nd, 'r:')
        plot(ist(yy).fitresult3rd, 'b:')
        plot(ist(yy).fitresult4th, 'm:')
    elseif strcmp(inmeth, 'minor')
        plot(ist(yy).fitresult1st, 'g:')
        plot(ist(yy).fitresult2nd, 'r:'
        )
    end 
    xlabel 'Field [Oe]'
    ylabel 'Normalised Kerr rotation'
    title (num2str(yy))
    w = waitforbuttonpress;
end

%%
clear pltr pltr2
for yy = 1:size(ist,2)
    if strcmp(inmeth, 'major')
        pltr(yy,1) = ist(yy).fitresult1st.a;
        pltr(yy,2) = ist(yy).fitresult2nd.a;
        pltr(yy,3) = ist(yy).fitresult3rd.a;
        pltr(yy,4) = ist(yy).fitresult4th.a;
        pltr2(yy,1) = ist(yy).fitresult1st.c;
        pltr2(yy,2) = ist(yy).fitresult2nd.c;
        pltr2(yy,3) = ist(yy).fitresult3rd.c;
        pltr2(yy,4) = ist(yy).fitresult4th.c;
    elseif strcmp(inmeth, 'minor')
        pltr(yy,1) = ist(yy).fitresult1st.a;
        pltr(yy,2) = ist(yy).fitresult2nd.a;
        pltr2(yy,1) = ist(yy).fitresult1st.c;
        pltr2(yy,2) = ist(yy).fitresult2nd.c;
    end 
end 

figure(figstart+1); clf;
subplot(1,2,1)
plot(pltr)
xlabel 'data set n'
ylabel 'a value for each transition'
title 'Analysis of which transition is best'
legend ('1st','2nd','3rd','4th','Location', 'Southeast')
subplot(1,2,2)
plot(pltr2)
xlabel 'data set n'
ylabel 'c value for each transition'
legend ('1st','2nd','3rd','4th','Location', 'Southeast')
title 'Evidence of transition locations'