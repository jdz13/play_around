function [] = MOKE_histogram_plotter_no_percent_plus_shift(ist, figno, inmeth)
%% MOKE histogram plotter - minor loops

%% minor loop analysis 

    if strcmp(inmeth, 'minor')
    
        H1a = zeros(1, size(ist,2)); H1c = H1a; H2a = H1a; H2c = H1a;

        for count = 1:size(ist,2)

           H1a(count) = ist(count).fitresult1st.a;
           H1c(count) = ist(count).fitresult1st.c;

           H2a(count) = ist(count).fitresult2nd.a;
           H2c(count) = ist(count).fitresult2nd.c;

        end 

        pc1 = abs(200*pi./H1c./H1a);
        pc2 = abs(200*pi./H2c./H2a);

        figure (figno); clf;  set(gcf, 'Position',  [100, 100, 550, 400])
        subplot(2,2,3); histfit(H1c,10)
        pd = fitdist(H1c','Normal'); xlabel 'Field [Oe]'; title 'H1 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,4); histfit(H1a,10); pd = fitdist(H1a','Normal');
        xlabel 'a [Oe^-^1]'; title 'H1 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,1); histfit(H2c,10); pd = fitdist(H2c','Normal');
        xlabel 'Field [Oe]'; title 'H2 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,2); histfit(H2a,10); pd = fitdist(H2a','Normal');
        xlabel 'a [Oe^-^1]'; title 'H2 breadth'
        h = gca; text(h.Lim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])


%% Major loop analsis

    elseif strcmp(inmeth, 'major')
        
        H2a = zeros(1, size(ist,2)); H2c = H2a; H3a = H2a;
        H3c = H2a; H4a = H2a; H4c = H2a; H5a = H2a; H5c = H2a;


        for count = 1:size(ist,2)
           H2a(count) = ist(count).fitresult1st.a;
           H2c(count) = ist(count).fitresult1st.c;

           H3a(count) = ist(count).fitresult2nd.a;
           H3c(count) = -ist(count).fitresult2nd.c;
        
        end 
        
        for  count = size(ist,2)+1:2*size(ist,2)
            
           H2a(count) = ist(count-size(ist,2)).fitresult3rd.a;
           H2c(count) = -ist(count-size(ist,2)).fitresult3rd.c;

           H3a(count) = ist(count-size(ist,2)).fitresult4th.a;
           H3c(count) = ist(count-size(ist,2)).fitresult4th.c;
        end 
       
        figure (figno); clf;  set(gcf, 'Position',  [100, 100, 550, 400])
        subplot(2,2,1); histfit(H2c,10); pd = fitdist(H2c','Normal'); 
        xlabel 'Field [Oe]'; title 'H2 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,2); histfit(H2a,10); pd = fitdist(H2a','Normal');
        xlabel 'a [Oe]'; title 'H2 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,3); histfit(H3c,10); pd = fitdist(H3c','Normal');
        xlabel 'Field [Oe]'; title 'H3 location'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        subplot(2,2,4); histfit(H3a,10); pd = fitdist(H3a','Normal');
        xlabel 'a [Oe]'; title 'H3 breadth'
        h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])

        
%         
%         figure(figno+1); clf ; set(gcf, 'Position',  [100, 100, 550, 400])
%         subplot(2,2,1); histfit(H4c,10); pd = fitdist(H4c','Normal'); 
%         xlabel 'Field [Oe]'; title 'H4 location'
%         h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
% 
%         subplot(2,2,2); histfit(H4a,10); pd = fitdist(H4a','Normal');
%         xlabel 'a [Oe]'; title 'H4 breadth'
%         h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
%        
%         subplot(2,2,3); histfit(H5c,10); pd = fitdist(H5c','Normal');
%         xlabel 'Field [Oe]'; title 'H5 location'
%         h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
% 
%         subplot(2,2,4); histfit(H5a,10); pd = fitdist(H5a','Normal');
%         xlabel 'a [Oe]'; title 'H5 breadth'
%         h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
%         
    else 
        error ('please correct your input method')
        
    end 
    
    end
    