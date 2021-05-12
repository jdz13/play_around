function [] = MOKE_histogram_plotter_all(major_str,minor_str, figno)
%% MOKE histogram plotter - minor loops

%% minor loop analysis 

ist = minor_str;
    
        H1a = zeros(1, size(ist,2)); H1c = H1a; H2a = H1a; H2c = H1a;

        for count = 1:size(ist,2)

           H1a(count) = 1./ist(count).fitresult1st.a;
           H1c(count) = ist(count).fitresult1st.c;

           H2a(count) = 1./ist(count).fitresult2nd.a;
           H2c(count) = ist(count).fitresult2nd.c;
           
        end 


%% Major loop analsis

ist = major_str;

        H2a1 = zeros(1, size(ist,2)); H2c = H2a1; H3a = H2a1; H3c = H2a1;

        for count = 1:size(ist,2)
           H2a1(count) = 1./ist(count).fitresult1st.a;
           H2c(count) = ist(count).fitresult1st.c;

           H3a(count) = 1./ist(count).fitresult2nd.a;
           H3c(count) = -ist(count).fitresult2nd.c;
        
        end 
        
        for  count = size(ist,2)+1:2*size(ist,2)
            
           H2a1(count) = 1./ist(count-size(ist,2)).fitresult3rd.a;
           H2c(count) = -ist(count-size(ist,2)).fitresult3rd.c;

           H3a(count) = 1./ist(count-size(ist,2)).fitresult4th.a;
           H3c(count) = ist(count-size(ist,2)).fitresult4th.c;
        end 
       
        H2a1 = [H2a1, H2a];
        
        figure (figno); clf;  set(gcf, 'Position',  [100, 100, 550, 400])
        subplot(3,2,1); histfit(H1c,10); pd = fitdist(H1c','Normal'); 
        xlabel 'Field [Oe]'; title 'H_1 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(3,2,2); histfit(H1a,10); pd = fitdist(H1a','Normal');
        xlabel 'a [Oe]'; title 'H_1 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        
        subplot(3,2,3); histfit(H2c,10); pd = fitdist(H2c','Normal'); 
        xlabel 'Field [Oe]'; title 'H_2 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(3,2,4); histfit(H2a1,10); pd = fitdist(H2a1','Normal');
        xlabel 'a [Oe]'; title 'H_2 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(3,2,5); histfit(H3c,10); pd = fitdist(H3c','Normal');
        xlabel 'Field [Oe]'; title 'H_3 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(3,2,6); histfit(H3a,10); pd = fitdist(H3a','Normal');
        xlabel 'a [Oe]'; title 'H_3 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        
        figure(figno+1)
        subplot(1,3,1); 
        ist = minor_str;
        for count = 1:size(ist,2)
            plot(ist(count).fitresult1st)
            hold on
        end 
        xlabel 'Field [Oe]'
        ylabel 'Modelled transition'
        title 'Modelled H_1 transitions'
        
        subplot(1,3,2); 
        ist = minor_str;
        for count = 1:size(ist,2)
            plot(ist(count).fitresult2nd.c)
            hold on
        end 
        ist = minor_str;
        for count = 1:size(ist,2)
            plot(ist(count).fitresult1st)
%             plot(ist(count).fitresult3rd)
            hold on
        end               
        xlabel 'Field [Oe]'
        ylabel 'Modelled transition'
        title 'Modelled H_1 transitions'
        
        subplot(1,3,3); 
        ist = minor_str;
        for count = 1:size(ist,2)
            plot(ist(count).fitresult1st)
            hold on
        end 
        xlabel 'Field [Oe]'
        ylabel 'Modelled transition'
        title 'Modelled H_1 transitions'
        
end
    