function[Data_str, fit_results] = MOKE_data_in(figno, ind, Tpt)

    % fetch the data folder.
    path = uigetdir; % Let the user select the folder that they want to convert.
    oldFolder = cd (path); % Change directory and remember the old one to go back to.

    tic

    zz = dir(path);% This finds all of the files in this folder.
    
    % figure out how long a data file is to make empty matricies to fill.
    filename = [path,'\',zz(3).name];  fopen(filename,'r'); data1 = readmatrix(filename);

    % initialise variables
    B_mat = zeros(size(data1,1),length(zz)-2); Moke_data = B_mat; 
    Normset = zeros(ind(2)-ind(1)+1, length(zz)-2); newnormy = Normset;
    a = zeros(1,length(zz)-2); c = a;
    
    % initialise the figure to fill    
    figure(figno); clf;
    
    % loop over all of the files in the directory
    for p = 1:length(zz)-2 % 3 as first two are always directories.

        % concenate the string together to get a full file path
        filename = [path,'\',zz(p+2).name];
        % open the file - makes it so matlab can read it (%r)
        fid = fopen(filename,'r');
        % read the file 
        data1 = readmatrix(filename); 
        % extract the field values
        B_mat(:,p) = data1(:,end-1);
        % extract the kerr rotation (non normalised)
        Moke_data(:,p) = data1(:,end);
        
        % take the data which is relevant (denoted by function input 'ind'
        % This would normally be the first switch range.
        Normset(:,p) = rescale(data1(ind(1):ind(2),2));
        
        % close the file so matlab is happy (unnecessary but a good habit)
        fclose(fid); %close the file in Matlab
        
        % prepare the data for fitting
        [xData, yData] = prepareCurveData( B_mat(ind(1):ind(2),p), Normset(:,p) );

        % Set up fittype and options. Define the eq. for a sigmoid here.
        ft = fittype( '1 ./(1 + exp(-a*(x-c)));', 'independent', 'x', 'dependent', 'y' );
        opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
        opts.Display = 'Off';
        
        % find rough parameters for the fit 
        % start with a. Easiest to find the midway point (where == 0.5 on
        % normalised curve)
        cstartin = find(Normset(:,p) >= 0.5 , 1,'last');
        cstart = B_mat(ind(1)+cstartin,p);        
        
        % inverse of property found through Origin. Seems to work well. 
        astart = 20/(max(xData) - min(xData));
        % apply these properties
        opts.StartPoint = [astart cstart];
        
        % Fit model to data.
        [fitresult, ~] = fit( xData, yData, ft, opts );
    
%         ----------------------------------------------------------------

        addpath(oldFolder);
        % Run the slope correction and normalisation tool;
        [newnormy(:,p), waGrad, Sfactor] = MOKE_norm_WA_tool( Normset(:,p),B_mat(ind(1):ind(2),p),fitresult);
        
        % Fit model to data.
        [xData, yData] = prepareCurveData( B_mat(ind(1):ind(2),p), newnormy(:,p) );
        [fitresult, gof] = fit( xData, yData, ft, opts );
        
%         ----------------------------------------------------------------
        % plot the results - both data and fit. 
        plot( fitresult,':',  xData, yData, '-' );hold on
        
        a(p) = fitresult.a; c(p) = fitresult.c;

        % extract the fit information to a structure that we could pull out
        fit_results(p).fitresult = fitresult;
        fit_results(p).gof = gof;
        fit_results(p).init = opts.StartPoint;
        
%         ----------------------------------------------------------------

        fit_results(p).waGrad = waGrad;
        fit_results(p).Sfactor = Sfactor;
        
%         ----------------------------------------------------------------

             
    end 

    % Find the normalised B, so we can add it to the output structure. 
    Bnorm = B_mat(ind(1):ind(2),:);
  
    % Build the output data structure. 
    Data_str.Bnorm = Bnorm;
    Data_str.Normset = Normset;
    Data_str.B_mat = B_mat;
    Data_str.Moke_data = Moke_data;
    Data_str.a = a;
    Data_str.c = c;
      
    % give the plot some labels.
    xlabel 'Field [Oe]'
    ylabel 'Normalised Kerr rotation'
    legendCell(1:2:(2*length(Tpt) - 1)) = cellstr(num2str(Tpt', 'T_P_t = %-g [s] '));
    legendCell(2:2:(2*length(Tpt))) = cellstr(num2str(Tpt', 'fit, T_P_t = %-g [s] '));
    legend (legendCell, 'Location', 'Southeast')
    thesis_fig_color_sorter(figno, Tpt, 'double')
    
    % convert platinum thickness from seconds to thickness 
    Ptcal = 0.053; % nm/s
    Pt_nm = Tpt * Ptcal;
        
    Data_str.Tpt = Tpt;
    Data_str.Pt_nm = Pt_nm;  
    
    % Look at plotting/extracting information from our curves
    figure(figno + 1); clf
    
    % prepare the data for fitting the polynomial curve
    [xData, yData] = prepareCurveData(Pt_nm, Data_str.c );

    
%     % Set up fittype and options.
     ft = fittype( 'Exp1' );
    

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft );
    subplot(1,2,2); plot( fitresult, 'r-', xData, yData, 'rx--' );
    title 'Comparing c values'; xlabel 'Platinum thickness T_P_t [nm]'; ylabel 'c [Oe]'
    hold on
    fstring = evalc('fitresult');
    fstring(1:13) = [];
    thesis_fig_color_sorter(figno+1, 3:4, 'single')
    
    yL=get(gca,'YLim'); 
    xL=get(gca,'XLim'); 
    
    xt = xL(1) + 0.33*(diff(xL));
    yt = yL(2) - 0.33*(diff(yL));
    
    %text(xt,yt, fstring)
    
    fit_results(1).polyfit = fitresult;
    fit_results(2).polyfit = gof;
    
    subplot(1,2,1); plot (Pt_nm, Data_str.a, 'x--'); 
    title 'Comparing a values'; xlabel 'Platinum thickness T_P_t [nm]'; ylabel 'a [Oe^-^1]'
    hold on
    
    % look at differentiated signal 
    dfdat = diff(Normset);
    
    figure(figno+2); clf;
    for pp = 1:size(dfdat, 2)
        plot(Bnorm(2:end,pp), dfdat(:,pp)); hold on
    end 
    
    title 'Differentiated signal'
    ylabel 'Differentiated normalised Kerr rotation'
    xlabel ' Field [Oe]' 
    legendCell = cellstr(num2str(Tpt', 'T_P_t = %-g [s] '));
    legend (legendCell, 'Location', 'Southeast')
    thesis_fig_color_sorter(figno+2, Tpt, 'single')
    
    Data_str.dfdat = dfdat;
    
    % get matlab back to normal.
    fclose('all');
    cd (oldFolder) % Change back to the old directory. As not to confuse everyone. 
    toc
   
end 
