function [ ] = MOKE_SAF_major_loops(figno,Tpt)
%% Function built to plot all Major loops in the format that Dot asked for before.
% Weighted average gradient of all saturated/flat areas has been
% calculated and subtracted. The data has been averaged to 0-1 too,
% including noise base. Will take a folders worth of data and evaluate it. 

% As a minor note, it does expect the data to be exported processed data
% from LXpro - .txt files . If you haven't processed/exported data it can
% be adapted to account for this (though it will not factor for elipticity
% etc.).

    tic

% convert platinum thickness from seconds to thickness 
Ptcal = 0.053; % nm/s
Pt_nm = Tpt * Ptcal;

% how much you need the signal to change to define a new section. Will try
% to make programmatic soon. 
thrs = 10;

% The amount of percent (0.2 = 20%) that we apply from the change point to
% section out our data
pc = 0.20;


% fetch the data folder.
    path = uigetdir; % Let the user select the folder that they want to convert.
    oldFolder = cd (path); % Change directory and remember the old one to go back to.

    zz = dir(path);% This finds all of the files in this folder.
    
  
%     B_mat = zeros(size(data1,1),length(zz)-2); Moke_data = B_mat; 
%     Normset = zeros(ind(2)-ind(1)+1, length(zz)-2); newnormy = Normset;
%     a = zeros(1,length(zz)-2); c = a;
%     
%     initialise the figure to fill    
    figure(figno); clf;
    
% loop over all of the files in the directory
for p = 1:length(zz)-2 % 3 as first two are always directories.


    filename = [path,'\',zz(p+2).name];
            % open the file - makes it so matlab can read it (%r)
            fid = fopen(filename,'r');
            % read the file 
            data1 = readmatrix(filename); 


    [TF,S1,S2] = ischange(data1(:,2),'linear','Threshold',thrs);
    j = find(TF == 1);

    a = data1(:,1); 

    P_val = [a(1) (1+pc)*a(j(1)); (1-pc)*a(j(1)), (1-pc)*a(j(2)); (1+pc)*a(j(2)), a(round(0.5*size(data1,1))); ...
        a(round(0.5*size(data1,1))), (1+pc)*a(j(3)); (1-pc)*a(j(3)), (1-pc)*a(j(end)); (1+pc)*a(j(end)), a(size(data1,1))];

    t = 1;

    for pp = 1:size(P_val,1)
        for gg = 1:size(P_val,2)

            pol = (P_val(pp,2) - P_val(pp,1))/abs((P_val(pp,2) - P_val(pp,1)));

            if pol == -1
                Pr = find(data1(t:end,1) < P_val(pp,gg),1,'first');
                P_ind(pp,gg) = t + Pr;
            elseif pol == 1
                Pr = find(data1(t:end,1) < P_val(pp,gg),1,'last');
                P_ind(pp,gg) = t + Pr;
            end

            t = P_ind(pp,gg);

        end 

        
    end 


    cumsize = 0;
    cumweight = 0;

    for n = 1:size(P_ind,1)
        Sec(n).section = data1(P_ind(n,1):P_ind(n,2),2);
        Sec(n).average = mean(data1(P_ind(n,1):P_ind(n,2),2));
        Sec(n).fit = polyfit(data1(P_ind(n,1):P_ind(n,2),1),data1(P_ind(n,1):P_ind(n,2),2),1);
        Sec(n).size = size(data1(P_ind(n,1):P_ind(n,2),2),1);
        Sec(n).weight = Sec(n).size*Sec(n).fit(1);
        cumsize = cumsize + size(data1(P_ind(n,1):P_ind(n,2),2),1); 
        cumweight = cumweight + Sec(n).weight;
    end

    waGrad = cumweight/cumsize;

    newydata = data1(:,2) - (waGrad*data1(:,1));

        % find the scalar factor that will produce a noise average to noise
        % average range of 1. 
        sfactor = abs(1/(diff([mean([Sec(1).average, Sec(6).average]),mean([Sec(3).average, Sec(4).average])])));

        % Shift the data to centre noisebases around [0,1]
        newnormy = (newydata.*sfactor) - (sfactor.*mean([Sec(3).average, Sec(4).average]));
        figure(figno);
        plot(data1(:,1), newnormy,'-'); hold on;
          
    
end


% get matlab back to normal.
    fclose('all');
    cd (oldFolder) % Change back to the old directory. As not to confuse everyone. 

    hline(1, ':'); hline (0, ':');
    
    title 'All Major loops' 
    xlabel 'Field [Oe]'
    ylabel 'Normalised Kerr rotation'
    legendCell = cellstr(num2str(Pt_nm', 'T_P_t = %-g [nm] '));
    legend (legendCell, 'Location', 'Southeast')
    
    toc
end

