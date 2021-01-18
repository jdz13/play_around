
[xx] = Mumax_data_extractor();
% [yy] = Mumax_data_extractor();
%%
inputstr = xx;
figno = 10;

% n = round(size(inputstr.Bx,3)/2);
n = 35;
xline = inputstr.Mdl_dtl.purelinex; % linspace(-5, 5,100);
yline = inputstr.Mdl_dtl.pureliney; % linspace(-5, 5,100);
[X,Y] = meshgrid(xline, yline);
z = inputstr.Mdl_dtl.purelinez(n);
mu0 = 4*pi*1e-7;
l = 1e-5; M = 1e6;


BAkoun = zeros(size(X,1),size(X,2),3);

for xcount = 1:size(xline,2)
        for ycount = 1:size(yline,2)
                 
            x = X(xcount,ycount); y = Y(xcount,ycount);
            [HyAkoun, HzAkoun, HxAkoun] = Jannsen(y,z,x,[2*l,2*l,2*l]);
            BAkoun(xcount,ycount,1) = HxAkoun; BAkoun(xcount,ycount,2) = HyAkoun; BAkoun(xcount,ycount,3) = HzAkoun; 
        
        end 
end 


h1 = figure(figno); clf;
h11 = subplot(1,3,1);
imagesc(xx.Mdl_dtl.purelinex, xx.Mdl_dtl.purelinex, xx.Bx(:,:, n))
xlabel 'X [m]'; ylabel 'Y [m]';
title 'Mumax data'
colorbar; 
polarmap
% set(h11, 'clim', [-0.09,0.09])
h12 = subplot(1,3,2);
imagesc(xline, yline, flipud(rot90(BAkoun(:,:,3))))
xlabel 'X [m]'; ylabel 'Y [m]';
title 'Akoun data'
colorbar
% set(h12, 'clim', [-0.09,0.09])
h13 = subplot(1,3,3);
constfac = get(h11, 'clim')./get(h12, 'clim');
imagesc(xline, yline, (xx.Bx(:,:, n) - (flipud(rot90(BAkoun(:,:,3))).*constfac(1)))./xx.Bx(:,:, n).*100)
colorbar; title 'Percentage difference over the whole space';
xlabel 'X [m]'; ylabel 'Y [m]';
`