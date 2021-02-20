<<<<<<< HEAD
[zz] = fol_data_ext_function();
% data folder
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\Si particles High res V2
%%
ind = [3,5,7,9];
fac = -4e-7;
gg = figure;

for pp = 1:4
    subplot(2,2,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
    end
    plot(x(1:length(x)/2),y(1:length(y)/2).*1e6)
    xlabel 'Angle [deg]'
    ylabel 'Moment [\mum]'
end
title 'P-AP - 3000'
subplot(2,2,1);title 'AP-P - 2000'
subplot(2,2,2);title 'P-AP - 2000'
subplot(2,2,3);title 'AP-P - 3000'



%%
ind = [7,9];
fac = -10e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);  
        p1 = (mean(y(70:111)));
        p2 = (mean(y(191:222)));
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
        p1 = (mean(y(70:111)));
        p2 = (mean(y(191:222)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x(70:222),y(70:222))
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 3000'; vline([123.5,125])
subplot(2,1,2);title 'P-AP - 3000'; vline([60.3 62.5])

%%
[zz1] = fol_data_ext_function();
% data folder
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\SP8313_rotational_switching_as
%%
ind = [39,41];
fac = 30e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz1(ind(pp)).data(2:51,9);
    if rem(pp,2)
        y = zz1(ind(pp)).data(2:51,12)- fac/2.*x;         
        p1 = (mean(y(1:7)));
        p2 = (mean(y(end-22:end)));
        
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz1(ind(pp)).data(2:51,12)+ fac.*x;
        p1 = (mean(y(1:13)));
        p2 = (mean(y(end-10:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x,y)
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 3000'; vline([116.4,116.9])
subplot(2,1,2);title 'P-AP - 3000'; vline([73,73.3])

%%
ind = [27,29];
fac = 30e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz1(ind(pp)).data(2:101,9);
    if rem(pp,2)
        y = zz1(ind(pp)).data(2:101,12)- fac/2.*x;         
        p1 = (mean(y(1:7)));
        p2 = (mean(y(end-22:end)));
        
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz1(ind(pp)).data(2:101,12)+ fac.*x;
        p1 = (mean(y(1:13)));
        p2 = (mean(y(end-10:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x,y)
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 2000'; vline([131,131.7])
subplot(2,1,2);title 'P-AP - 2000'; vline([62.8,63.3])

%%

ind = [3,5];
fac = -4e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);
        p1 = (mean(y(3:153)));
        p2 = (mean(y(end-100:end)));
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
        p1 = (mean(y(5:55)));
        p2 = (mean(y(end-100:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    plot(x(1:length(x)/2),y(1:length(y)/2))
    xlabel 'Angle [deg]'
    ylabel 'Moment [\mum]'
end
subplot(2,1,1);title 'AP-P - 2000'; vline([147.6,150.8])
subplot(2,1,2);title 'P-AP - 2000'; vline([52.1,46.4])

=======
[zz] = fol_data_ext_function();
% data folder
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\Si particles High res V2
%%
ind = [3,5,7,9];
fac = -4e-7;
gg = figure;

for pp = 1:4
    subplot(2,2,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
    end
    plot(x(1:length(x)/2),y(1:length(y)/2).*1e6)
    xlabel 'Angle [deg]'
    ylabel 'Moment [\mum]'
end
title 'P-AP - 3000'
subplot(2,2,1);title 'AP-P - 2000'
subplot(2,2,2);title 'P-AP - 2000'
subplot(2,2,3);title 'AP-P - 3000'



%%
ind = [7,9];
fac = -10e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);  
        p1 = (mean(y(70:111)));
        p2 = (mean(y(191:222)));
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
        p1 = (mean(y(70:111)));
        p2 = (mean(y(191:222)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x(70:222),y(70:222))
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 3000'; vline([123.5,125])
subplot(2,1,2);title 'P-AP - 3000'; vline([60.3 62.5])

%%
[zz1] = fol_data_ext_function();
% data folder
% C:\Users\JDZ\Documents\Thesis\Data\SP8313_rotational_switching_as\SP8313_rotational_switching_as
%%
ind = [39,41];
fac = 30e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz1(ind(pp)).data(2:51,9);
    if rem(pp,2)
        y = zz1(ind(pp)).data(2:51,12)- fac/2.*x;         
        p1 = (mean(y(1:7)));
        p2 = (mean(y(end-22:end)));
        
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz1(ind(pp)).data(2:51,12)+ fac.*x;
        p1 = (mean(y(1:13)));
        p2 = (mean(y(end-10:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x,y)
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 3000'; vline([116.4,116.9])
subplot(2,1,2);title 'P-AP - 3000'; vline([73,73.3])

%%
ind = [27,29];
fac = 30e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz1(ind(pp)).data(2:101,9);
    if rem(pp,2)
        y = zz1(ind(pp)).data(2:101,12)- fac/2.*x;         
        p1 = (mean(y(1:7)));
        p2 = (mean(y(end-22:end)));
        
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz1(ind(pp)).data(2:101,12)+ fac.*x;
        p1 = (mean(y(1:13)));
        p2 = (mean(y(end-10:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    
    plot(x,y)
    xlabel 'Angle [deg]'
    ylabel 'Normalised moment'
end
subplot(2,1,1);title 'AP-P - 2000'; vline([131,131.7])
subplot(2,1,2);title 'P-AP - 2000'; vline([62.8,63.3])

%%

ind = [3,5];
fac = -4e-7;
gg = figure;

for pp = 1:2
    subplot(2,1,pp)
    x = zz(ind(pp)).data(:,9);
    if rem(pp,2)
        y = zz(ind(pp)).data(:,12);
        p1 = (mean(y(3:153)));
        p2 = (mean(y(end-100:end)));
        y = ((y) - p1)./abs(p1-p2);
    else
        y = zz(ind(pp)).data(:,12)+ fac.*x;
        p1 = (mean(y(5:55)));
        p2 = (mean(y(end-100:end)));
        y = ((y) - p2)./abs(p1-p2);
    end
    plot(x(1:length(x)/2),y(1:length(y)/2))
    xlabel 'Angle [deg]'
    ylabel 'Moment [\mum]'
end
subplot(2,1,1);title 'AP-P - 2000'; vline([147.6,150.8])
subplot(2,1,2);title 'P-AP - 2000'; vline([52.1,46.4])

>>>>>>> refs/remotes/origin/master
