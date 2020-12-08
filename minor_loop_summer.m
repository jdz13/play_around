%% minor loop evaluator
function [bigstr, additiveM] = minor_loop_summer (figno)

 tic

% convert platinum thickness from seconds to thickness 
Ptcal = 0.0703; % nm/s

% how much you need the signal to change to define a new section. Will try
% to make programmatic soon. 
thrs = 10;

% The amount of percent (0.2 = 20%) that we apply from the change point to
% section out our data
pc = 0.20;

clear bigstr

% fetch the data folder.
    path = uigetdir; % Let the user select the folder that they want to convert.
    oldFolder = cd (path); % Change directory and remember the old one to go back to.

    zz = dir(path);% This finds all of the files in this folder.
    
%     initialise the figure to fill    
    figure(figno); clf;
    
    additiveM = zeros (1000,1);
    
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

        [TF,S1,S2] = ischange(data1(:,2),'linear','Threshold',thrs);
        j = find(TF == 1);

        bigstr(p).data = data1;

        additiveM = additiveM + data1(:,2);

        clear data1
    end


plot(bigstr(p).data(:,1), rescale(additiveM)) 
xlabel 'Field Oe'
ylabel 'Nomalised summation of all data'

fclose('all');
cd (oldFolder) % Change back to the old directory. As not to confuse everyone. 
toc

end 