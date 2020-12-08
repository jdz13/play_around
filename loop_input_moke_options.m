function [tot, bigstr] = loop_input_moke_options(figno, inmeth)    
%% loop evaluator. Prompts for user input - requires a folder of text files

   % figno lists the figure that results will be displayed to. 
   
   % inmeth is whether we are looking at major or minor loops. Please
   % select either 'major' or 'minor' (lower case)
    
    % how much you need the signal to change to define a new section. Will try
    % to make programmatic soon. 
    thrs = 10;

    % The amount of percent (0.2 = 20%) that we apply from the change point to
    % section out our data
    pc = 0.20;
 
    clear bigstr additiveM
    
    tic
    
    % fetch the data folder.
         path = uigetdir; % Let the user select the folder that they want to convert.
         oldFolder = cd (path); % Change directory and remember the old one to go back to.

         zz = dir(path);% This finds all of the files in this folder.

    %    initialise the figure to fill    
         figure(figno); clf;

         filename = [path,'\',zz(3).name]; fid = fopen(filename,'r');
         data1 = readmatrix(filename); additiveM = zeros (size(data1,1),1);

    % loop over all of the files in the directory
    for p = 1:length(zz)-2 % 3 as first two are always directories.


        filename = [path,'\',zz(p+2).name];
                % open the file - makes it so matlab can read it (%r)
                fid = fopen(filename,'r');
                % read the file 
                data1 = readmatrix(filename); 

                fac = (data1(1,2) - data1(round(size(data1,1)/2),2))/2;
                fac2 = (data1(1,2) + data1(round(size(data1,1)/2),2))/2;
                data1(:,2) = (data1(:,2)-fac2)./fac;

        addpath 'C:\Users\JDZ\Documents\MATLAB\GIT\play_around'
        
        % new function that allows different inputs in (major, minor, single)
        % and will return the data with subtraction of WAgrad and DC
        [newnormy2] = MOKEwagrad(data1(:,1), data1(:,2), pc, thrs, inmeth);

        bigstr(p).datax = data1(:,1);
        bigstr(p).datay = newnormy2;

            addpath('C:\Users\JDZ\Documents\MATLAB\GIT\play_around')
            if strcmp(inmeth, 'minor')

                [bigstr(p).fitresult1st,bigstr(p).fitresult2nd] = modelling_sigmoids_MOKE_multiple(bigstr(p).datax,bigstr(p).datay);

            elseif strcmp(inmeth, 'major')
                datax1 = bigstr(p).datax([1:round(size(bigstr(p).datax,1)/4),round(size(bigstr(p).datax,1)*3/4)+1:end]);
                datay1 = bigstr(p).datay([1:round(size(bigstr(p).datay,1)/4),round(size(bigstr(p).datay,1)*3/4)+1:end]);
                datax2 = bigstr(p).datax([round(size(bigstr(p).datax,1)/4)+1:round(size(bigstr(p).datax,1)/2),round(size(bigstr(p).datax,1)/2+1):round(size(bigstr(p).datax,1)*3/4)]);
                datay2 = bigstr(p).datay([round(size(bigstr(p).datay,1)/4)+1:round(size(bigstr(p).datay,1)/2),round(size(bigstr(p).datay,1)/2+1):round(size(bigstr(p).datay,1)*3/4)]);

                [bigstr(p).fitresult1st,bigstr(p).fitresult4th] = modelling_sigmoids_MOKE_multiple(datax1, datay1);
                [bigstr(p).fitresult2nd,bigstr(p).fitresult3rd] = modelling_sigmoids_MOKE_multiple(datax2, datay2);

            end 

        additiveM = additiveM + newnormy2;
        clear data1
    end
    
    tot.datax = bigstr(p).datax(:,1);
    tot.additiveMnorm = additiveM./size(bigstr,2);

            if strcmp(inmeth, 'minor')

                plot(bigstr(p).datax(:,1),tot.additiveMnorm) 
                [tot.fitresult1st,tot.fitresult2nd] = modelling_sigmoids_MOKE_multiple(bigstr(p).datax, tot.additiveMnorm);
                hold on;
                plot(tot.fitresult1st, 'g--')
                plot(tot.fitresult2nd, 'r--')
                legend ('Normalised superposed data', 'Fit, 1st transtion', 'Fit, 2nd transtion', 'Location', 'Northwest')

            elseif strcmp(inmeth, 'major')

                plot(bigstr(p).datax(:,1), tot.additiveMnorm) 
                datax1 = bigstr(p).datax([1:round(size(bigstr(p).datax,1)/4),round(size(bigstr(p).datax,1)*3/4)+1:end]);
                datay1 = tot.additiveMnorm([1:round(size(tot.additiveMnorm,1)/4),round(size(tot.additiveMnorm,1)*3/4)+1:end]);
                datax2 = bigstr(p).datax([round(size(bigstr(p).datax,1)/4)+1:round(size(bigstr(p).datax,1)/2),round(size(bigstr(p).datax,1)/2+1):round(size(bigstr(p).datax,1)*3/4)]);
                datay2 = tot.additiveMnorm([round(size(tot.additiveMnorm,1)/4)+1:round(size(tot.additiveMnorm,1)/2),round(size(tot.additiveMnorm,1)/2+1):round(size(tot.additiveMnorm,1)*3/4)]);
                [tot.fitresult1st,tot.fitresult4th] = modelling_sigmoids_MOKE_multiple(datax1, datay1);
                [tot.fitresult2nd,tot.fitresult3rd] = modelling_sigmoids_MOKE_multiple(datax2, datay2);
                hold on;
                plot(tot.fitresult1st, 'g--')
                plot(tot.fitresult2nd, 'r--')
                plot(tot.fitresult3rd, 'b--')
                plot(tot.fitresult4th, 'm--')
                legend ('Normalised superposed data', 'Fit, 1st transtion', 'Fit, 2nd transtion', 'Fit, 3rd transtion', 'Fit, 4th transtion', 'Location', 'Northwest')

            end

    xlabel 'Field [Oe]'
    ylabel 'Nomalised summation of all data'
    title (['Summation of ', inmeth, ' loops'])
    set(gca,'fontsize', 12)
    set(gcf, 'Position',  [100, 100, 540, 400]) 
    legend('boxoff')

    fclose('all');
    cd (oldFolder) % Change back to the old directory. As not to confuse everyone. 
    toc
end 