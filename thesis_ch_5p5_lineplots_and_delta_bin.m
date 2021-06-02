%%

%% graph plotter for SV34p2. Shows max possible channels for a linescan in L

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p2.mat')
ist = SaveVar34p2;
plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.Lengths;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'L [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\ns_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist

%% Plot the difference between histogram bins for a dataset, with changing binsize.

clear;
gg = figure;
nbins0 = 40;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p2.mat')
ist = SaveVar34p2;
for count = 1:4
    hh = figure;
    L1 = length(ist.varst.Lengths);
    lp = squeeze(ist.SWres);
    nbins = nbins0.*(2^(count-1));
    datstr = zeros(L1, nbins);
    m0dat = zeros(L1, nbins);

    for uu = 1:L1

        dat1 = nonzeros(lp(:,uu)).*1e4;
        h = histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
        datstr(uu,:) = h.Values;
        if uu == 1
            m0 = h.Values;
        end 
        m0dat(uu,:) = h.Values - m0;
    end 

    close(hh.Number)
    difdatstr = diff(datstr,2);

    figure(gg.Number)
    subplot(2,2,count);
    inputno = 6;
    channel_max = max(lp, [], 'all').*1e4;
    binsize = channel_max./nbins;
    xdat = linspace(binsize./2,channel_max -(binsize./2),nbins);
    for uu = 1:inputno
        ind = 1+((L1-1).*(uu-1)./(inputno-1));
        plot(xdat,m0dat(ind,:),'--+');
        hold on
    end 


    ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
    temp = ist.varst.Lengths(ind).*1e2;
    legendCell = cellstr(num2str(temp', 'L = %-g [cm]')); 
    legend(legendCell, 'Location', 'Northeast')
    xlim([0,1000])
    xlabel 'Centre of bin [Oe]'
    ylabel '\Delta\eta  from L=2 [cm]';
    title (['binsize = ', num2str(binsize), ' [Oe]']);
    thesis_fig_gen(gg.Number)
end 


%%

%%

%% graph plotter for SV34p1. Shows max possible channels for a linescan in OD

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p1.mat')
ist = SaveVar34p1;

plt1 = zeros(1, size(ist.varst.PM,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.PM;
j = figure; 
plot(xs.*1000, plt1)
xlabel 'OD [mm]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\ns_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 0.9*mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist


%% Plot the difference between histogram bins for a dataset, with changing binsize.

clear;
gg = figure;
nbins0 = 40;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p1.mat')
ist = SaveVar34p1;
for count = 1:4
    hh = figure;
    L1 = length(ist.varst.PM);
    lp = squeeze(ist.SWres);
    nbins = nbins0.*(2^(count-1));
    datstr = zeros(L1, nbins);
    m0dat = zeros(L1, nbins);

    for uu = 1:L1

        dat1 = nonzeros(lp(:,uu)).*1e4;
        h = histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
        datstr(uu,:) = h.Values;
        if uu == 1
            m0 = h.Values;
        end 
        m0dat(uu,:) = h.Values - m0;
    end 

    close(hh.Number)
    difdatstr = diff(datstr,2);

    figure(gg.Number)
    subplot(2,2,count);
    inputno = 6;
    channel_max = max(lp, [], 'all').*1e4;
    binsize = channel_max./nbins;
    xdat = linspace(binsize./2,channel_max -(binsize./2),nbins);
    for uu = 1:inputno
        ind = 1+((L1-1).*(uu-1)./(inputno-1));
        plot(xdat,m0dat(ind,:),'--+');
        hold on
    end 


    ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
    temp = ist.varst.PM(ind).*1e2;
    legendCell = cellstr(num2str(temp', 'OD = %-g [cm]')); 
    legend(legendCell, 'Location', 'Northeast')
    xlim([0,1000])
    xlabel 'Centre of bin [Oe]'
    ylabel '\Delta\eta  from OD=2 [cm]';
    title (['binsize = ', num2str(binsize), ' [Oe]']);
    thesis_fig_gen(gg.Number)
end 

%%

%%

%% graph plotter for SV34p3. Shows max possible channels for a linescan in s_rad

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p3.mat')
ist = SaveVar34p3;

plt1 = zeros(1, size(ist.varst.s_rad,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

j = figure; 
xs = ist.varst.s_rad;
plot(xs.*1000, plt1)

xlabel 'Sample radius [mm]'
ylabel '\eta'

jj = gca;
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\nID = 6 [mm]\n\nB_0 = ', num2str(ist.varst.RES), ' [T]']);
text(mean(jj.XLim), 1.05*mean(jj.YLim), tt);

thesis_fig_gen(j.Number)

clear tt j jj kk lp ist plt1


%% Plot the difference between histogram bins for a dataset, with changing binsize.

clear;
gg = figure;
nbins0 = 40;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p3.mat')
ist = SaveVar34p3;
for count = 1:4
    hh = figure;
    L1 = length(ist.varst.s_rad);
    lp = squeeze(ist.SWres);
    nbins = nbins0.*(2^(count-1));
    datstr = zeros(L1, nbins);
    m0dat = zeros(L1, nbins);

    for uu = 1:L1

        dat1 = nonzeros(lp(:,uu)).*1e4;
        h = histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
        datstr(uu,:) = h.Values;
        if uu == 1
            m0 = h.Values;
        end 
        m0dat(uu,:) = h.Values - m0;
    end 

    close(hh.Number)
    difdatstr = diff(datstr,2);

    figure(gg.Number)
    subplot(2,2,count);
    inputno = 6;
    channel_max = max(lp, [], 'all').*1e4;
    binsize = channel_max./nbins;
    xdat = linspace(binsize./2,channel_max -(binsize./2),nbins);
    for uu = 1:inputno
        ind = 1+((L1-1).*(uu-1)./(inputno-1));
        plot(xdat,m0dat(ind,:),'--+');
        hold on
    end 


    ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
    temp = ist.varst.s_rad(ind).*1e3;
    legendCell = cellstr(num2str(temp', 's_r_a_d = %-g [mm]')); 
    legend(legendCell, 'Location', 'Northeast')
    xlim([0,1000])
    xlabel 'Centre of bin [Oe]'
    ylabel '\Delta\eta  from s_r_a_d=1 [mm]';
    title (['binsize = ', num2str(binsize), ' [Oe]']);
    thesis_fig_gen(gg.Number)
end 

%%

%%

%% graph plotter for SV34p4. Shows max possible channels for a linescan in B_0

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p4.mat')
ist = SaveVar34p4;

plt1 = zeros(1, size(ist.varst.Lengths,2));

lp = squeeze(ist.SWres);

for kk = 1:size(lp,2)
    plt1(kk) = nnz(lp(:,kk))-1;
end 

xs = ist.varst.RES;
j = figure; 
plot(xs, plt1)
xlabel 'B_0 [T]'
ylabel '\eta'

jj = gca; 
tt = compose(['KRV = ', num2str(ist.varst.KRV), '\n\nOD = ', num2str(ist.varst.PM*1000), ' [mm]\n\nL = ', num2str(ist.varst.Lengths*1000), ' [mm]\n\ns_r_a_d = ', num2str(ist.varst.s_rad*1000), ' [mm]\n\nID = 6 [mm]']);
text(mean(jj.XLim), mean(jj.YLim), tt);
thesis_fig_gen(j.Number)

clear tt j jj kk lp ist plt1



%% Plot the difference between histogram bins for a dataset, with changing binsize.

clear;
gg = figure;
nbins0 = 60;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV34p4.mat')
ist = SaveVar34p4;
for count = 1:4
    hh = figure;
    L1 = length(ist.varst.RES);
    lp = squeeze(ist.SWres);
    nbins = nbins0.*(2^(count-1));
    datstr = zeros(L1, nbins);
    m0dat = zeros(L1, nbins);

    for uu = 1:L1

        dat1 = nonzeros(lp(:,uu)).*1e4;
        h = histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
        datstr(uu,:) = h.Values;
        if uu == 1
            m0 = h.Values;
        end 
        m0dat(uu,:) = h.Values - m0;
    end 

    close(hh.Number)
    difdatstr = diff(datstr,2);

    figure(gg.Number)
    subplot(2,2,count);
    inputno = 6;
    channel_max = max(lp, [], 'all').*1e4;
    binsize = channel_max./nbins;
    xdat = linspace(binsize./2,channel_max -(binsize./2),nbins);
    for uu = 1:inputno
        ind = 1+((L1-1).*(uu-1)./(inputno-1));
        plot(xdat,m0dat(ind,:),'--+');
        hold on
    end 


    ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
    temp = ist.varst.RES(ind);
    legendCell = cellstr(num2str(temp', 'B_0 = %-g [T]')); 
    legend(legendCell, 'Location', 'Northeast')
    xlim([0,1000])
    xlabel 'Centre of bin [Oe]'
    ylabel '\Delta\eta  from B_0=0.6 [T]';
    title (['binsize = ', num2str(binsize), ' [Oe]']);
    thesis_fig_gen(gg.Number)
end 

