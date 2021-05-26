%% Minimum field and end of range for changing L.

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV33p2.mat')
ist = SaveVar33p2;

L1 = length(ist.varst.Lengths);
hh = figure; 
inputno = 6;

inds = 9000:10001;

for uu = 1:inputno
    ind = 1+((L1-1).*(uu-1)./5);
    dat1 = squeeze(ist.MxB(1,inds,ind))*1e4;
    x1 = (ist.probe_line(1,inds)-ist.varst.PM/2).*1e3;
    plot(x1, dat1, '--');
    hold on
end

ylabel 'B [Oe]'; xlabel 'p - distance from magnet [mm]'
ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
temp = ist.varst.Lengths(ind).*1e2;
legendCell = cellstr(num2str(temp', 'L = %-g [cm]')); 
legend(legendCell, 'Location', 'Northeast')
thesis_fig_gen(hh.Number)

gg = figure; 
plot(ist.varst.Lengths.*1e2, squeeze(ist.MxB(1,end,:)).*1e4, '+--')
xlabel 'L [cm]'
ylabel 'Minimum field (accidentally imposed) [Oe]'
thesis_fig_gen(gg.Number)

%% Equivalent to above for changing OD. 


load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV33p1.mat')
ist = SaveVar33p1;

L1 = length(ist.varst.PM);
lp = squeeze(ist.SWres);
hh = figure; 
inputno = 6;

inds = 9000:10001;

for uu = 1:inputno
    ind = 1+((L1-1).*(uu-1)./5);
    dat1 = squeeze(ist.MxB(ind,inds))*1e4;
    x1 = (ist.probe_line(ind,inds)-ist.varst.PM(ind)/2).*1e3;
    plot(x1, dat1, '--');
    hold on
end

ylabel 'B [Oe]'; xlabel 'p - distance from magnet [mm]'
ind = 1+((L1-1).*([1:inputno]-1)./(inputno-1));
temp = ist.varst.PM(ind).*1e2;
legendCell = cellstr(num2str(temp', 'OD = %-g [cm]')); 
legend(legendCell, 'Location', 'Northeast')
thesis_fig_gen(hh.Number)

gg = figure; 
plot(ist.varst.PM.*1e2, squeeze(ist.MxB(:,end)).*1e4, '+--')
xlabel 'OD [cm]'
ylabel 'Minimum field (accidentally imposed) [Oe]'
thesis_fig_gen(gg.Number)


%% Calculation to show feild decay for a given magnet and range. 
% Will tell you where a particular field is found too. 

D_prac = 100e-2; % maximum working distance for magnet surface-sample [m]
N_probe = 1001; % distance probe points in z, defining resolution 
M = 1e6; % Msat of magnet used for drive field [A/m]
IB = 6e-3; % Inner bore of the drive magnet [m]
L = 10e-2;
OD = 10e-2;

[MxB, probe_line] = MxBProbeMulti_V2(M,OD, L,D_prac,N_probe, IB); 

gg = figure;
semilogy((probe_line-OD/2).*1e3, MxB.*1e4)
ylabel 'B [Oe]'; xlabel 'p - distance from magnet [mm]'

cut = 10; % [Oe]
pind =  find((MxB.*1e4) >= cut, 1, 'last');
disp([num2str(cut),' [Oe] found at ', num2str((probe_line(pind)-OD./2).*1e3), ' [mm]'])

%% Plot the difference between histogram bins for a dataset, with changing binsize.

clear;
gg = figure;
nbins = 40;

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV33p2.mat')
ist = SaveVar33p2;
for count = 1:4
    hh = figure;
    L1 = length(ist.varst.Lengths);
    lp = squeeze(ist.SWres);
    nbins = nbins.*count;
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
    legendCell = cellstr(num2str(temp', 'OD = %-g [cm]')); 
    legend(legendCell, 'Location', 'Northeast')
    xlim([0,1000])
    xlabel 'Centre of bin [Oe]'
    ylabel 'Increase in bin from L=2 [cm]';
    title (['binsize = ', num2str(binsize), ' [Oe]']);
    thesis_fig_gen(gg.Number)
end 

%% Plot varying histograms through a series, for changing L and OD

clear
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p2.mat')
ist = SaveVar31p2;

nbins = 40;

L1 = length(ist.varst.Lengths);
lp = squeeze(ist.SWres);
hh = figure; 

for uu = 1:6
    ind = 1+((L1-1).*(uu-1)./5);
    dat1 = nonzeros(lp(:,ind)).*1e4;

    subplot(3,2, uu); histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
    xlabel 'B_n [Oe]'; title (['L = ', num2str(ist.varst.Lengths(ind).*1e2), ' [cm]'])
    %h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
    thesis_fig_gen(hh.Number)
    
end 

clearvars -except nbins     %deletes all variables except X in workspace
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV31p1.mat')
ist = SaveVar31p1;


L1 = length(ist.varst.PM);
lp = squeeze(ist.SWres);
hh = figure; 

for uu = 1:6
    ind = 1+((L1-1).*(uu-1)./5);
    dat1 = nonzeros(lp(:,ind)).*1e4;

    subplot(3,2, uu); histogram(dat1,nbins); %pd = fitdist(dat1','Normal'); 
    xlabel 'B_n [Oe]'; title (['OD = ', num2str(ist.varst.PM(ind).*1e2), ' [cm]'])
    %h = gca; text(h.XLim(1)+abs(0.02*h.XLim(1)),h.YLim(2)*0.85, ['x = ' num2str(pd.mu) newline '\sigma = ' num2str(pd.sigma)])
    thesis_fig_gen(hh.Number)
    
end 